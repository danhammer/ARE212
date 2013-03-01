
randomMat <- function(n, k) {
  v <- runif(n*k)
  matrix(v, nrow=n, ncol=k)
}

randomMat(3,2)

demeanMat <- function(n) {
  ones <- rep(1, n)
  diag(n) - (1/n) * ones %*% t(ones)
}

A <- demeanMat(3)
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
  return(t(b2) %*% xtax %*% b2 / ytay)
}

R.squared(y, X2)

png(filename="inserts/graph1.png",height=800,width=800)
n <- nrow(X2); k.max <- 70
X.rnd <- randomMat(n, k.max)
res <- rep(0, k.max)
for (i in seq(k.max)) {
  X.ext <- cbind(X2, X.rnd[, 1:i])
  res[i] <- R.squared(y, X.ext)
}
plot(res)
dev.off()

b <- solve(t(X2) %*% X2) %*% t(X2) %*% y
c <- c(-4, 1)

M <- y - X2 %*% b
N <- y - X2 %*% c

t(N) %*% N - t(M) %*% M

t(c - b) %*% t(X2) %*% X2 %*% (c - b)
t(b - c) %*% t(X2) %*% X2 %*% (b - c)
