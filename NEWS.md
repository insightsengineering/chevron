# chevron 0.2.1.9001

* Allow `EGT03` to include multiple parameters.
* Allow `KMG01` to include stratified variables.
* Allow `LBT06` and `LBT14` split by page.
* Allow `AET02`, `CMT01A` to change the summary statistics with `summary_labels` argument.

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
