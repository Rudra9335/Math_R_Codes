# Discussion 2 01/13/2016
# Getting Started on Assignment 1

####################################################################################

# Read in and clean up data
getwd() 	# get working directory, make sure data file is in the right direcotry
# one can always set working directory using setwd command
data = read.table("babies..txt", header=TRUE) 	# read .txt file into R
head(data) 	# take a look at the first few lines of data

# Group data according to specific feature
data.smoke = data[which(data$smoke == 1), ] 	# data of women who smoked
head(data.smoke)
data.nonsmoke = data[which(data$smoke == 0), ] 	# data of women who did not smoke
head(data.nonsmoke)

# Obtain summary
summary(data) 	# a quick way to obtain a numerical summary of all parameters
summary(data.smoke)
summary(data$bwt) 	# summary of the variable bwt
sd(data$bwt) 	# standard deviation of the variable bwt

# One can always use functions such as mean, median, and etc. for each statistics

####################################################################################

# Graphical summary
install.packages('ggplot2',repos="http://cran.rstudio.com/") 	# Installation
library(ggplot2)
ggplot(data, aes(bwt)) + geom_histogram() 	# histogram of variable bwt
hist(data$bwt) 	# a built-in histogram function in R

boxplot(data$bwt) 	# boxplot for the variable bwt
  
qqnorm(data$bwt) 	# quantile-quantile plot
qqline(data$bwt) 	# quantile-quantile reference line