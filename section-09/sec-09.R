library(maps)
library(maptools)
library(RColorBrewer)
library(classInt)
library(gpclib)
library(mapdata)

png(filename="inserts/us-mkts.png",height=800,width=800)
data <- read.csv("../data/farmers-mkts.csv", header = TRUE)
map("state", interior = FALSE)
map("state", boundary = FALSE, col = "gray", add = TRUE)
points(data$x, data$y, cex = 0.2, col = "blue")
dev.off()

statelist <- c("New Mexico", "Colorado", "Arizona", "Utah")
state.data <- data[is.element(data$State, statelist), ]
dim(state.data)

X <- state.data[, 8:ncol(state.data)]
X <- apply(X, 2, function(col) { ifelse(col == "Y", 1, 0) })
X[1:6, c("Honey", "Jams", "Poultry")]

cl <- kmeans(X, 4)
names(cl)[1:3]

nclr <- 4
clr.set <- brewer.pal(nclr, "Set1")

h <- hclust(dist(X, method = "binary"))
c <- cutree(h, k = 5)

class <- classIntervals(cl$cluster, nclr, style = "pretty")
colcode <- findColours(class, cl$cluster)

classify.colors <- function(x) {
  if (x == 1) {
    return(colcode[1])
  } else if (x == 2) {
    return(colcode[2])
  } else if (x == 3) {
    return(colcode[3])
  } else if (x == 4) {
    return(colcode[4])
  }
}


png(filename="inserts/sel-mkts.png",height=800,width=800)
map("state", interior = FALSE, 
    xlim = c(-117, -101), ylim = c(28, 43))
map("state", boundary = FALSE, col="gray", add = TRUE, 
    xlim = c(-117, -101), ylim = c(28, 43))
points(state.data$x, state.data$y, pch = 16, col = colcode, cex = 1)
dev.off()

cl[["betweenss"]] / cl[["totss"]]

cheese.model <- glm(Cheese ~ 1 + x + y, data = data, family = "binomial")
coef(summary(cheese.model))
