# chevron 0.1.4.9016

* Remove the usage of `dm` class of object. The chevron functions now expect list of `data.frame` as `adam_db` argument. 
* Remove variants in template names.
* Remove deprecated `getter` functions `get_main`, `get_preprocess` and `get_postprocess`.
* Simplify `pre` function and add more data checks in `main` function.
* Remove redundant assertion functions.
* Add more templates: `AET10`, `KMG01`, `RSPT01`, `RMPT01`, `COXT02`, `FSTG01`, `LBT06`.

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
