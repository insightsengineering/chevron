# Pre process

retrieve or set `preprocess` function.

## Usage

``` r
preprocess(x)

# S4 method for class 'chevron_tlg'
preprocess(x)

preprocess(x) <- value

# S4 method for class 'chevron_tlg'
preprocess(x) <- value
```

## Arguments

- x:

  (`chevron_tlg`) input.

- value:

  (`function`) returning a pre-processed `list` of `data.frames`
  amenable to `tlg` creation. Typically one of the `_pre` function of
  `chevron`.

## Value

the `function` stored in the `preprocess` slot of the `x` argument.
