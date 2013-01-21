library(foreign)
library(ggplot2)

f <- "http://fmwww.bc.edu/ec-p/data/wooldridge/wage2.dta"
data <- read.dta(f)
data <- data[ , c("wage", "educ", "age")]
data <- na.omit(data)

hist(data$wage, xlab = "wage", main = "",
     col = "blue", border = "white", breaks = 30)

e1 <- ifelse(data$educ %in% 1:12, 1, 0)
e2 <- ifelse(data$educ %in% 13:14, 1, 0)
e3 <- ifelse(data$educ %in% 15:16, 1, 0)
e4 <- ifelse(data$educ %in% 17:18, 1, 0)

m1 <- lm(wage ~ 1 + e1 + e2 + e3 + e4, data = data)
m2 <- lm(wage ~ 1 + e2 + e3 + e4, data = data)

mean(data[e3 == 1, c("wage")])

b <- m2$coefficients
b[["(Intercept)"]] + b[["e3"]] 

m3 <- lm(wage ~ 1 + e2 + e3 + e4 + age + I(age^2), data = data)

g <- ggplot(data, aes(x=age, y=wage)) + geom_smooth(method="loess", size=1.5)

g + geom_point()

