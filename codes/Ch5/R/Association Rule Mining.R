install.packages("arules")

library("arules")

cnames <- c("A",    "B",   "C",   "D",   "E",    "F",    "G",    "H",   "I",    "J",   "K")
vals <-     c( TRUE,  TRUE,  TRUE,  TRUE,  FALSE,  FALSE,  FALSE,  TRUE,  FALSE,  TRUE,  FALSE,
               TRUE,  FALSE,  FALSE,  TRUE,  TRUE,  TRUE,  FALSE,  FALSE,  FALSE,  FALSE,  FALSE,
               FALSE,  TRUE,  TRUE,  TRUE,  TRUE,  FALSE,  FALSE,  FALSE,  FALSE,  FALSE,  FALSE,
               TRUE,  TRUE,  TRUE,  TRUE,  FALSE,  FALSE,  FALSE,  FALSE,  TRUE,  FALSE,  FALSE,
               TRUE,  FALSE,  TRUE,  FALSE,  FALSE,  FALSE,  TRUE,  FALSE,  FALSE,  FALSE,  TRUE)
# A,B,C,D,H,J
# A,D,E,F
# B,C,D,E
# A,B,C,D,I
# A,C,G,K

trans <- data.frame(matrix(vals, nrow=5, byrow = TRUE, colnames=colNames))
colnames(trans) <- cnames

trans

rules <- apriori(trans, parameter = list(supp = 0.6, conf = 0.8, target="rules", minlen=2))

inspect(rules)
summary(rules)

#--------- SPADE ----------
install.packages("arulesSequences")
library("arulesSequences")

data(zaki)
inspect(zaki)

## mine frequent sequences
#s1 <- cspade(zaki, parameter = list(support = 0.4),  control=list(verbose = TRUE, tidLists = TRUE))
s1 <- cspade(zaki, parameter = list(support = 0.4))
summary(s1)
as(s1, "data.frame")

##
summary(tidLists(s1))
transactionInfo(tidLists(s1))


