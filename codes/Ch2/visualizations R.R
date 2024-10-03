
#---- Scatter plot example---------------------
x <- c(12,23,40,35,13,34,25,15,17,32,23,36,33,31)
y <- c(10,13,35,35,23,34,35,15,17,32,23,32,37,32)
df <- cbind(x,y)
df
plot(df, main="Scatterplot Example", xlab="X labels ", ylab="Y labels", pch =16)
plot(df, main="Scatterplot Example", xlab="X labels ", ylab="Y labels", pch =24, cex=0.9, col="blue", bg="blue")

#----Line plot----------------------
gausdf <- c( 8.9,-1.6 ,8,-1.5,1.5, -1.8,-8.5,1.5, 1.7,-6.2, 1.9, -2.4, -9.1, 5.4, 1.1, -3.3,8.5, -8.1,3.2, -1.6)
plot(gausdf, type = "l", xlab="X labels ", ylab="Y labels") 

#------Pie chart---------------------
slices <- c(15, 25, 60)
lbls <- c("15%", "25%", "60%")
pie(slices, labels = lbls, main="Pie Chart Example") # col=rainbow(length(lbls))

#-----Histogram------------------
iris
xx <- iris[,3]
#xx
hist(xx, freq=FALSE, main="Histogram Example", xlab="x label", border="white", col="blue")

df <- cbind(12,7,5,8,11,13,16)
barplot(df, col="blue", names.arg=c("a","b","c","d","e","f","g"))

#----------- bar plot with two info----------
mtcars
counts <- table(mtcars$vs, mtcars$gear)
barplot(counts, main="Car Distribution by Gears and VS",
        xlab="Number of Gears", col=c("blue","red"),
        legend = rownames(counts), beside=TRUE) # col=topo.colors(5), main="topo.colors"

#--------------Surface plot---------- 
install.packages("geoR")
library("geoR")

cone <- function(x, y){
  sqrt(x^2+y^2)
}
x <- y <- seq(-1, 1, length= 18)
z <- outer(x, y, cone)

persp( x, y, z, phi = 25, theta = 45,
       xlab = "X Coordinate", 
       ylab = "Y Coordinate", 
       zlab = "Z Coordinate",
       main = "Surface plot example",
       col = "antiquewhite", shade = 0.5)


x=seq(-pi,pi,len=20)
y=x;
f=outer(x,y,function(x,y)cos(y)/(1+x^2));
f[1:5, 1:5]
persp(x,y,f, phi = 35, theta = 45, 
      xlab = "Calories ", 
      ylab = "Time of Day", 
      zlab = "Weight",
      col = "antiquewhite", expand = 0.4, d=12)

#----------- AREA PLOT ------------------
install.packages("ggplot2")
install.packages("ggthemes")
install.packages("extrafont")
install.packages("plyr")

library("ggplot2")
library("ggthemes")
library("extrafont")
library("plyr")

df2 <- read.csv("/Users/rawassizadeh/EVERYTHING/Work/TEACHING/CS\ 688\ -\ Web\ Analytics\ and\ Mining/Session\ 2/copper-data-for-tutorial.csv" , header=TRUE, sep=",")
df2

p2 <- ggplot() + geom_area(aes(y = export, x = year, fill = product), data = df2,  stat="identity")
p2
# read more about it here: http://t-redactyl.io/blog/2015/12/creating-plots-in-r-using-ggplot2-part-2-area-plots.html

#--------------------Heat Map-----------

x <- c(12,23,40,35,13,34,25,15,17,32,23,36,33,31)
y <- c(10,13,35,35,32,23,32,37,23,34,35,15,17,32)
z <- c(23,26,25,15,13,14,31,13,17,37,23,31,33,12)
df <- cbind(x,y,z)
heatmap(df, scale = "none")
# check here for more examples: https://www.datanovia.com/en/lessons/heatmap-in-r-static-and-interactive-visualization/

#---------------- Calendar plot ------------------

# http://margintale.blogspot.in/2012/04/ggplot2-time-series-heatmaps.html
library(ggplot2)
library(plyr)
library(scales)
library(zoo)

df <- read.csv("/Users/rawassizadeh/EVERYTHING/Work/TEACHING/CS\ 688\ -\ Web\ Analytics\ and\ Mining/toGithub/Session\ 2/yahoo.csv", header=TRUE, sep=",")
df$date <- as.Date(df$date)  # format date
df <- df[df$year >= 2012, ]  # filter reqd years

# Create Month Week
df$yearmonth <- as.yearmon(df$date)
df$yearmonthf <- factor(df$yearmonth)
df <- ddply(df,.(yearmonthf), transform, monthweek=1+week-min(week))  # compute week number of month
df <- df[, c("year", "yearmonthf", "monthf", "week", "monthweek", "weekdayf", "VIX.Close")]
head(df)

# Plot
ggplot(df, aes(monthweek, weekdayf, fill = VIX.Close)) + 
  geom_tile(colour = "white") + 
  facet_grid(year~monthf) + 
  scale_fill_gradient(low="blue", high="red") +
  labs(x="Week of Month",
       y="",
       title = "Calendar plot example", 
       subtitle="", 
       fill="Close")

#----------- Timeline plot ------------
install.packages("timevis")

library(timevis)

data <- data.frame(
  id      = 1:4,
  content = c("Eating Lots of Carbs", "Eating Lots of Fats",
              "Staying in hospital", "Start Excersize"),
  start   = c("2019-01-10", "2019-01-11",
              "2019-01-20", "2019-02-14"),
  end     = c("2019-01-20", "2019-01-20", "2019-02-10", NA))

timevis(data)

#-------- Violin plot -------------

install.packages("ggpubr")
library("ggpubr")
ToothGrowth

data("ToothGrowth")
df <- ToothGrowth
ggviolin(df, x = "dose", y = "len", add = "boxplot")


---- 
ggplot(mtcars, aes(x = factor(cyl), y = mpg)) + 
  geom_violin() +
  geom_boxplot(width = 0.1) + 
  #theme_bw()
  theme(
        panel.background = element_blank(), axis.line = element_line(colour = "black"))
# fill = factor(cyl)
mtcars

----
library(ggjoy)

dat %>% mutate(group = reorder(group, value, median)) %>% 
  ggplot(aes(group, value)) + geom_violin(fill = "blue")


ToothGrowth


#----Data Ink Ratio Example----

df <- cbind(12,7,5,8,11,13,16)
barplot(df, col="blue", bg="gray", names.arg=c("a","b","c","d","e","f","g"),
        beside = TRUE, cex.axis = par("cex.axis"), cex.names = par("cex.axis"))


#------ Cord diagram ------
install.packages("devtools")
library("devtools")
devtools::install_github("mattflor/chorddiag")

library("chorddiag")

mymat <-  cbind(c(0,3,12,6), c(2,0,9,8), c(3,5,0,7), c(4,9,6,0))
plot(mymat)

mat = matrix(1:25, 5)
rownames(mat) = letters[1:5]
colnames(mat) = LETTERS[1:5]
mat
chorddiag(mat)

ab <- as.matrix(mymat)
colnames(ab) = LETTERS[1:4]
ab
chorddiag(ab)

#--------- Diverging bar ------------
library(ggplot2)
# Data Prep
data("mtcars")  # load data
mtcars$`car name` <- rownames(mtcars)  # create new column for car names
mtcars$mpg_z <- round((mtcars$mpg - mean(mtcars$mpg))/sd(mtcars$mpg), 2)  # compute normalized mpg
mtcars$mpg_type <- ifelse(mtcars$mpg_z < 0, "below", "above")  # above / below avg flag
mtcars <- mtcars[order(mtcars$mpg_z), ]  # sort
mtcars$`car name` <- factor(mtcars$`car name`, levels = mtcars$`car name`)  # convert to factor to retain sorted order in plot.


# Diverging Barcharts
ggplot(mtcars, aes(x=`car name`, y=mpg_z, label=mpg_z)) + 
  geom_bar(stat='identity', aes(fill=mpg_type), width=.5)  +
  scale_fill_manual(name="Mileage", 
                    labels = c("Above Average", "Below Average"), 
                    values = c("above"="#00ba38", "below"="#f8766d")) + 
#  labs(subtitle="Normalised mileage from 'mtcars'", 
#       title= "Diverging Bars") + 
  coord_flip()



#----------- Diverging bar plot second example---------------
library(ggplot2)

nams <- c("Zohre","Felix", "Ali", "Chloe", "Kibwe", "Ganesh", "Christiane", "Torvald", "Qillaq", "Suraya", "Ping", "Severinus", "Zhou", "Erika", "Yarden", "Linda", "Marina")
scores <- c(20,19,18,17,15,13,12,11,11,10,5,3,0,-2,-3,-6,-9)
scores

db <- data.frame(nams,scores)
db$scores
db$friendtype <- ifelse(as.numeric(db$scores) < 0, "bad", "good") 
db$friendtype

ggplot(db, aes(x=nams, y=scores, label=nams)) + 
  geom_bar(stat='identity', aes(fill=scores), width=1)  +
  coord_flip()

db$nams <- factor(db$nams, levels = db$nams[order(db$scores)]) # impose ordering, otherwise ggplot do not order them

ggplot(db, aes(x=nams, y=scores)) + 
  geom_bar(stat='identity', aes(fill=db$friendtype), width=0.75)  +
  scale_fill_manual(name="Scores", 
                    labels = c("Bad Relationship", "Good Relationship"), 
                    values = c("good"="#00ba38", "bad"="#f8766d")) + 
  coord_flip()


#----------- Dumbbell chart---------------
install.packages("ggalt")
library(ggalt)

health <- read.csv("https://raw.githubusercontent.com/selva86/datasets/master/health.csv")
health$Area <- factor(health$Area, levels=as.character(health$Area))
# example 1
ggplot(health, aes(x=pct_2013, xend=pct_2014, y=Area)) + 
  geom_dumbbell()

# example 2
ggplot(health, aes(x=pct_2013, xend=pct_2014, y=Area)) + 
  #create a thick line between x and xend instead of using defaut 
  #provided by geom_dubbell
  geom_segment(aes(x=pct_2013, 
                   xend=pct_2014, 
                   y=Area, 
                   yend=Area), 
               color="#b2b2b2", size=1.5)+
  geom_dumbbell(color="light blue", 
                size_x=3.5, 
                size_xend = 3.5,
                #Note: there is no US:'color' for UK:'colour' 
                # in geom_dumbbel unlike standard geoms in ggplot()
                colour_x="#edae52", 
                colour_xend = "#9fb059")+
  labs(x=NULL, y=NULL, 
       title="Dumbbell Chart", 
       subtitle="Pct Change: 2013 vs 2014")+
  geom_text(color="black", size=2, hjust=-0.5,
            aes(x=pct_2013, label=pct_2013))+
  geom_text(aes(x=pct_2014, label=pct_2014), 
            color="black", size=2, hjust=1.5)


# example 3
food <- c("Pizza","Burger", "Apple", "Broccoli", 
          "Bannana", "Avocado", "Annanas", "Kiwi", 
          "Orange", "White bread", "Ice Cream", "Kabab", 
          "Fish", "Carrot", "Ramen Nuddle","Spaghetti",
          "Sugary Drink")
month1 <- c(20,19,8,20,
            10,11,5,11,
            15,20,9,6,
            8,2,4,14,
            15)
month2 <- c(10,14,12,22,
            10,14,8,7,
            15,15,1,6,
            12,7,8,5,
            11)

foods <- data.frame(food, month1, month2) 

foods$food <- factor(foods$food, levels = foods$food[order(foods$month1)]) # impose ordering, otherwise ggplot do not order them


ggplot(foods, aes(x=month1, xend=month2, y=food)) + 
  #create a thick line between x and xend instead of using defaut 
  #provided by geom_dubbell
  geom_segment(aes(x=month1, xend=month2, 
                   y=food, 
                   yend=food), 
               color="#b2b2b2", size=1.5)+
  geom_dumbbell(color="light blue", # line color
                size_x=3.5, 
                size_xend = 3.5,
                #Note: there is no US:'color' for UK:'colour' 
                # in geom_dumbbel unlike standard geoms in ggplot()
                colour_x="darkolivegreen3", 
                colour_xend = "orange")+

  geom_text(aes(x=month1, label=month1), color="black", size=3, hjust=-0.75)+
  geom_text(aes(x=month2, label=month2), color="black", size=3, hjust=1.5)
  