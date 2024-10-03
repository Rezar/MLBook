install.packages('kohonen')


# the source of this example is https://cran.r-project.org/web/packages/kohonen/kohonen.pdf
library('kohonen')


mygrid <- somgrid(20, 20, "hexagonal")
fakesom <- list(grid = mygrid)
class(fakesom) <- "kohonen"
par(mfrow = c(2,1))
dists <- unit.distances(mygrid)
plot(fakesom, type="property", property = dists[1,],
     main="Distances to unit 1", zlim=c(0,6),
     palette = rainbow, ncolors = 7)
dists <- unit.distances(mygrid, toroidal=TRUE)
plot(fakesom, type="property", property = dists[1,],
     main="Distances to unit 1 (toroidal)", zlim=c(0,6),
     palette = rainbow, ncolors = 7)


#---------------------------------
#The source of this example is: https://www.polarmicrobes.org/tutorial-self-organizing-maps-in-r/
#### generate some RGB data ####

## select the number of random RGB vectors for training data
sample.size <- 1000

## generate dataframe of random RGB vectors
sample.rgb <- as.data.frame(matrix(nrow = sample.size, ncol = 3))
colnames(sample.rgb) <- c('R', 'G', 'B')

sample.rgb$R <- sample(0:255, sample.size, replace = T)
sample.rgb$G <- sample(0:255, sample.size, replace = T)
sample.rgb$B <- sample(0:255, sample.size, replace = T)


grid.size <- ceiling(sample.size ^ (1/2.5))
som.grid <- somgrid(xdim = grid.size, ydim = grid.size, topo = 'hexagonal', toroidal = T)
som.model <- som(data.matrix(sample.rgb), grid = som.grid)

som.events <- som.model$codes[[1]]
som.events.colors <- rgb(som.events[,1], som.events[,2], som.events[,3], maxColorValue = 5)
som.dist <- as.matrix(dist(som.events))

## generate a plot of the untrained data. this isn't really the configuration at first iteration, but
## serves as an example

plot(som.model,
     type = 'mapping',
     bg = som.events.colors[sample.int(length(som.events.colors), size = length(som.events.colors))],
     keepMargins = F,
     col = NA,
     main = '')

## generate a plot after training.

plot(som.model,
     type = 'mapping',
     bg = som.events.colors,
     keepMargins = F,
     col = NA,
     main = '')

#-------------------

sommap <- som(scale(sample.rgb),grid = somgrid(10, 10, "rectangular"))

plot(sommap, type="dist.neighbours", main = "SOM neighbour distances")
## use hierarchical clustering to cluster the codebook vectors
som.hc <- cutree(hclust(object.distances(sommap, "codes")), 6)
add.cluster.boundaries(sommap, som.hc)

## Show the U matrix
Umat <- plot(sommap, type="dist.neighbours", main = "SOM neighbour distances")
## use hierarchical clustering to cluster the codebook vectors
som.hc <- cutree(hclust(object.distances(sommap, "codes")), 5)
add.cluster.boundaries(sommap, som.hc)


#-----------------------------------------------

#-------aweSOM library -------------------
install.packages('aweSOM')
# https://cran.r-project.org/web/packages/aweSOM/vignettes/aweSOM.html
library('aweSOM')

full.data <- iris
## Select variables
train.data <- full.data[, c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")]
### Scale training data
train.data <- scale(train.data)

### RNG Seed (for reproducibility)
set.seed(1465)
### Initialization (PCA grid)
init <- somInit(train.data, 4, 4)
## Train SOM
iris.som <- kohonen::som(train.data, grid = kohonen::somgrid(4, 4, "hexagonal"), 
                         rlen = 100, alpha = c(0.05, 0.01), radius = c(2.65,-2.65), 
                         dist.fcts = "sumofsquares", init = init)

somQuality(iris.som, train.data)

iris.som

superclust_pam <- cluster::pam(iris.som$codes[[1]], 3)
superclasses_pam <- superclust_pam$clustering

superclust_hclust <- hclust(dist(iris.som$codes[[1]]), "complete")
superclasses_hclust <- cutree(superclust_hclust, 3)

aweSOMplot(som = iris.som, type = 'Cloud', data = full.data, 
           variables = c('Species', 'Sepal.Length', 'Sepal.Width',  
                         'Petal.Length', 'Petal.Width'), 
           superclass = superclasses_pam)

