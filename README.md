

<!-- README.md is generated from README.qmd. Please edit that file -->

## errum <a href="https://tmsalab.github.io/errum/"><picture><source media="(prefers-color-scheme: dark)" srcset="man/figures/errum-logo-animated-dark.svg"><img src="man/figures/errum-logo-animated-light.svg" width="150" align="right" alt="A hexagonal logo for errum: a solid punch card whose top edge steps down in four treads labelled π*, r*₁, r*₂ and r*₃, with beside each r* the hole that switches that penalty on, the first still holding an orange hanging chad, and the word errum cut out below."/></picture></a>

<!-- badges: start -->

[![R-CMD-check](https://github.com/tmsalab/errum/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/tmsalab/errum/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

Perform a Bayesian estimation of the Exploratory reduced Reparameterized
Unified Model (‘ErRUM’) described by Culpepper and Chen (2018).

### Installation

You can install `errum` from CRAN using:

``` r
install.packages("errum")
```

Or, you can be on the cutting-edge development version on GitHub using:

``` r
if(!requireNamespace("remotes")) install.packages("remotes")
remotes::install_github("tmsalab/errum")
```

### Usage

To use the `errum` package, load it into *R* using:

``` r
library("errum")
```

From there, the errum model can be estimated using:

``` r
errum_model = errum(<data>, <k>, chain_length = 10000)
```

### Authors

James Joseph Balamuta, Steven Andrew Culpepper, and Jeffrey A. Douglas

### Citing the errum package

To ensure future development of the package, please cite `errum` package
if used during an analysis or simulation studies. Citation information
for the package may be acquired by using in *R*:

``` r
citation("errum")
```

### License

GPL (\>= 2)
