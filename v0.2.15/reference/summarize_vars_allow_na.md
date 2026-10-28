# Summarize variables allow `NA`

Summarize variables allow `NA`

## Usage

``` r
summarize_vars_allow_na(
  lyt,
  vars,
  var_labels = vars,
  nested = TRUE,
  ...,
  show_labels = "default",
  table_names = vars,
  section_div = NA_character_,
  .stats = c("n", "count_fraction"),
  .formats = list(count_fraction = format_count_fraction_fixed_dp),
  .labels = NULL,
  .indent_mods = NULL,
  inclNAs = TRUE
)
```
