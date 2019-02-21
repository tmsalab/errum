options(width=10000,max.print=100000)
library("Rcpp",lib.loc = '/home/sculpepp/R/x86_64-unknown-linux-gnu-library/3.1')
library("RcppArmadillo", lib.loc = '/home/sculpepp/R/x86_64-unknown-linux-gnu-library/3.1')
library("gtools", lib.loc = '/home/sculpepp/R/x86_64-unknown-linux-gnu-library/3.1')
Rcpp::sourceCpp('/home/sculpepp/rRUMQ/rRUM_expertQ_v1_7.cpp')
#parm values
cmdargs <- as.numeric(commandArgs(trailingOnly = TRUE))
rep = cmdargs[1]
N = cmdargs[2]
rho = cmdargs[3]
K = cmdargs[4]
J=30
Q=random_Q(J,K)
#item parm vals
pistar = rep(.9,J)
rstar = matrix(.6,J,K)*Q
#generating attribute classes
if(rho==0){
    PIs = rep(1/(2^K),2^K)
    CLs = c((1:(2^K))%*%rmultinom(n=N,size=1,prob=PIs) )-1
}
if(rho>0){
    Z = matrix(rnorm(N*K),N,K)
    Sig = matrix(rho,K,K)
    diag(Sig) = 1
    thvals = matrix(qnorm((1:K)/(K+1)),N,K,byrow=T)
    Alphas = 1*(Z%*%chol(Sig)>thvals)
    CLs = Alphas%*%bijectionvector(K)
}
#Simulate data under rRUM model
Y=simrRUM(N,J,K,Q,rstar,pistar,CLs)
#estimating Q
chain_length = 80000
burnin = 20000
X = as.matrix(rep(1,J))
system.time(
    out <-rRUM_mvnQ_Gibbs(Y,K,X,v0=4,v1=2,cv0=.1,cv1=10,bnu=16,burnin,chain_length)
)
m_rstar=apply(out$RSTAR,c(1,2),mean)
m_pistar=apply(out$PISTAR,1,mean)
col_perms = permutations(K,K)
colmatch = numeric(nrow(col_perms))
Q_mean = apply(out$QS,c(1,2),mean)
Q_est = 1*(Q_mean>.5)
for(r in 1:nrow(col_perms)){
    colmatch[r]=mean(Q[,col_perms[r,]]==Q_est)
}
colperm = which.max(colmatch)
cbind(Q[,col_perms[colperm,]],Q_est,m_rstar,m_pistar)
Qest_check = (Q[,col_perms[colperm,]] == Q_est)
c(min(Qest_check),mean(Qest_check))
apply(Qest_check,1,min)
m_pi = apply(out$PIs,1,mean)
m_pi

