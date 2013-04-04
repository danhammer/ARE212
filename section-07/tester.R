
for (i in 1:10) {
  x <- rnorm(1000)
  title <- paste("histogram for iteration", i)
  fname <- paste("hist-", i, ".png", sep = "")
  png(filename = fname)
  hist(x, main = title)
  dev.off()
}

