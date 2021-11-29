
df_has_vars <- function(df, vars) {
  all(vars %in% names(df))
}

assertthat::on_failure(df_has_vars) <- function(call, env) {
  paste(
    "the following variables are not in the dataset:",
    paste(setdiff(eval(call$vars, envir = env), names(eval(call$df, envir = env))), collapse = ", ")
  )
}
