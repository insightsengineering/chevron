# Main

retrieve or set `main` function.

## Usage

``` r
main(x)

# S4 method for class 'chevron_tlg'
main(x)

main(x) <- value

# S4 method for class 'chevron_tlg'
main(x) <- value
```

## Arguments

- x:

  (`chevron_tlg`) input.

- value:

  (`function`) returning a `tlg`. Typically one of the `_main` function
  of `chevron`.

## Value

the `function` stored in the `main` slot of the `x` argument.
