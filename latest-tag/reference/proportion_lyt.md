# Proportion layout

Proportion layout

## Usage

``` r
proportion_lyt(
  lyt,
  arm_var,
  methods,
  strata,
  conf_level,
  odds_ratio = TRUE,
  rsp_var = "IS_RSP"
)
```

## Arguments

- lyt:

  layout created by `rtables`

- arm_var:

  (`string`) variable used for column splitting

- methods:

  (`list`) a named list, use a named list to control, for example:
  `methods = list(prop_conf_method = "wald", diff_conf_method = "wald", strat_diff_conf_method = "ha", diff_pval_method = "fisher", strat_diff_pval_method = "schouten")`
  `prop_conf_method` controls the methods of calculating proportion
  confidence interval, `diff_conf_method` controls the methods of
  calculating unstratified difference confidence interval,
  `strat_diff_conf_method` controls the methods of calculating
  stratified difference confidence interval, `diff_pval_method` controls
  the methods of calculating unstratified p-value for odds ratio,
  `strat_diff_pval_method` controls the methods of calculating
  stratified p-value for odds ratio, see more details in `tern`

- strata:

  (`string`) stratification factors, e.g.
  `strata = c("STRATA1", "STRATA2")`, by default as NULL

- conf_level:

  (`numeric`) the level of confidence interval, default is 0.95.

- odds_ratio:

  (`flag`) should the odds ratio be calculated, default is `TRUE`
