# Discussion 3 01/20/2016
# More on Normal Approximation and QQ-plot

####################################################################################

# The following might seem complicated, but we will go over the details on board.
x = rbinom(1000, 100, 0.3) 	# generates 1000 samples following Binomial(100, 0.3) distribution
mu = 100*0.3 	# mean of Binomial(100, 0.3) is 100*0.3, (number of trials)*(probability of success)
sigma2 = 100*0.3*(1 - 0.3) 	# variance of Binomial(100, 0.3) is 100*0.3*0.7, (number of trials)*(probability of success)*(probabiliy of failure)
qqplot(rnorm(1000, 0, 1), x) 	# plot sample x over a sample of standard normal distribution
qqnorm(x) 	# alternatively this is similar to the previous line, with a subtle difference
qqline(x) 	# the theoretical line, which connects the first and third quantiles of standard normal distribution

library(actuar)
y = rpareto(1000, 2, 1) 	# a heavy tailed example, Pareto distribution with scale=2 and location=1
qqnorm(y) 	# qq-plot confirms that this does not look like normal distribution at all

z = rcauchy(1000) 	# Cauchy distribution with default location=0 and scale=1
qqnorm(z) 	# qq-plot confirms that this does not look like normal distribution at all