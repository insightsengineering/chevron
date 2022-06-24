
#' R6 Class representing a `tlg_pipeline`
#'
#' An instance of `tlg_pipeline` possesses a `tlg` generating function, a pre processing function, a check function and
#' is associated with one or more `adam` table names.
#'
#' A `tlg_pipeline` can be created empty or based on a `tlg` function name, in which case, the corresponding pre
#' processing and check function will also be associated.
#'
#' Check, pre processing and `tlg` function of a `tlg_pipeline` can be manually assigned. If modified, the initial
#' functions can be restored with the `reset` method.
#'
#' @examples
#' aet01_1_pipeline <- tlg_pipeline$new("aet01_1", c("adsl", "adae"))
#' aet01_1_pipeline$run(syn_test_data())
#'
#' aet01_1_pipeline$preprocess <- function(x) x
#' try(aet01_1_pipeline$run(syn_test_data()))
#'
#' aet01_1_pipeline$reset()
#' aet01_1_pipeline$run(syn_test_data())
tlg_pipeline <- R6::R6Class(
  "tlg_pipeline",
  private = list(
    # .tlg tlg generating function.
    .tlg = NULL,

    # .preprocess `tlg` preprocessing function.
    .preprocess = NULL,

    # .check input checking function.
    .check = NULL,

    # .tables the names of the tables associated with the `tlg` function
    .tables = NULL
  ),
  public = list(

    #' @field tlg `tlg` generating function.
    tlg = NULL,

    #' @field preprocess `tlg` pre processing function.
    preprocess = NULL,

    #' @field check input checking function.
    check = NULL,

    #' @field tables the names of the tables associated with the `tlg` function
    tables = NULL,

    #' @description Create a new instance of the `tlg_pipeline` class.
    #'
    #' @param fun_name (`string`) the name of the `chevron` tlg function.
    #' @param tables (`character`) the names of the tables necessary to the `tlg` function.
    #'
    initialize = function(fun_name, tables) {
      if (!missing(fun_name)) {
        assert_string(fun_name)
        private$.tlg <- match.fun(fun_name)
        self$tlg <- private$.tlg
        private$.preprocess <- match.fun(paste0(fun_name, "_pre"))
        self$preprocess <- private$.preprocess
      }

      if (!missing(tables)) {
        assert_character(tables)
        private$.tables <- tables
        self$tables <- private$.tables
      }
    },

    #' @description Execute the pipeline defined by check, pre process and `tlg` function.
    #'
    #' @param adam_db (`dm`) input for the `tlg` creation.
    #' @param safe (`flag`) should the input be checked.
    #' @param ... optional arguments passed to the `preprocess` and `tlg` functions.
    #' @export
    #'
    #' @examples
    #' dst01_1_pipeline <- tlg_pipeline$new("dst01_1", c("adsl"))
    #'
    #' .study <- list(
    #'  planarm = "ARM",
    #'  lbl_overall = NULL,
    #'  disc_reason_var = "DCSREAS",
    #'  status_var = "EOSSTT"
    #' )
    #'
    #' dst01_1_pipeline$run(syn_test_data(), .study = .study, armvar = "ARM")
    #'
    run = function(adam_db, safe = FALSE, ...) {
      assert_class(adam_db, "dm")

      if (safe) self$check(db)

      data <- list(adam_db = adam_db)
      optional_arg <- if(!missing(...)) list(...) else NULL

      proc_data <- list(adam_db = do.call(self$preprocess, c(data, optional_arg)))
      do.call(self$tlg, c(proc_data, optional_arg))
    },

    #' @description Return to the original functions and tables.
    #'
    #' @param tlg (`flag`) should the original `tlg` function by restored.
    #' @param preprocess (`flag`) should the original `preprocess` function by restored.
    #' @param check (`flag`) should the original `check` function by restored.
    #' @param tables (`flag`) should the original `tables` value by restored.
    #'
    reset = function(tlg = TRUE, preprocess = TRUE, check = TRUE, tables = TRUE) {
      if (tlg) self$tlg <- private$.tlg
      if (preprocess) self$preprocess <- private$.preprocess
      if (check) self$check <- private$.check
      if (tables) self$tables <- private$.tables
    }
  )
)
