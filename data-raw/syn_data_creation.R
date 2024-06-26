#' Retrieve Synthetic Test Data Used For Examples
#' @export
#' @rdname syn_test_data
syn_test_data <- function() {
  sd <- list()
  sd$adsl <- random.cdisc.data::cadsl
  sd$adae <- random.cdisc.data::cadae
  sd$adaette <- random.cdisc.data::cadaette
  sd$adcm <- random.cdisc.data::cadcm
  sd$addv <- random.cdisc.data::caddv
  sd$adeg <- random.cdisc.data::cadeg
  sd$adex <- random.cdisc.data::cadex
  sd$adlb <- random.cdisc.data::cadlb
  sd$admh <- random.cdisc.data::cadmh
  sd$adrs <- random.cdisc.data::cadrs
  sd$adsub <- random.cdisc.data::cadsub
  sd$adtte <- random.cdisc.data::cadtte
  sd$advs <- random.cdisc.data::cadvs

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
    ),
    list(
      "Total number of doses administered",
      c(6, 8),
      "7"
    )
  )

  sd$adex <- dunlin::cut_by_group(as.data.frame(sd$adex), "AVAL", "PARAM", group, "AVALCAT1")
  sd$adex$AVALCAT1 <- factor(
    sd$adex$AVALCAT1,
    levels = c("<700", "700-900", "900-1200", ">1200", "<5000", "5000-7000", "7000-9000", ">9000", "7")
  )

  set.seed(1, kind = "Mersenne-Twister")
  sd$adex <- sd$adex %>%
    distinct(USUBJID, .keep_all = TRUE) %>%
    mutate(
      PARAMCD = "TDURD",
      PARAM = "Overall duration (days)",
      AVAL = sample(x = seq(1, 250), size = n(), replace = TRUE),
      PARCAT1 = "OVERALL",
      AVALCAT1 = factor(case_when(
        AVAL < 30 ~ "< 1 month",
        AVAL < 90 ~ "1 to <3 months",
        AVAL < 180 ~ "3 to <6 months",
        TRUE ~ ">=6 months"
      ), levels = c("< 1 month", "1 to <3 months", "3 to <6 months", ">=6 months"))
    ) %>%
    dplyr::bind_rows(sd$adex) %>%
    select(
      USUBJID, ARM, ARMCD, ACTARM, ACTARMCD, PARAMCD, AVALU,
      AVISIT, PARAM, AVISITN, TRT01P, TRT01A, TRT02P, TRT02A,
      AVALCAT1, PARCAT1, ETHNIC, AVAL, STUDYID, PARCAT2, SEX, RACE
    )
  # Add AVALCAT1 CHGCAT1 for adeg
  sd$adeg <- sd$adeg %>%
    mutate(
      AVALCAT1 = case_when(
        PARAMCD == "QT" & AVAL <= 450 ~ "<=450 msec",
        PARAMCD == "QT" & AVAL > 450 & AVAL <= 480 ~ ">450 to <=480 msec",
        PARAMCD == "QT" & AVAL > 480 & AVAL <= 500 ~ ">480 to <=500 msec",
        PARAMCD == "QT" & AVAL > 500 ~ ">500 msec",
        PARAMCD == "QT" & is.na(AVAL) ~ NA_character_
      ),
      CHGCAT1 = case_when(
        PARAMCD == "QT" & CHG <= 30 ~ "<=30 msec",
        PARAMCD == "QT" & CHG > 30 & CHG <= 60 ~ ">30 to <=60 msec",
        PARAMCD == "QT" & CHG > 60 ~ ">60 msec",
        PARAMCD == "QT" & is.na(CHG) ~ NA_character_
      ),
      AVALCAT1 = with_label(
        factor(AVALCAT1, levels = c("<=450 msec", ">450 to <=480 msec", ">480 to <=500 msec", ">500 msec")),
        "Value at Visit"
      ),
      CHGCAT1 = with_label(
        factor(CHGCAT1, levels = c("<=30 msec", ">30 to <=60 msec", ">60 msec")),
        "Change from Baseline"
      )
    ) %>%
    select(
      USUBJID, ARM, ARMCD, ACTARM, ACTARMCD, PARAMCD, ANRIND, BNRIND, AVALU,
      AVISIT, PARAM, AVISITN, CHG, BASE, ANL01FL, TRT01P, TRT01A, TRT02P, TRT02A,
      AVALCAT1, CHGCAT1, AVAL, ONTRTFL, STUDYID
    )

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

  # useful for lbt06
  sd$adlb <- sd$adlb %>%
    mutate(ONTRTFL = case_when(
      .data$AVISIT %in% c("BASELINE", "SCREENING") ~ "",
      TRUE ~ "Y"
    )) %>%
    select(
      USUBJID, ARM, ARMCD, ACTARM, ACTARMCD, PARAMCD, ANRIND, BNRIND, AVALU, ONTRTFL,
      AVISIT, PARAM, AVISITN, CHG, BASE, ANL01FL, TRT01P, TRT01A, TRT02P, TRT02A,
      PARCAT1, PARCAT2, AVALCAT1, AVAL, STUDYID, LBCAT, ATOXGR, WGRHIFL, WGRLOFL, BTOXGR
    )

  # useful for dmt01
  sd$adsl$ETHNIC <- factor(trimws(sd$adsl$ETHNIC), levels = trimws(levels(sd$adsl$ETHNIC)))
  attr(sd$adsl$ETHNIC, "label") <- "Ethnicity"

  adsub <- sd$adsub
  adsub_wide_ls <- dunlin::poly_pivot_wider(
    adsub,
    id = "USUBJID",
    param_from = "PARAMCD",
    value_from = "AVAL",
    labels_from = "PARAM"
  )
  adsub_wide_aval <- adsub_wide_ls[["AVAL"]]

  sd$adsl$AAGE <- sd$adsl$AGE
  attr(sd$adsl$AAGE, "label") <- "Age (yr)"
  sd$adsl$AGEGR1 <- cut(sd$adsl$AGE, c(0, 65, 200), c("<65", ">=65"))
  attr(sd$adsl$AGEGR1, "label") <- "Age Group"

  sd$adsl <- sd$adsl %>% left_join(adsub_wide_aval, by = "USUBJID")

  # useful for dst01
  sd$adsl[["EOSSTT"]] <- as.factor(toupper(sd$adsl[["EOSSTT"]]))

  sd$adsl <- sd$adsl %>%
    mutate(EOTSTT = {
      set.seed(321)
      as.factor(sample(c("ONGOING", "COMPLETED", "DISCONTINUED"), nrow(sd$adsl), replace = TRUE))
    })

  # useful for coxt02
  sd$adsl <- sd$adsl %>%
    mutate(RACE = droplevels(factor(case_when(
      .data$RACE == "MULTIPLE" ~ "WHITE",
      .data$RACE == "NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER" ~ "ASIAN",
      TRUE ~ .data$RACE
    ))))

  sd$adsl <- sd$adsl %>%
    mutate(ANL01FL = "Y")

  sd$adae <- sd$adae %>%
    mutate(AEBODSYS = with_label(.data$AEBODSYS, "MedDRA System Organ Class")) %>%
    mutate(AEDECOD = with_label(.data$AEDECOD, "MedDRA Preferred Term")) %>%
    mutate(ANL01FL = "Y") %>%
    mutate(ASEV = .data$AESEV) %>%
    mutate(AREL = .data$AEREL) %>%
    mutate(ATOXGR = .data$AETOXGR)

  sd$adae$TRTSDTM <- lubridate::force_tz(sd$adae$TRTSDTM, tzone = "UTC")
  sd$adae$ADURN <- sd$adae$AENDY - sd$adae$ASTDY + 1
  # dsl01
  sd$adsl$TRTDURD <- as.numeric(ceiling(difftime(sd$adsl$TRTEDTM, sd$adsl$TRTSDTM, units = "days")))


  sd$admh <- sd$admh %>%
    mutate(ANL01FL = "Y") %>%
    mutate(MHBODSYS = with_label(.data$MHBODSYS, "MedDRA System Organ Class")) %>%
    mutate(MHDECOD = with_label(.data$MHDECOD, "MedDRA Preferred Term"))

  sd$advs <- sd$advs %>%
    mutate(ANL01FL = "Y") %>%
    select(
      USUBJID, ARM, ARMCD, ACTARM, ACTARMCD, PARAMCD, ANRIND, BNRIND, AVALU, AVAL, STUDYID,
      AVISIT, PARAM, AVISITN, CHG, BASE, ANL01FL, TRT01P, TRT01A, TRT02P, TRT02A, ONTRTFL, ABLFL
    )

  sd$adcm <- sd$adcm %>%
    mutate(ANL01FL = "Y")

  adsl <- sd$adsl[c("USUBJID", "AAGE", "RACE")]
  sd$adtte <- sd$adtte %>% select(-c("RACE"))
  sd$adtte <- sd$adtte %>% left_join(adsl, by = "USUBJID")

  # useful for fstg02
  sd$adtte$AGEGR1 <- cut(sd$adtte$AGE, c(0, 65, 200), c("<65", ">=65"))
  attr(sd$adtte$AGEGR1, "label") <- "Age Group"

  # useful for fstg01
  sd$adrs$AGEGR1 <- cut(sd$adrs$AGE, c(0, 65, 200), c("<65", ">=65"))
  attr(sd$adrs$AGEGR1, "label") <- "Age Group"

  # useful for rmpt04
  sd$adex$ETHNIC <- factor(trimws(sd$adex$ETHNIC), levels = trimws(levels(sd$adex$ETHNIC)))
  attr(sd$adex$ETHNIC, "label") <- "Ethnicity"

  # useful for aet05 and aet05_all
  names(sd)[names(sd) == "adaette"] <- "adsaftte"

  # subset patients to only keep 10 pts per arm.
  kept_subj <- vapply(split(sd$adsl$USUBJID, sd$adsl$TRT01P), function(x) x[seq_len(15)], FUN.VALUE = rep("", 15L))
  kept_subj <- as.vector(kept_subj)
  sd <- lapply(
    sd,
    function(x) {
      ret <- x[x$USUBJID %in% kept_subj, ]
      ret$USUBJID <- droplevels(ret$USUBJID)
      ret
    }
  )

  sd$adrs$AVALC <- rep(c("CR", "PR", "SD"), length.out = nrow(sd$adrs))

  sd
}

#' example data generated with syn_test_data()
#' @export
#' @rdname syn_test_data
syn_data <- syn_test_data()

usethis::use_data(syn_data, overwrite = TRUE)
