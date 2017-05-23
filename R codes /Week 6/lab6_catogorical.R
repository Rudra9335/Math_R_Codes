load("04cars.version2.rda")
tmp = dat[,c(2,3,7,8,10,11)] # extract selected variables
tmp = tmp[complete.cases(tmp),] # extracts complete cases
tmp = as.data.frame(tmp)
names(tmp) = c("type", "drive", "cyl", "hp","mpg","wt") # abbreviate names

# most cars have either 4, 6, or 8 cylinders
with(tmp, table(cyl))

# we remove the other ones for the sake of presenting the material
dat = subset(tmp, (cyl==4)|(cyl==6)|(cyl==8))
attach(dat)

## mpg on cyl as numeric
cyl = as.numeric(cyl)
plot(cyl, mpg, pch = 16)
fit = lm(mpg ~ cyl)
summary(fit)
abline(fit, col="red", lwd = 2)

# diagnostic plots
par(mfrow=c(2,3))
plot(fit, which = 1:6)

## mpg on cyl as categorical (factor)
cyl = as.factor(cyl)
table(cyl)
boxplot(mpg ~ cyl, ylab='MILES PER GALLON', xlab='NUMBER OF CYLINDERS', lwd=2, pch = 16)
fit = lm(mpg ~ cyl)
summary(fit)
anova(fit)

## mpg on drive and cyl w/o interactions
drive = as.factor(drive)
fit = lm(mpg ~ drive + cyl)
summary(fit)
anova(fit)

# compare with
fit0 = lm(mpg ~ 1); fit1 = lm(mpg ~ drive); anova(fit0, fit1)
fit0 = lm(mpg ~ 1); fit1 = lm(mpg ~ cyl); anova(fit0, fit1)
fit0 = lm(mpg ~ drive); fit1 = lm(mpg ~ drive + cyl); anova(fit0, fit1)
fit0 = lm(mpg ~ cyl); fit1 = lm(mpg ~ drive + cyl); anova(fit0, fit1)

# compare with
fit = lm(mpg ~ drive + cyl)
summary(fit)
anova(fit)

## mpg on drive and cyl w/ interactions
interaction.plot(cyl, drive, mpg, col=2:4, lwd=2, cex.axis=1.5, cex.lab=1.5)
fit = lm(mpg ~ drive*cyl)
summary(fit)
anova(fit)

## mpg on wt and drive w/ interactions
pairs(mpg ~ wt + drive, pch = 16)
ind = (drive==0)
plot(wt[ind], mpg[ind], col=2, pch=2)
fit = lm(mpg[ind] ~ wt[ind])
abline(fit, col=2, lwd=2)  
ind = (drive==1)
points(wt[ind], mpg[ind], col=3, pch=3)
fit = lm(mpg[ind] ~ wt[ind])
abline(fit, col=3, lwd=2)  
ind = (drive==2)
points(wt[ind], mpg[ind], col=4, pch=4)
fit = lm(mpg[ind] ~ wt[ind])
abline(fit, col=4, lwd=2)  

# Instead of fitting a model to each group defined by drive (as we just did), we now fit the model with wt and drive.  The only thing that really changes is our estimate for the error variance, which is here assumed to be the same across groups.
fit = lm(mpg ~ wt*drive)
summary(fit)
anova(fit)
