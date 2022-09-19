install.packages("naivebayes")
install.packages("mlbench")
install.packages("e1071")
library("naivebayes")
library("mlbench")
library("e1071")


## Categorical data only:
a<- data(HouseVotes84, package = "mlbench")
HouseVotes84
model <- naiveBayes(Class ~ ., data = HouseVotes84)
predict(model, HouseVotes84[1:10,])
predict(model, HouseVotes84[1:10,], type = "raw")

pred <- predict(model, HouseVotes84)
table(pred, HouseVotes84$Class)


## using laplace smoothing:
model <- naiveBayes(Class ~ ., data = HouseVotes84, laplace = 3)
pred <- predict(model, HouseVotes84[,-1])
table(pred, HouseVotes84$Class)


## Example of using a contingency table:
data(Titanic)
m <- naiveBayes(Survived ~ ., data = Titanic)
m
predict(m, as.data.frame(Titanic))

## Example with metric predictors:
data(iris)
m <- naiveBayes(Species ~ ., data = iris)
## alternatively:
m <- naiveBayes(iris[,-5], iris[,5])
m
table(predict(m, iris), iris[,5])
# }


##---------------------------------
# http://www.learnbymarketing.com/tutorials/naive-bayes-in-r/

set.seed(1)
no_resp <- 500
resp <- 100
response <- factor(c(rep(0,no_resp),rep(1,resp)))
purchased_previously <- factor(c(sample(0:1,no_resp,prob=c(0.6,0.4),replace=T),
                                 sample(0:1,resp,prob=c(0.2,0.8),replace=T)))
opened_previously <- factor(sample(0:1,(no_resp+resp),prob=c(0.8,0.2),replace = T))
sales_12mo <- c(rnorm(n=no_resp,mean = 50, sd = 10),
                rnorm(n=resp,mean = 60, sd = 5))
none_open_buy <- factor(c(sample(0:1, no_resp,prob=c(0.8,0.2),replace=T),
                          rep(1,resp)))
test_var <- sample(LETTERS[1:2],(resp+no_resp),replace=T)

naive_data <- data.frame(purchased_previously = purchased_previously,
                         opened_previously = opened_previously,
                         sales_12mo = sales_12mo,
                         none_open_buy = none_open_buy,
                         test_var = test_var,
                         response = response)

naive_data <- naive_data[sample(1:nrow(naive_data),nrow(naive_data)),]

train <- naive_data[1:(nrow(naive_data)*.7),]
test <- naive_data[(nrow(naive_data)*.7+1):nrow(naive_data),]

train
test

default_pred <- predict(nb_default, test, type="class")

#------ Voronoi plot --------
install.packages("ggvoronoi")
library(ggvoronoi)
x = c(2,6,2,1,3,2,3,3,4,4,6,7,7,8,7)
y = c(7,3,1,3,3,2,1,5,5,6,4,5,7,8,2)
a = data.frame (cbind(x,y))
a
plot(a, pch=20, col='blue')

ggplot(a,aes(x,y)) +
  geom_point(colour="blue", size=2.5) +  
  theme(panel.background = element_rect(fill = "white", colour="black"),
        panel.border = element_rect(colour = "black", fill=NA, size=1.5),
        axis.title.x = element_text( size=16),
        axis.title.y = element_text( size=16),
        axis.text = element_text( size=16))


ggplot(a,aes(x,y)) +
  stat_voronoi(geom="path") +
  geom_point(colour="blue", size=2) +
  theme(panel.background = element_rect(fill = "white", colour="black"),
        axis.title.x = element_text( size=16),
        axis.title.y = element_text( size=16),
        axis.text = element_text( size=16))
