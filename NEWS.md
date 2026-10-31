# errum (development version)

## Bug fixes

- `errum()` now stores every draw when `burnin = 0`. Previously the
  comparison `t > burnin - 1` wrapped around on an unsigned integer, so
  nothing was stored and every returned chain was all zeros.
- `errum()` now stops with an error when `y` contains missing values.
  Previously a single `NA` produced an invalid fit without warning.

## Internal

- Added a testthat test suite.

# errum 0.0.4

## Changes

- Added explicit dependencies on R (>= 4.3.0), Rcpp (>= 1.1.0), and RcppArmadillo (>= 15.0.2-2)
- Removed CXX11 from `src/Makevars` and `src/Makevars.win` to avoid potential compilation issues
  with newer versions of Armadillo through RcppArmadillo.
- Switched README.Rmd to README.qmd to use Quarto for rendering.
- Fixed CITATION file to use `c()` instead of `personList()` and `bibentry()` to
  avoid CRAN check notes.
- Updated GitHub Action workflows.

# errum 0.0.3

## Bug fix

- Fix ambiguous overloaded of `pow` on Solaris.

# errum 0.0.2

## Features

- Provides a high-performing modeling routine for the Exploratory
  Reduced Reparameterized Unified Model (errum).
