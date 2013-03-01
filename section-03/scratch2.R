
wtCoef <- function() {
  ## returns the coefficent on weight from the regression of price on
  ## weight and miles-per-gallon, along with an intercept
  beta <- solve(t(X) %*% X) %*% t(X) %*% y
  return(beta[3])
}

n <- 100

paramEst <- function(i) {
  X <- matrix(rnorm(2 * n), ncol = 2)
  X <- cbind(1, X)
  true.beta <- c(1, 4, -2)
  y <- X %*% true.beta + rnorm(n)
  est.beta <- solve(t(X) %*% X) %*% t(X) %*% y
  return(est.beta[2])
}
