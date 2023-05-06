#' Retrieve Synthetic Test Data Used For Examples
#' @export
#' @rdname syn_test_data
syn_test_data <- function() {
  sd <- scda::synthetic_cdisc_data("rcd_2022_06_27")

  # to avoid bug
  attr(sd, "data_from") <- NULL

  # useful for ext01
  group <- list(
    list(
      "Dose administered during constant dosing interval",
      c(-Inf, 700, 900, 1200, Inf),
      c("<700", "700-900", "900-1200", ">1200")
    ),
    list(
      "Total dose administered",
      c(-Inf, 5000, 7000, 9000, Inf),
      c("<5000", "5000-7000", "7000-9000", ">9000")
    )
  )
  sd$adex <- dunlin::cut_by_group(as.data.frame(sd$adex), "AVAL", "PARAM", group, "AVALCAT1")
  sd$adsl$AAGE <- sd$adsl$AGE
  attr(sd$adsl$AAGE, "label") <- "Age (yr)"
  sd$adsl$AGEGR1 <- cut(sd$adsl$AGE, c(0, 65, 200), c("<65", ">=65"))
  attr(sd$adsl$AGEGR1, "label") <- "Age Group"
  sd$adex$AVALCAT1 <- factor(
    sd$adex$AVALCAT1,
    levels = c("<700", "700-900", "900-1200", ">1200", "<5000", "5000-7000", "7000-9000", ">9000")
  )

  set.seed(1, kind = "Mersenne-Twister")
  sd$adex <- sd$adex %>%
    distinct(USUBJID, .keep_all = TRUE) %>%
    mutate(
      PARAMCD = "TDURD",
      PARAM = "Overall duration (days)",
      AVAL = sample(x = seq(1, 250), size = n(), replace = TRUE),
      AVALCAT1 = factor(case_when(
        AVAL < 30 ~ "< 1 month",
        AVAL < 90 ~ "1 to <3 months",
        AVAL < 180 ~ "3 to <6 months",
        TRUE ~ ">=6 months"
      ), levels = c("< 1 month", "1 to <3 months", "3 to <6 months", ">=6 months"))
    ) %>%
    bind_rows(sd$adex)

  # Add AVALCAT1 CHGCAT1 for adeg
  sd$adeg <- sd$adeg %>%
    mutate(
      AVALCAT1 = case_when(
        PARAMCD == "QT" & AVAL <= 450 ~ paste("<=450", " ", AVALU),
        PARAMCD == "QT" & AVAL > 450 & AVAL <= 480 ~ paste(">450 to <=480", " ", AVALU),
        PARAMCD == "QT" & AVAL > 480 & AVAL <= 500 ~ paste(">480 to <=500", " ", AVALU),
        PARAMCD == "QT" & AVAL > 500 ~ paste(">500", " ", AVALU),
        PARAMCD == "QT" & is.na(AVAL) ~ "<Missing>"
      ),
      CHGCAT1 = case_when(
        PARAMCD == "QT" & CHG <= 30 ~ paste("<=30", " ", AVALU),
        PARAMCD == "QT" & CHG > 30 & CHG <= 60 ~ paste(">30 to <=60", " ", AVALU),
        PARAMCD == "QT" & CHG > 60 ~ paste(">60", " ", AVALU),
        PARAMCD == "QT" & is.na(CHG) ~ "<Missing>"
      ),
      AVALCAT1 = factor(AVALCAT1),
      CHGCAT1 = factor(CHGCAT1)
    )

  # useful for dmt01
  adsub <- sd$adsub
  adsub_wide_ls <- dunlin::poly_pivot_wider(
    adsub,
    id = "USUBJID",
    param_from = "PARAMCD",
    value_from = "AVAL",
    labels_from = "PARAM"
  )
  adsub_wide_aval <- adsub_wide_ls[["AVAL"]]

  sd$adsl <- sd$adsl %>% left_join(adsub_wide_aval, by = "USUBJID")

  # useful for dst01
  sd$adsl[["EOSSTT"]] <- as.factor(toupper(sd$adsl[["EOSSTT"]]))

  sd$adsl <- sd$adsl %>%
    mutate(EOTSTT = {
      set.seed(321)
      as.factor(sample(c("ONGOING", "COMPLETED", "DISCONTINUED"), nrow(sd$adsl), replace = TRUE))
    })

  # useful for lbt04, lbt05
  qntls <- sd$adlb %>%
    group_by(PARAMCD) %>%
    summarise(as_tibble(t(quantile(AVAL, probs = c(0.1, 0.9)))), .groups = "drop_last") %>%
    rename(q1 = 2, q2 = 3)

  sd$adlb <- qntls %>%
    left_join(sd$adlb, by = "PARAMCD", multiple = "all") %>%
    group_by(USUBJID, PARAMCD, BASETYPE) %>%
    mutate(
      ANRIND = factor(
        case_when(
          ANRIND == "LOW" & AVAL <= q1 ~ "LOW LOW",
          ANRIND == "HIGH" & AVAL >= q2 ~ "HIGH HIGH",
          TRUE ~ as.character(ANRIND)
        ),
        levels = c("", "HIGH", "HIGH HIGH", "LOW", "LOW LOW", "NORMAL")
      ),
      AVALCAT1 = factor(
        case_when(
          ANRIND %in% c("HIGH HIGH", "LOW LOW") ~ {
            set.seed(1)
            sample(x = c("LAST", "REPLICATED", "SINGLE"), size = n(), replace = TRUE, prob = c(0.3, 0.6, 0.1))
          },
          TRUE ~ ""
        ),
        levels = c("", "LAST", "REPLICATED", "SINGLE")
      )
    ) %>%
    ungroup() %>%
    mutate(
      PARCAT1 = {
        set.seed(2)
        as.factor(sample(c("CHEMISTRY", "COAGULATION", "HEMATOLOGY"), n(), replace = TRUE))
      },
      PARCAT2 = as.factor(case_when(
        ANRIND %in% c("HIGH HIGH", "LOW LOW") ~ "LS",
        TRUE ~ {
          set.seed(3)
          sample(c("LS", "CV", "SI"), size = n(), replace = TRUE)
        }
      ))
    ) %>%
    select(-q1, -q2)

  sd$adsl <- sd$adsl %>%
    mutate(ANL01FL = "Y")

  sd$adae <- sd$adae %>%
    mutate(AEBODSYS = with_label(.data$AEBODSYS, "MedDRA System Organ Class")) %>%
    mutate(AEDECOD = with_label(.data$AEDECOD, "MedDRA Preferred Term")) %>%
    mutate(ANL01FL = "Y") %>%
    mutate(ASEV = .data$AESEV) %>%
    mutate(AREL = .data$AEREL) %>%
    mutate(ATOXGR = .data$AETOXGR)

  sd$admh <- sd$admh %>%
    mutate(ANL01FL = "Y") %>%
    mutate(MHBODSYS = with_label(.data$MHBODSYS, "MedDRA System Organ Class")) %>%
    mutate(MHDECOD = with_label(.data$MHDECOD, "MedDRA Preferred Term"))

  sd$advs <- sd$advs %>%
    mutate(ANL01FL = "Y")

  sd$adcm <- sd$adcm %>%
    mutate(ANL01FL = "Y")

  sd
}

#' example data generated with syn_test_data()
#' @export
#' @rdname syn_test_data
syn_data <- syn_test_data()

usethis::use_data(syn_data, overwrite = TRUE)
