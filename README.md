
# nhsnumber

<!-- badges: start -->
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN status](https://www.r-pkg.org/badges/version/nhsnumber)](https://CRAN.R-project.org/package=nhsnumber)
<!-- badges: end -->

The goal of nhsnumber is to provide some simple functions for working with NHS numbers in R.

## NHS Number Overview

NHS numbers are issued to patients of the NHS in the UK.

The number consists of 9 digits and a single digit checksum.

For more information, please see the [NHS number Wikipedia article](https://en.wikipedia.org/wiki/NHS_number) on the subject.

## Installation

You can install the released version of nhsnumber from [GitHub](https://github.com/sellorm/nhsnumber) with:

``` r
devtools::install_github("sellorm/nhsnumber")
```

## Example

The `is_valid` function takes a vector of NHS numbers and returns TRUE or FALSE depending on whether the checksum is successfully validated.

``` r
x <- c(9876543210, 1234567890, 1234567881)
nhsnumber::is_valid(x)
```

Which returns:

```
TRUE FALSE  TRUE
```

It's also possible to generate the checksums using the `get_checksum` function. This function uses the 9 core digits and returns either the checksum on its own, or the full 10 digit number.

``` r
nhsnumber::get_checksum(123456788)
```

which returns:

```
1
```

or with the full output:

``` r
nhsnumber::get_checksum(123456788, full_output = TRUE)
```

Which returns:

```
1234567881
```

Some number combinations are invalid and these will throw an error, for example:

``` r
nhsnumber::get_checksum(123456789)
```

Which results in this:

```
Error in nhsnumber::get_checksum(123456789) : Input sequence is invalid
           Checksum was 10 which is not permissable
```


