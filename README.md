
<!-- README.md is generated from README.Rmd. Please edit that file -->

## errum

<!-- badges: start -->

[![Build
Status](https://travis-ci.org/tmsalab/errum.svg)](https://travis-ci.org/tmsalab/errum)
[![Package-License](http://img.shields.io/badge/license-GPL%20\(%3E=2\)-brightgreen.svg?style=flat)](http://www.gnu.org/licenses/gpl-2.0.html)
[![CRAN Version
Badge](http://www.r-pkg.org/badges/version/errum)](https://cran.r-project.org/package=errum)
[![CRAN
Status](https://cranchecks.info/badges/worst/errum)](https://cran.r-project.org/web/checks/check_results_errum.html)
[![RStudio CRAN Mirror’s Monthly
Downloads](http://cranlogs.r-pkg.org/badges/errum?color=brightgreen)](http://www.r-pkg.org/pkg/errum)
[![RStudio CRAN Mirror’s Total
Downloads](http://cranlogs.r-pkg.org/badges/grand-total/errum?color=brightgreen)](http://www.r-pkg.org/pkg/errum)
<!-- badges: end -->

Perform a bayesian estimation of the Exploratory reduced Reparameterized
Unified Model (‘ErRUM’) described by Culpepper and Chen (2018)
<doi:10.3102/1076998618791306>.

### Installation

You can install `errum` from CRAN using:

``` r
install.packages("errum")
```

Or, you can be on the cutting-edge development version on GitHub using:

``` r
if(!requireNamespace("devtools")) install.packages("devtools")
devtools::install_github("tmsalab/errum")
```

### Usage

To use the `errum` package, load it into *R* using:

``` r
library("errum")
```

From there, the errum model can be estimated using:

``` r
errum_model = errum(<data>, chain_length = 10000)
```

<!--
To compute a model underneath different _K_ attribute configured _Q_ matrices, use:


```r
errum_models = auto_errum(<data>, k = 2:4, chain_length = 10000)
```

**Note:** Higher _K_ configured _Q_ matrices take longer to estimate. 
-->

### Authors

James Joseph Balamuta, Steven Andrew Culpepper, and Jeffrey A. Douglas

### Citing the `errum` package

To ensure future development of the package, please cite `errum` package
if used during an analysis or simulation studies. Citation information
for the package may be acquired by using in *R*:

``` r
citation("errum")
```

### License

GPL (\>= 2)
