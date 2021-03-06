% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/errum.R
\name{errum}
\alias{errum}
\title{Exploratory reduced Reparameterized Unified Model (ErRUM)}
\usage{
errum(
  y,
  k = 3,
  burnin = 1000,
  chain_length = 10000,
  verbose = FALSE,
  X = matrix(1, nrow = ncol(y)),
  v0 = 4,
  v1 = 2,
  cv0 = 0.1,
  cv1 = 10,
  bnu = 16
)
}
\arguments{
\item{y}{Binary responses to assessments in \code{matrix}
form with dimensions \eqn{N \times J}{N x J}.}

\item{k}{Number of Attribute Levels as a positive \code{integer}.}

\item{burnin}{Number of Observations to discard on the chain.}

\item{chain_length}{Length of the MCMC chain}

\item{verbose}{Display estimation progress updates.}

\item{X, v0, v1, cv0, cv1, bnu}{Additional tuning parameters}
}
\value{
An \code{errum} object that has:
\itemize{
\item \code{PISTAR}
\item \code{RSTAR}
\item \code{PIs}
\item \code{QS}
\item \code{m_Delta}
\item \code{Delta_biject}
\item \code{M2}
\item \code{M1}
\item \code{NUS}
}
}
\description{
Obtains samples from posterior distribution for the Exploratory
reduced Reparameterized Unified Model (ErRUM).
}
\examples{
# Setup Simulation Parameters
N = 5
K = 3
J = 30
# Note:
# Sample size has been reduced to create a minimally
# viable example that can be run during CRAN's automatic check.
# Please make sure to have a larger sample size of around 3,000.

# Sample true attribute profiles
Z         = matrix(rnorm(N * K), N, K)
Sig       = matrix(.5, K, K)
diag(Sig) = 1
theta     = Z \%*\% chol(Sig)

thvals    = matrix(qnorm((1:K) / (K + 1)),
                   N, K, byrow = TRUE)

Alphas    = 1 * (theta > thvals)

# Defining matrix of possible attribute profiles
As = as.matrix(expand.grid(c(0, 1), c(0, 1), c(0, 1)))
Q = rbind(As[rep(c(2, 3, 5), 4),],
          As[rep(c(4, 6, 7), 4),],
          As[rep(8, 6),])

# Use simulation functions available in simcdm
if (requireNamespace("simcdm", quietly = TRUE)) {

a = As \%*\% simcdm::attribute_bijection(K)
As = As[a + 1,]

# Setting item parameters
pistar = rep(.9, J)
rstar = matrix(.6, J, K) * Q

# Simulate data under rRUM model
Y = simcdm::sim_rrum_items(Q, rstar, pistar, Alphas)

# Estimation Settings
chainLength = 10000  # Run with 20000
burnin = chainLength / 2

# Gibbs Estimation
model = errum(Y, K, burnin, chainLength)
}
}
\seealso{
\code{\link[simcdm:attribute_bijection]{simcdm::attribute_bijection()}},
\code{\link[simcdm:sim_rrum_items]{simcdm::sim_rrum_items()}}
}
