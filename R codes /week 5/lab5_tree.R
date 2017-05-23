# Lab 5 continue
# Classification tree

# install.packages("Lock5Data",repos="http://cran.us.r-project.org")
# install.packages("tree",repos="http://cran.us.r-project.org")

library(Lock5Data)
data(CommuteAtlanta)
str(CommuteAtlanta)

require(tree)
par(mfrow=c(1,1))
# Let's do a tree regression of distance on age, time and sex.
tree.fit = tree(Distance ~ Age + Time + Sex, data=CommuteAtlanta)

# plot the tree
plot(tree.fit)
# add splitting text
text(tree.fit)
# text(tree.fit, cex=0.5)
summary(tree.fit)
# residual is MSE

# overfitting
tree.overfit = tree(Distance ~ Age + Time + Sex, data=CommuteAtlanta, mindev=0.001)
plot(tree.overfit)
text(tree.overfit, cex=0.25)

# prune the tree
prune.tree(tree.overfit, best=5) # return best pruned tree with 5 leaves, USING traing data!
prune.tree.seq = prune.tree(tree.overfit)
plot(prune.tree.seq) # of course, always decrease

# prune the tree by cross validation, default is 10
tree.cv.seq = cv.tree(tree.overfit) # 10-fold cv
plot(tree.cv.seq)
# get the best splitting number
opt.tree = which(tree.cv.seq$dev == min(tree.cv.seq$dev))
min(tree.cv.seq$size[opt.tree]) # size of smallest optimal tree

# lab 6... more trees