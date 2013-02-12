
data <- read.csv("../data/auto.csv", header=TRUE)

names(data)

names(data) <- c("price", "mpg", "weight")

head(data)

head(data$mpg)

lm(price ~ 1 + mpg + weight, data=data)

attach(data)
head(mpg)

y <- matrix(price)
X <- cbind(1, mpg, weight)

dim(X)[1] == nrow(y)

detach(data)

beta <- solve(t(X) %*% X) %*% t(X) %*% y
print(beta)

n <- nrow(y)
P <- X %*% solve(t(X) %*% X) %*% t(X)
M <- diag(n) - P

all.equal(M, t(M))

all.equal(M, t(M), tol=0)

all.equal(M, M %*% t(M))

e <- M %*% y
y.hat <- P %*% y
rss <- t(e) %*% e
ess <- t(y.hat) %*% y.hat
tss <- t(y) %*% y

all.equal(tss, ess + rss)

r
