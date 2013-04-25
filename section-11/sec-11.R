
raw.data <- read.table("card.raw")

col.names <- c("id", "nearc2", "nearc4", "educ", "age", "fatheduc",
               "motheduc", "weight", "momdad14", "sinmom14", "step14",
               "reg661", "reg662", "reg663", "reg664", "reg665", "reg666",
               "reg667", "reg668", "reg669", "south66", "black", "smsa",
               "south", "smsa66", "wage", "enroll", "kww", "iq", "married",
               "libcrd14", "exper", "lwage", "expersq")

names(raw.data) <- col.names

list.data <- lapply(data, function(x) { replace(x, x == ".", NA) } )
df <- na.omit(as.data.frame(list.data))

png(filename="inserts/hist.png",height=500,width=700)
par(mfrow=c(2,2))
graph.cols <- c("lwage", "educ", "exper", "expersq")

for(var in graph.cols) {
  hist(df[[var]], main = var, xlab="", breaks = 20,
       col = "grey", border = "white")
}
dev.off()

fn <- function(x) {
  return(-((400 - x)^2 / 1000) + 200)
}

(opt     <- optimize(fn, interval = c(1, 1000), maximum = TRUE))
euro.opt <- optimise(fn, interval = c(1, 1000), maximum = TRUE)

x <- sample(1:1000, 40)

png(filename="inserts/fn.png",height=600,width=800)
curve(fn, from = 1, to = 1000, type = "l", col = "blue")
abline(v = opt$maximum, col = "red", lty = 3)
points(opt$maximum, opt$objective, col = "red", cex = 3)
points(x, fn(x), col = "black", pch = 16)
dev.off()
