
random.mat <- function(n, k) {
  v <- runif(n*k)
  matrix(v, nrow=n, ncol=k)
}

random.mat(3,2)

demean.mat <- function(n) {
  ones <- rep(1, n)
  diag(n) - (1/n) * ones %*% t(ones)
}

A <- demean.mat(3)
B <- matrix(1:9, nrow=3)
col.means <- apply(B, 2, mean)
C <- apply(B, 1, function(x) {x - col.means})
all.equal(A %*% B, t(C))

data <- read.csv("../data/auto.csv", header=TRUE)
names(data) <- c("price", "mpg", "weight")
y <- matrix(data$price)
X2 <- cbind(data$mpg, data$weight)
n <- nrow(X2)

R.squared <- function(y, X) {
  n <- nrow(X)
  A <- demean.mat(n)
  xtax <- t(X) %*% A %*% X
  ytay <- t(y) %*% A %*% y
  b2 <- solve(xtax) %*% t(X) %*% A %*% y
  t(b2) %*% xtax %*% b2 / ytay
}

R.squared(y, X2)

png(filename="inserts/graph1.png")
n <- nrow(X2)
X.rnd <- random.mat(n, 70)
res <- rep(0, 70)
for(i in 1:70) {
  X.ext <- cbind(X2, X.rnd[, 1:i])
  res[i] <- R.squared(y, X.ext)
}
plot(res)
dev.off()
