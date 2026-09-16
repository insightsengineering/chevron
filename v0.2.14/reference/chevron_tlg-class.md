# `chevron_tlg` class

The `chevron_tlg` S4 class associates a `preprocess` function, a main
`tlg` function and a `postprocess` function.

`chevron_t`, a subclass of chevron_tlg with specific validation criteria
to handle table creation

`chevron_l`, a subclass of chevron_tlg with specific validation criteria
to handle listing creation

`chevron_g`, a subclass of chevron_tlg with specific validation criteria
to handle graph creation

`chevron_simple`, a subclass of chevron_tlg, where main function is a
simple call

## Usage

``` r
chevron_t(
  main = function(adam_db, ...) build_table(basic_table(), adam_db[[1]]),
  preprocess = function(adam_db, ...) adam_db,
  postprocess = std_postprocessing,
  dataset = NULL,
  ...
)

chevron_l(
  main = function(adam_db, ...) data.frame(),
  preprocess = function(adam_db, ...) adam_db,
  postprocess = std_postprocessing,
  dataset = NULL,
  ...
)

chevron_g(
  main = function(adam_db, ...) ggplot2::ggplot(),
  preprocess = function(adam_db, ...) adam_db,
  postprocess = std_postprocessing,
  dataset = NULL,
  ...
)

chevron_simple()
```

## Arguments

- main:

  (`function`) returning a `tlg`, with `adam_db` as first argument.
  Typically one of the `_main` function of `chevron`.

- preprocess:

  (`function`) returning a pre-processed `list` of `data.frames`, with
  `adam_db` as first argument. Typically one of the `_pre` function of
  `chevron`.

- postprocess:

  (`function`) returning a post-processed `tlg`, with `tlg` as first
  argument.

- dataset:

  (`string`) the name of a table in the `adam_db` object.

- ...:

  not used

## Value

a `chevron_t` class object.

a `chevron_l` class object.

a `chevron_g` class object.

a `chevron_simple` class object.

## Slots

- `main`:

  (`function`) returning a `tlg`. Typically one of the `*_main` function
  from `chevron`.

- `preprocess`:

  (`function`) returning a pre-processed `list` of `data.frames`
  amenable to `tlg` creation. Typically one of the `*_pre` function from
  `chevron`.

- `postprocess`:

  (`function`) returning a post-processed `tlg`. Typically one of the
  `*_post` function from `chevron`.

- `dataset`:

  (`character`) the names of the data sets used in the `chevron_tlg`
  object. If `NULL`, all data sets are possibly used.

## Note

To ensure the correct execution of the workflow, additional validation
criteria are:

- the first argument of the `main` function must be `adam_db`, the input
  `list` of `data.frames` to pre-process. The `...` argument is
  mandatory.

- the first argument of the `preprocess` function must be `adam_db`, the
  input `list` of `data.frames` to create `tlg` output. The `...`
  argument is mandatory.

- the first argument of the `postprocess` function must be `tlg`, the
  input `TableTree` object to post-process. The `...` argument is
  mandatory.

## Examples

``` r
chevron_t_obj <- chevron_t()
chevron_t_obj <- chevron_t(postprocess = function(tlg, indent, ...) {
  rtables::table_inset(tlg) <- indent
  tlg
})

chevron_l_obj <- chevron_l()

chevron_g_obj <- chevron_g()
chevron_g_obj <- chevron_g(
  postprocess = function(tlg, title, ...) tlg + ggplot2::labs(main = title)
)

chevron_simple_obj <- chevron_simple()
```
