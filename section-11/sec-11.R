
png(filename="inserts/us-mkts.png")
library(maps)
library(maptools)
library(RColorBrewer)
library(classInt)
library(gpclib)
library(mapdata)

data <- read.csv("../data/farmers-mkts.csv", header=TRUE)
map("state", interior = FALSE)
map("state", boundary = FALSE, col = "gray", add = TRUE)
points(data$x, data$y, cex = 0.2, col="blue")
dev.off()

statelist <- c("New Mexico", "Colorado", "Arizona", "Utah")
idx <- is.element(data$State, statelist) 
state.data <- data[idx, ]
dim(state.data)

X <- state.data[, 8:ncol(state.data)]
for(i in names(X)) {
  X[[i]] <- as.numeric(X[[i]]) - 2
}

cl <- kmeans(X, 4)
names(cl)[1:3]

nclr <- 4
plotclr <- brewer.pal(nclr, "Set1")
class <- classIntervals(plotvar, nclr, style = "pretty")
colcode <- findColours(class, cl$cluster)
png("inserts/limited-mkts.png")
map("state", interior = FALSE, 
    xlim = c(-117, -101), ylim = c(28, 43))
map("state", boundary = FALSE, col="gray", add = TRUE, 
    xlim = c(-117, -101), ylim = c(28, 43))
points(state.data$x, state.data$y, pch = 16, col= colcode, cex = 1)
dev.off()
