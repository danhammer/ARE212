## Dan Hammer
## ARE212, Spring 2012
## Linear Algebra Puzzles

## Question 1

X <- c(1,2,3)
Y <- c(2,3,4)
Z <- c(3,5,7)

## The vector Z is a linear combination of X and Y, and R will throw
## an error when taking the inverse
W <- cbind(X, Y, Z)
solve(W)

## Replace an element to invert the matrix W
W[1,1] <- 4
solve(W)

## Question 2

X <- matrix(rnorm(9), nrow = 3)
all.equal(solve(t(X)), t(solve(X)))

## Question 3

i <- matrix(c(1,1,1))
A <- diag(3) - (1/3)* i %*% t(i)

demeaned <- X %*% A
all.equal(X[1, ] - mean(X[1,]), demeaned[1,])

## Question 4

X <- matrix(rnorm(9), 3)
Y <- matrix(rnorm(9), 3)
Z <- matrix(rnorm(9), 3)

c <- solve(X %*% Y %*% Z)
d <- solve(Z) %*% solve(Y) %*% solve(X)
all.equal(c, d)

## Question 5

X <- matrix(rnorm(400), 20)
Y <- matrix(rnorm(400), 20)

f <- sum(diag(X + Y))
g <- sum(diag(X)) + sum(diag(Y))
all.equal(f, g)

## Question 6

X <- diag(runif(10, min = 10, max = 20))
sX <- chol(X)
all.equal(sX %*% sX, X)

## Question 7

c <- 5
n <- 3
X <- matrix(rnorm(9), nrow = n)
all.equal(det(c * X), c^n * det(X))

## Question 8

X <- matrix(runif(9), 3)
Y <- matrix(runif(16), 4)
h <- det(kronecker(X, Y))
j <- det(X)^4 * det(Y)^3
all.equal(h, j)
