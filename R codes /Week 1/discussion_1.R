# Discussion 1 01/06/2016
# Introduction to R

####################################################################################

# Types of data
# There are 5 basic data types in R: numeric, integer, complex, logical, and character.
numData <- 1.5 	# assigns value 1.5 to variable numData
class(numData)	# returns the type of numData
is.numeric(numData)	# returns whether numData is numeric
is.integer(numData)	# returns whether numData is integer

intData <- 3
class(intData)	# notice the return type of intData
intData <- as.integer(intData)	# now intData is of type integer
as.integer(3.5)	# if a non-integer is provided...

boolData <- TRUE
boolData <- FALSE
boolData <- 3 > 4	# returns FALSE
boolData & TRUE	# and
boolData | TRUE	# or
!boolData	# negation

# Feel free to explore the other two basic data types on your own.

# Beyond basic data types, there are also more advanced ones: vector, matrix, list, and data frame.
v1 <- c(1, 2, 3, 4, 5)	# declares a vector
v2 <- c(2, 3, 4, 5)
v.combined <- c(v1, v2)	# combines v1 and v2 into one vector
length(v.combined)	# returns the length of the vector
v.combined[6]	# accesses the 6th element in v.combined
v.combined[-2]	# removes the 2nd element in v.combined

A <- matrix(v.combined, nrow=3, ncol=3) # creates a 3*3 matrix with entries taken from v.combined
dim(A)	# returns the dimensions of A, a vector of length 2

mtcars	# a built-in dataset in R
class(mtcars)	# mtcars is of type data.frame
head(mtcars)	# only shows the first 
dfA = data.frame(A)
dfA$X1
mtcars$mpg

# Please explore list on your own. You might find it useful in the future.

####################################################################################

# Association between two variables
x <- rnorm(100, 0, 1)	# generates 100 iid random variables ~ N(0, 1)
y.ind <- rnorm(100, 0, 1)
y.dep <- x^2 + rnorm(100, 0, 1)
plot(x, y.ind)	# scatterplot
plot(x, y.dep)

####################################################################################

# Histograms
library(ggplot2)	# a very handy package for plotting in R	
ggplot(mtcars, aes(cyl)) + geom_histogram()
hist(mtcars$mpg)	# built-in function in R for plotting histograms

####################################################################################

# Dot plots
dotchart(mtcars$mpg, labels=row.names(mtcars), xlab="MPG")

####################################################################################

# Box plots
boxplot(mtcars)
# Please know how to read a boxplot. Here is a link, https://flowingdata.com/2008/02/15/how-to-read-and-use-a-box-and-whisker-plot/

####################################################################################

# Contingency tables
table(mtcars$cyl)
table(mtcars$cyl, mtcars$gear)
prop.table(mtcars$cyl)