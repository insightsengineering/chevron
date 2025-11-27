# Concatenate Site and Subject ID

Concatenate Site and Subject ID

## Usage

``` r
create_id_listings(site, subject, sep = "/")
```

## Arguments

- site:

  (`string`)

- subject:

  (`string`)

- sep:

  (`string`)

## Note

the `{Patient_label}` whisker placeholder will be used in the label.

## Examples

``` r
create_id_listings("BRA-1", "xxx-1234")
#> [1] "BRA-1/1234"
#> attr(,"label")
#> [1] "Center/Patients ID"
```
