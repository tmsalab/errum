## Test environments

- local R installation, R 3.6.3
- ubuntu 16.04 (on travis-ci), R 3.6.3
- win-builder (devel)

## R CMD check results

0 errors | 0 warnings | 1 note

New submission
Possibly mis-spelled words in DESCRIPTION:
  Culpepper (20:58)
  
- This is a new release.
- The reported misspelling is one of the paper's authors.
- We've disabled the testing for the estimation routine within its example 
  as even decreasing its sample size was not sufficient for bringing it
  under 5 seconds. 
