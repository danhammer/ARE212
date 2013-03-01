data <- read.csv("../data/auto.csv", header=TRUE)
names(data) <- c("price", "mpg", "weight")

wt.coef <- function() {
  ## returns the coefficient on weight from the regression of price on
  ## weight and miles-per-gallon, along with an intercept
  X <- cbind(1, data$mpg, data$weight)
  y <- matrix(data$price)
  beta <- solve(t(X) %*% X) %*% t(X) %*% y
  return(beta[3])
}

coef.list <- function() {
  ## returns the coefficients of a regression of price on weight and
  ## mpg, with the results stored as a list
  X <- cbind(1, data$mpg, data$weight)
  y <- matrix(data$price)
  beta <- solve(t(X) %*% X) %*% t(X) %*% y
  res <- list( int = beta[1], mpg = beta[2], weight = beta[3] )
  return(res)
}

res <- coef.list()

n <- 100

param.est <- function() {
  X <- matrix(rnorm(2 * n), ncol=2)
  X <- cbind(1, X)
  true.beta <- c(1, 4, -2)
  y <- X %*% true.beta + rnorm(n)
  est.beta <- solve(t(X) %*% X) %*% t(X) %*% y
  return(est.beta[2])
}

res <- replicate(100, param.est)
res <- replicate(100, param.est())
hist(res)
res <- replicate(1000, param.est())
hist(res, col = "blue", border = "white", breaks = 30)

for (i in names(data)) {
  print(mean(data[, i]))
}

data[1]
data["price"]
data[["price"]]

for (i in names(data)) {
  print(mean(data[[i]]))
}
