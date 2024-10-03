#------- Multi linear Regression -------
install.packages("plot3D")

library("plot3D")
# x, y, z variables
x <- mtcars$wt
y <- mtcars$disp
z <- mtcars$mpg
# Compute the linear regression (z = ax + by + d)
fit <- lm(z ~ x + y)
# predict values on regular xy grid
grid.lines = 26
x.pred <- seq(min(x), max(x), length.out = grid.lines)
y.pred <- seq(min(y), max(y), length.out = grid.lines)
xy <- expand.grid( x = x.pred, y = y.pred)
z.pred <- matrix(predict(fit, newdata = xy), 
                 nrow = grid.lines, ncol = grid.lines)
# fitted points for droplines to surface
fitpoints <- predict(fit)
# scatter plot with regression plane
scatter3D(x, y, z, pch = 19, cex = 0.9, 
          theta = 35, phi = 12, ticktype = "simple",
          xlab = "wt", ylab = "disp", zlab = "mpg", col="red", 
          surf = list(x = x.pred, y = y.pred, z = z.pred, col="blue",
                      facets = NA, fit = fitpoints), main = "mtcars")

#------------Polynomial Regression and Shape ---------
par(family = 'Comic Sans MS')
readbook <- c(1,2,3,4,5,6,7,8,9,10,11,12)
stresslevel <- c(10,9,8,6,4,5,7,8,8,9,11,10)

#seq(min(df$readbook), max(df$readbook), length.out = 12)
# create a linear model
fit1 <- lm(stresslevel ~ readbook) # TODO: study what the hell is this.
#fit2 <- lm(stresslevel ~ readbook + I(readbook^2))
fit2 <-lm(stresslevel ~ poly(readbook, 2, raw=TRUE))
#fit3 <- lm(stresslevel ~ readbook + I(readbook^2) + I(readbook^3))
fit4 <- lm(stresslevel ~ readbook + I(readbook^2) + I(readbook^3) + I(readbook^3))
fit6 <- lm(stresslevel ~ poly(readbook, 6, raw=TRUE))
fit8 <- lm(stresslevel ~ poly(readbook, 8, raw=TRUE))
fit12 <- lm(stresslevel ~ poly(readbook, 12, raw=TRUE))

#----------Experiment with different degree of polynomial shape
newdat = data.frame(readbook = seq(min(df$readbook), max(df$readbook), length.out = 12))
newdat

par(mfrow=c(1,5))

plot(df, cex = 1.2, col = "blue", pch = 16,
     xlim=c(1,10), ylim=c(1,10), xlab="Number of Read books", ylab = "Stress Level",
     cex.axis=1.4, cex.lab=1.6)

newdat$pred = predict(fit1, newdata = newdat)
df <- data.frame(readbook, stresslevel)
plot(df, cex = 1.2, col = "blue", pch = 16,
     xlim=c(1,10), ylim=c(1,10), xlab="Number of Read books", ylab = "Stress Level",
     cex.axis=1.4, cex.lab=1.6)
with(newdat, lines(x = readbook, y = pred, col="red"))

newdat$pred = predict(fit4, newdata = newdat)
df <- data.frame(readbook, stresslevel)
plot(df, cex = 1.2, col = "blue", pch = 16,
    xlim=c(1,10), ylim=c(1,10), xlab="Number of Read books", ylab = "Stress Level",
    cex.axis=1.4, cex.lab=1.6)
with(newdat, lines(x = readbook, y = pred, col="red"))

newdat$pred = predict(fit6, newdata = newdat)
df <- data.frame(readbook, stresslevel)
plot(df, cex = 1.2, col = "blue", pch = 16,
     xlim=c(1,10), ylim=c(1,10), xlab="Number of Read books", ylab = "Stress Level",
     cex.axis=1.4, cex.lab=1.6)
with(newdat, lines(x = readbook, y = pred, col="red"))

newdat$pred = predict(fit12, newdata = newdat)
df <- data.frame(readbook, stresslevel)
plot(df, cex = 1.2, col = "blue", pch = 16,
     xlim=c(1,10), ylim=c(1,10), xlab="Number of Read books", ylab = "Stress Level",
     cex.axis=1.4, cex.lab=1.6)
with(newdat, lines(x = readbook, y = pred, col="red"))

#---------- more than one linear regression -------
par(family = 'Comic Sans MS')
calorie <- c(10,20,30,40,50,60,70,80,90,100,110,120,130,140,150,160,170,180,190,200)
joy <- c(2,3,4,4.5,6.5,7.9,8,8.2,10,11,12,11.5,10.5,9.2,8,7.8,5.5,4,2,2,1.5)
df <- cbind(calorie,joy)
df
plot(df, cex = 1.2, col = "blue", pch = 16)

#TODO: continue calculation, the above data is only to show the algorithm

#------------- Logistic regression------------------




#-------------- Softmax Regression Example ------
# The example adapted from here: https://stats.idre.ucla.edu/r/dae/multinomial-logistic-regression/

install.packages('nnet')
library('nnet')

install.packages('foreign')
library('foreign')

ml <- read.dta("https://stats.idre.ucla.edu/stat/data/hsbdemo.dta")

#prog is output, ses is input
with(ml, table(ses, prog))
with(ml, do.call(rbind, tapply(write, prog, function(x) c(M = mean(x), SD = sd(x)))))

ml$prog2 <- relevel(ml$prog, ref = "academic")

test <- multinom(prog2 ~ ses + write, data = ml)

summary(test)
summary(test)$coefficients/summary(test)$standard.errors



install.packages("mlogit")
library("mlogit")
data("Heating", package = "mlogit")
H <- mlogit.data(Heating, shape = "wide", choice = "depvar", varying = c(3:12))
m <- mlogit(depvar ~ ic + oc | 0, H)
summary(m)

#--------------- Overfitting and Underfitting ---------



