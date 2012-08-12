
matrix(1:6, ncol=2)

matrix(1:6, ncol=3, byrow=TRUE)

A <- matrix(1:6, ncol=2)
B <- matrix(1:6, ncol=3, byrow=TRUE)

A == t(B)

all(A == t(B))

ls()

B %*% A

B %*% t(A)

B * t(A)

A * 2

A * matrix(2)

e <- 1:3

apply(A, 2, function(x) {x * e})

whoop <- function(x) {x * e}
apply(A, 2, whoop)

I <- diag(5)

library(psych)
tr(I)
