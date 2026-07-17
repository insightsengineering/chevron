# Standard Post Processing

Standard Post Processing

## Usage

``` r
std_postprocessing(tlg, ...)
```

## Arguments

- tlg:

  to post process.

- ...:

  additional arguments passed to
  [report_null](https://insightsengineering.github.io/chevron/reference/report_null.md).

## Value

a processed `tlg` or a null report.

## Examples

``` r
library(rtables)
#> Loading required package: formatters
#> 
#> Attaching package: ‘formatters’
#> The following object is masked from ‘package:base’:
#> 
#>     %||%
#> Loading required package: magrittr
#> 
#> Attaching package: ‘magrittr’
#> The following objects are masked from ‘package:testthat’:
#> 
#>     equals, is_less_than, not
#> 
#> Attaching package: ‘rtables’
#> The following object is masked from ‘package:utils’:
#> 
#>     str
std_postprocessing(build_table(basic_table() |> analyze("Species"), iris), ind = 10L)
#>                        all obs
#>           ————————————————————
#>           setosa         50   
#>           versicolor     50   
#>           virginica      50   
```
