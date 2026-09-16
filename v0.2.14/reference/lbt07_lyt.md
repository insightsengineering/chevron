# `lbt07` Layout

`lbt07` Layout

## Usage

``` r
lbt07_lyt(
  arm_var,
  lbl_overall,
  lbl_param_var,
  lbl_grad_dir_var,
  param_var,
  grad_dir_var,
  grad_anl_var,
  map
)
```

## Arguments

- arm_var:

  (`string`) variable used for column splitting

- lbl_overall:

  (`string`) label used for overall column, if set to `NULL` the overall
  column is omitted

- lbl_param_var:

  (`string`) label of the `param_var` variable.

- lbl_grad_dir_var:

  (`string`) label for the `grad_dir_var` variable.

- param_var:

  (`string`) the name of the column storing the parameters name.

- grad_dir_var:

  (`string`) the name of the column storing the grade direction variable
  which is required in order to obtain the correct denominators when
  building the layout as it is used to define row splitting.

- grad_anl_var:

  (`string`) the name of the column storing toxicity grade variable
  where all negative values from `ATOXGR` are replaced by their absolute
  values.

- map:

  (`data.frame`) mapping of `PARAM`s to directions of abnormality.
