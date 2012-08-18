
n <- 1000
x <- runif(n, min=0, max=2000)
eps <- rnorm(n, 0, sqrt((x/1000)^2))
y <- 0.5 + x*1.5 + eps

X <- cbind(1, x)
params <- solve(t(X) %*% X) %*% t(X) %*% y
beta <- params[2]
print(beta)

rnd.beta <- function(i) {
  # the argument `i` is not used within the function, but rather to
  # index the function call; useful for =apply= functions
  x <- runif(n)
  eps <- rnorm(n, 0, sqrt(x/10))
  y <- 0.5 + x*1.5 + eps
  X <- cbind(1, x)
  params <- solve(t(X) %*% X) %*% t(X) %*% y
  beta <- params[2]
  return(beta)
}

rnd.beta()
rnd.beta()

B <- 1000
beta.vec <- sapply(1:B, rnd.beta)
mean(beta.vec)
sd(beta.vec)

rnd.fgls.beta <- function(i) {
  x <- runif(n)
  eps <- rnorm(n, 0, sqrt(x/10))
  y <- 0.5 + x*1.5 + eps
  X <- cbind(1, x)
  C <- diag(1/sqrt(sapply(x,function(x){x/10})))
  y.wt <- C %*% y
  X.wt <- C %*% X
  b.fgls <- solve(t(X.wt) %*% X.wt) %*% t(X.wt) %*% y.wt
  beta <- b.fgls[2]
  return(beta)
}
  fgls.beta.vec <- sapply(1:B, rnd.fgls.beta)

png(filename="inserts/hist.png")
library(ggplot2)
ols <- cbind(beta.vec, 0)
fgls <- cbind(fgls.beta.vec, 1)
data <- data.frame(rbind(ols, fgls))
names(data) <- c("beta", "mt")
data$method <- "ols"
data$method[data$mt==1] <- "fgls"
m <- ggplot(data, aes(x=beta, ..density.., fill=method))
m + geom_density(alpha=0.2)
dev.off()
