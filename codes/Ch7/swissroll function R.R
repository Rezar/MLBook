install.packages("plotly")
install.packages("Rtsne")

library("plotly")
library("Rtsne")


df <- read.csv("/Users/rawassizadeh/EVERYTHING/Work/DM Book/Codes/Ch7/swiss-roll.csv", head=TRUE)
mycol = df$color 

t <- list(size = 14)
p <- plot_ly(x = df$X, y = df$Y, z=df$Z,
             marker = list(color = mycol, size = 4 )) %>% 
                    layout(scene = list(xaxis = list(title = 'x'),
                                        yaxis = list(title = 'y'),
                                        zaxis = list(title = 'z')),
                                        font = t)
p # show the plotly plot

df2  <- cbind(df$X,df$Y,df$Z)
#df2
reducedDF <-  Rtsne(df2)$Y

p2 <- plot_ly(x = reducedDF[,1], y = reducedDF[,2], 
             marker = list(color = mycol, size = 4 )) %>% 
  layout(scene = list(xaxis = list(title = 'x'),
                      yaxis = list(title = 'y')),
         font = t)
p2


#-----PCA
df3 <- prcomp(df2)
PC <- data.frame(df2, df3$PC1, df3$PC2, df3$PC3)



p3 <- plot_ly(x = df3[,1], y = df3[,2], 
              marker = list(color = mycol, size = 4 )) %>% 
  layout(scene = list(xaxis = list(title = 'x'),
                      yaxis = list(title = 'y')),
         font = t)
p3