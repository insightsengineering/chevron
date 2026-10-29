# Post process

retrieve or set `postprocess` function.

## Usage

``` r
postprocess(x)

# S4 method for class 'chevron_tlg'
postprocess(x)

postprocess(x) <- value

# S4 method for class 'chevron_tlg'
postprocess(x) <- value
```

## Arguments

- x:

  (`chevron_tlg`) input.

- value:

  (`function`) returning a post-processed `tlg`.

## Value

the `function` stored in the `postprocess` slot of the `x` argument.
