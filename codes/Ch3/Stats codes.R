#------- PMF example ------
# Assume we have observed following probabilities
allp <- c(.04,.13,.13,.16,.2,.12,.12,.05,.03,.02)
sum(allp) # we should be sure that sum of our probabilities = 1
d <- 1:10 # number of slots for plotting

plot(d,allp,type="h",col=2,main="amount of rain (PDF)",xlab="x",ylab="p(x)")
points(d,allp,col=2);abline(h=0,col=3)

#----- CDF example -----
# To calculate CDF, first we should get partial sum of the PMF.
psum <- cumsum(allp)
plot(c(1,d),c(0,psum),type="s", ylab="Cummulative Probability",col=2,xlab="X",main="CDF for amount of rain.");


#------- Normal Distribution -------
help(Distributions)


# creates a large random set of numbers. 
x <- seq(-20,20,by=.1)

# if we don’t specify mean and SD, R assumes the mean=0 and SD=1
plot(dnorm(x))

y <- dnorm(x, mean=1, sd=6)
plot(y)

x <- seq(-20,20,by=1)
y <- pnorm(x)
plot(x,y)

y <- pnorm(x,mean=3,sd=4)
plot(x,y)


#pnorm(0,mean=2,lower.tail=FALSE)

v = c(0.1,0.3,0.75)
qnorm(v)

y <- rnorm(20000,mean=20,sd=4)
hist(y)

#----- ChiSquare Distribution ---- 
dchisq(1, df = 1:3)
pchisq(1, df = 3)
pchisq(1, df = 3, ncp = 0:4)  # includes the above

df = 1:2000
df
k = 200 # experiment with different values for k
plot(dchisq(k, df))

#------ Confidence Interval -------
x <- c(1000, 15000, 60000, 30000, 100000, 40000, 15000, 35000, 20000, 36000)
sd(x) 
qt(.975,9) # 9 is a degree of freedom 10-1=9, for 90% we write .95 and for 95% we write .975
#help(qt)
me <- qt(.95,9)*sd(x)/sqrt(10)
mean(x) - me 
mean(x) + me

#-------- Q-Q plot ------------

a <- data.frame(iris)
qqnorm(a$Sepal.Width)
qqnorm(a$Sepal.Length) # is normaly distributed
qqnorm(a$Petal.Length)
qqnorm(a$Petal.Width)

#-------- T test -------------
y1<- c(1:10)
y2<- c(1:100)
y3<- c(11:110)

#one sample t-test
t.test(y1,mu=3)

# independent 2-group t-test
t.test(y1, 1:10) # p-value =1, which is the most catasrophic case 
t.test(y2, y3) # there is a significant differences

# Paired t-test
before <-c(200.1, 190.9, 192.7, 213, 241.4, 196.9, 172.2, 185.5, 205.2, 193.7)
after <-c(392.9, 393.2, 345.1, 393, 434, 427.9, 422, 383.9, 392.3, 352.2)
t.test(before,after,paired=TRUE)

#-----------ANOVA-----------------
# one way ANOVA
datafilename="http://personality-project.org/R/datasets/R.appendix1.data"
mydata=read.table(datafilename,header=T)   #read the data into a table

mydata
aovres = aov(Alertness~Dosage,data=mydata)  #do the analysis of variance
summary(aovres)

boxplot(Alertness~Dosage,data=mydata) #graphical summary

# two way ANOVA
datafilename = "http://personality-project.org/r/datasets/R.appendix2.data"
mydata2 = read.table(datafilename,header=T)   #read the data into a table
mydata2

aovres = aov(Alertness~Gender*Dosage, data=mydata2) 
summary(aovres)

#------ KS test -----------
x <- rnorm(50) #  generates a vector of normally distributed random numbers
x
y <- runif(20) #  generates a vector of uniformly distributed random numbers
y
ks.test(x,y)

library(ggplot2)

sample1<-rnorm(100)
sample2<-rnorm(120, 2, 2)

group <- c(rep("sample1", length(sample1)), rep("sample2", length(sample2)))
dat <- data.frame(KSD = c(sample1,sample2), group = group)
cdf1 <- ecdf(sample1) 
cdf2 <- ecdf(sample2) 

minMax <- seq(min(sample1, sample2), max(sample1, sample2), length.out=length(sample1)) 
x0 <- minMax[which( abs(cdf1(minMax) - cdf2(minMax)) == max(abs(cdf1(minMax) - cdf2(minMax))) )] 
y0 <- cdf1(x0) 
y1 <- cdf2(x0) 

ggplot(dat, aes(x = KSD, group = group, colour = group, linetype=group))+
  stat_ecdf(size=1) +
  xlab("X") +
  ylab("Cumulative Distibution") +
  geom_segment(aes(x = x0[1], y = y0[1], xend = x0[1], yend = y1[1]),
               linetype = "dashed", color = "black") +
  geom_point(aes(x = x0[1] , y= y0[1]), color="red", size=1) +
  geom_point(aes(x = x0[1] , y= y1[1]), color="blue", size=1) +
  theme(panel.background = element_rect(fill='white', colour='black'))


#------ KW test ----------

x <- c(2.9, 3.0, 2.5, 2.6, 3.2) # normal subjects
y <- c(3.8, 2.7, 4.0, 2.4)      # with obstructive airway disease
z <- c(2.8, 3.4, 3.7, 2.2, 2.0) # with asbestosis
list(x, y, z)

kruskal.test(list(x, y, z))

#------ Mann Whitney Wilcox Test -----

wilcox.test(x,y)

#------ effect size
library("effsize")

treatment <- c(10,10,20,20,20,30,30,30,40,50)
control <- c(10,20,30,40,40,50)

res2 = cohen.d(treatment,control,return.dm=TRUE)
print(res2)

res = cliff.delta(treatment,control,return.dm=TRUE)
print(res)


#----- Correlation Analysis ------
a <- c(2,4,5,6,7,8,9,12,14,15,13,9,6,3,1)
b <- c(2,5,6,7,9,12,13,15,16,15,13,12,10,5,2)
cor(a, b, method = "pearson")
cor(a, b, method = "kendall")
cor(a, b, method = "spearman")
