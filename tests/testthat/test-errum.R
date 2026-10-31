test_that("errum() stores every draw when burnin = 0", {
  set.seed(1)
  y <- matrix(rbinom(60 * 12, 1, 0.5), nrow = 60, ncol = 12)

  fit <- suppressMessages(errum(y, k = 2, burnin = 0, chain_length = 20))

  # Each stored draw of the class shares sums to one; unfilled columns are 0.
  expect_equal(colSums(fit$PIs), rep(1, 20))
})

test_that("errum() rejects responses with missing values", {
  set.seed(1)
  y <- matrix(rbinom(60 * 12, 1, 0.5), nrow = 60, ncol = 12)
  y[1, 1] <- NA

  expect_error(
    suppressMessages(errum(y, k = 2, burnin = 5, chain_length = 5)),
    "must not contain missing values"
  )
})
