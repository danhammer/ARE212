## A set of functions that support the coding work for ARE212 sections

residualMaker <- function(X) {
  ## accepts a matrix of covariates X; returns the residual maker
  ## matrix

  ## assigns the transformed matrix to residual maker
  M <- diag(nrow(X)) - X %*% solve(t(X) %*% X) %*% t(X)
  return(M)
}
