# lab 4

# sample command
n = 5
sample(n)
sample(n, size = 5, replace=TRUE)

sample(n, size = 3, replace=FALSE)
sample(n, size = 3, replace=TRUE)


# bootstrap w/ replacement
install.packages("Lock5Data", repos="http://cran.us.r-project.org")
library(Lock5Data)
data(CommuteAtlanta)
head(CommuteAtlanta)






# calculate the average
time.mean = mean(CommuteAtlanta$Time)
time.mean






# Bootstrap
B = 1000
n = nrow(CommuteAtlanta)
n
boot.sample.matrix = matrix(sample(CommuteAtlanta$Time, size=B*n, replace=TRUE), B, n)

boot.mean = apply(boot.sample.matrix, 1, mean) # 1 means applying mean row by row
head(boot.mean)

hist(boot.mean, breaks=50, freq=FALSE)

lines(density(boot.mean), col="blue")
lines(density(boot.mean, adjust=2), col="red")



# put graphs together
hist(boot.mean, breaks=50, freq=FALSE)
plot(density(boot.mean), col="red")
lines(density(boot.mean, adjust=2), col="blue") #smooth






time.se = sd(boot.mean)
time.se




# 95% confidence interval

me = 1.96*time.se # 1.96 is the z-score corr. to alpha=0.05
time.mean + c(-1,1)*me










# dataset for HW2

videodata <- read.table("videodata.txt", header=TRUE)
head(videodata)

hist(videodata$time, breaks=100, freq=FALSE)





B = 1000
n = nrow(videodata)
n
boot.sample.matrix = matrix(sample(videodata$time, size=B*n, replace=TRUE), B, n)

boot.mean = apply(boot.sample.matrix, 1, mean)
head(boot.mean)

hist(boot.mean, breaks=50, freq=FALSE)

plot(density(boot.mean), main="density of bootstrap sample means")

# put graphs together
hist(boot.mean, breaks=50, freq=FALSE)
plot(density(boot.mean), col="red")
lines(density(boot.mean, adjust=2), col="red") #smooth



qqnorm(boot.mean)
qqline(boot.mean)


boot.se = sd(boot.mean)

normal = rnorm(5000,boot.mean,boot.se)
plot(density(normal, adjust=2))
lines(density(boot.mean, adjust=2), col="red")





B = 1000
n = nrow(videodata)
n
boot.sample.matrix = matrix(sample(videodata$sex, size=B*n, replace=TRUE), B, n)

boot.mean = apply(!boot.sample.matrix, 1, mean)
head(boot.mean)

female_prop = mean(!videodata$sex)

female_prop

female_se = sd(boot.mean)
female_se

female_prop + c(-1,1)*1.96*female_se

# As n becomes largers, N becomes larger, and n/N is relatively small
# n = 1,000, N = 100,000







