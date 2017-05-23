# Example of a bimodal distribution
x1 = rnorm(1000, 0, 1)
x2 = rnorm(1000, 10, 1)
ind = rbinom(1000, 1, 0.5) 	# 0 or 1 with equal probability 0.5
x = x1*(1 - ind) + x2*ind 	# About half of the time we will have x1, and the rest x2
hist(x) 	# Take a look and see if it is bimodal 
qqnorm(x)	
# QQ-plot is of an S shape with a turning point at 0. This is because half of the data points are concentrated around x1's mean 0, and the other half around x2's mean 10. Both have standard diviation of 1, so it is unlikely that our data x is going to be around 5. This is why the gap occurs at theoretical quantiles = 0, the normal quantile of 0.5. Modify the code above setting x2's mean to 100, the jump will be more obvious. Also, you can modify the binomial probability of ind to be 0.2 or 0.7, and see what happens. The jump will occur at the normal quantiles of probability 0.2 and 0.7 correspondingly.
# Another characteristic of a bimodal distribution is that the points will be dense around the two modes, and scarce elsewhere.

# Example of an asymmetric distribution
y = rexp(1000, 1) 	# y is generated using exponential distribution with mean 1
hist(y) 	# Take a look at the histogram and see if it is asymmetric
qqnorm(y)
# Notice that the concentration of data points on the left is indicated in the QQ-plot with a lot of points on the sample quantiles between 0 and 2.
# Also, the scarcity of points on the right shows that the data comes from a distribution with more data points on the left.