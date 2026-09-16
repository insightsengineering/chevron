# Occurrence Layout

Occurrence Layout

## Usage

``` r
occurrence_lyt(
  arm_var,
  lbl_overall,
  row_split_var,
  lbl_row_split,
  medname_var,
  lbl_medname_var,
  summary_labels,
  count_by
)
```

## Arguments

- arm_var:

  (`string`) variable used for column splitting

- lbl_overall:

  (`string`) label used for overall column, if set to `NULL` the overall
  column is omitted

- row_split_var:

  (`character`) additional row split variables.

- medname_var:

  (`string`) variable name of medical treatment name.

- lbl_medname_var:

  (`string`) label for the variable defining the medication name.

- summary_labels:

  (`list`) of summarize labels. See details.
