# chevron 0.2.8.9003

# chevron 0.2.8

* New `unwrap` argument prints `preprocessing`, `main`, `postprocessing` and `layout` function upon execution of the `run` method.
* The `chevron.run.verbose` option and `R_CHEVRON_RUN_VERBOSE` environment variable control the `verbose` argument of the `run` method, while the `chevron.run.unwrap` option and `R_CHEVRON_RUN_UNWRAP` environment variable control the `unwrap` argument.

# chevron 0.2.7

* Add the `AEL02`, `AEL03` and `CML02A_gl` templates.
* Modify the post processing of `MHT01` to allow multiple `row_split_var`.
* Improve the `report_null` method to facilitate the creation of null reports.
* Export the `std_postprocessing` function to simplify post processing logic.
* `AET01` can now additionally display the number of death and withdrawal using the `show_wd` argument.
* `MNG01` line type can now be controlled with the `line_type` argument.
* `script_funs` doesn't rely anymore on source code of pre processing functions.

# chevron 0.2.6

* Added assertion on class of `summaryvars` argument of `dmt01()`.
* Additional arguments can be passed to `ael01_nollt` run method, for instance to split the resulting listing.
* `strat` argument of `kmg01_main` is now deprecated - use `strata` instead.
* `grob_list` and `gg_list` are now deprecated - use `list()` instead.

# chevron 0.2.5

* `MNG01` plot can now be displayed without error bars and can display a continuous temporal scale on the `x` axis.
* Add a `chevron_simple` class which only contains main function.
* Remove `details` argument in `script_funs`, add `name` argument.
* In the `run` method, the argument passed through `...` are combined with the one passed through `user_arg`. `...` arguments have priority.
* `AET05` preprocessing now filters on `"(AE|CQ|SMQ)TTE"` rather than `"AETTE"`.
* Rename the dataset `ADAETTE` in `syn_data` object to `ADSAFTTE`. Trim the dataset to remove unused variables.
* Use uppercase variable names in `AET05` and `AET05_ALL`.
* The string replacing `NA` values in the tables is now controlled by the `tern_default_na_str` option set during package load.
* Specified minimal version of package dependencies.

# chevron 0.2.4

* `TTET01` now uses "NE" to represent NA values.

# chevron 0.2.3

* Fix argument printing for `run` method.
* Remove six unused tables from the `syn_data` object.
* Fix `EGT03` to allow multiple parameters.
* Update `TTET01` to provide meaningful error message if stratification
variables do not exist in analysis dataset.
* `PDT01` preprocessing now filters `addv` to retain only major protocol deviation.
* `AEL01_NOLLT` now has argument `unique` to keep only the unique rows in listing.
* `AET01_AESI`, `EGT02` and `LBT14` now remove the check in preprocessing function.
* `COXT01` will drop levels on `arm_var` in preprocessing function now.
* `MNG01` uses a `ggtheme` argument to set graphic parameters instead of the now defunct `show_h_grid`, `show_v_grid`
and `legend_pos` arguments. The `table` arguments now controls the behavior of the table. The arguments `show_n` and
`show_table` are now defunct.
* Add `RMPT06` template.
* The `stats` and `precision` arguments now control the statistical analysis and numbers of digits presented in `DMT01`.
* `FSTG01` and `FSTG02` template removes the `max_colwidth` argument. Default font size of the plot is set to 7.
* Introduce `set_section_div` function to add empty line separator between specified row splits.
* `AET02` template the default order of "Total number of events" and "Total number of patients with at least one adverse event"
switched.

# chevron 0.2.2

* Allow `EGT03` to include multiple parameters.
* Allow `KMG01` to include stratified variables.
* Allow `LBT06` and `LBT14` to be split by pages.
* Allow `AET02`, `CMT01A` to change the summary statistics with `summary_labels` argument.
* Add `FSTG02` template.
* Update the argument `"is_event"` in `KMG01` to `"IS_EVENT"`.
* Update the argument `"is_rsp"` in `FSTG01` to `"IS_RSP"`.
* `FSTG01` and `FSTG02` stratification variable labels will be truncated to fit the page.
* Update the script for `chevron_tlg` objects. The `details` argument is deprecated.
* Fix issue when `run` method is executed with `do.call` and `verbose` argument.

# chevron 0.2.1

* Placeholder strings are now replaced during layout creation using `dunlin::render_safe` function.
* New `chevron_catalog` vignette details usage and version of chevron templates.
* The `run` method renders the errors faster thanks to the new internal `do_call` function.
* Add `verbose` argument for `run` method which would print the argument used.
* Add `row_split_var` and `page_var` as argument for some template.
* The `dataset` slot in `chevron_tlg` class has been removed.
* Add `CFBT01` template. `VST01`, `EGT01` and `LBT01` are now all following `CFBT01`. By default parameters are displayed by page .
* Add `RMPT03`, `RMPT04` and `RMPT05` which follow `RMPT01`.
* Add `COXT01` template. `COXT02` is now based on `COXT01`.
* Add `AET05` and `AET05_ALL` templates.
* Add `LBT15` based on `LBT04`. `LBT04` has new arguments to make it more flexible.
* Update `EGT03` to use `ACTARMCD` as default arm variable, and remove the preprocessing of filtering to "HR".
* Update `EXT01` to allow it to be displayed by `PARCAT2`.
* Update `LBT06` template to use `PARAM` as row split.
* Convert `AVISIT` to factor and order levels according to `AVISITN` in preprocessing.
* Update `MNG01` so that the numeric `jitter` argument controls the width of data spread along the x-axis.

# chevron 0.2.0

* Remove the usage of `dm` class of object. The chevron functions now expect list of `data.frame` as `adam_db` argument.
* Remove variants in template names.
* Remove deprecated `getter` functions `get_main`, `get_preprocess` and `get_postprocess`.
* Simplify `pre` function and add more data checks in `main` function.
* Remove redundant assertion functions.
* Add more templates: `AET10`, `KMG01`, `RSPT01`, `RMPT01`, `COXT02`, `FSTG01`, and `LBT06`.

# chevron 0.1.4

* Use `list` to replace `character` in template arguments.

# chevron 0.1.3

* Add more templates: `AET01_AESI`, `EGT03`, `EGT05_QTCAT`, `LBT04`, `LBT05`, `LBT07`, `LBT14`, `PDT01`, `PDT02`.
* Deprecation of previous `getter` function like `get_main` to `main` and `main<-`.
* Add `chevron_t`, `chevron_l` and `chevron_g` subclass of `chevron_tlg`.
* Add `script_funs` and `script_args` to obtain string representation of the full code.
* Update to current templates.

# chevron 0.1.2

* Update snapshot tests

# chevron 0.1.1

* First release with implementation of: `AET01`, `AET02`, `AET03`, `AET04`, `CMT01A`, `CMT02_PT`, `DMT01`, `DST01`, `DTHT01`, `EGT01`, `EGT02`, `EXT01`, `LBT01`, `MHT01`, `MNG01`, `VST01`, `VST02`.
