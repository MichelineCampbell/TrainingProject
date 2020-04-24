## Script Name: 03_linear_models_on_fish_data
## Purpose: investigate what factors control fish counts
## Initial Author: Dr. Micheline Campbell
## Contributing Authors: Dr. Asha McNeill
## Date Created: 20200424
## Last Edited:
##  By: MC
## Email: michelineleecampbell@gmail.com
## Notes: 

##
## packages
##

library(tidyverse)

##
## Data
##  

dat <- readRDS("output/tidy_fish_data.rds")

##
## models
##

# the formula for linear models is y ~ x

# let's test count by temperature

fit1 <- lm(data = dat, count ~ temperature)
fitsum1 <- summary(fit1) ## absolute shithouse r^2 because it's random data

# let's see if count varies by location
fit2 <- lm(data = dat, count ~ location)
fit2sum<- summary(fit2)
rsqfit2 <- summary(fit2)$adj.r.squared ## extract r ^2
par(mfrow = c(2,2)) # TELLS r you're going to plot 4 plots in a 2*2 grid
# plotfit2 <- plot(fit2) # we can check if model meets assumptions of homogeneity of variance and normality. Residuals vs fitted should look like random scatter, so not grat, but qqplot is plotting on the line, so data are normal

## multivariate linear model
# let's see if count varies with depth and location
fit3 <- lm(data = dat, count ~ depth + temperature)
rsqfit3 <- summary(fit3)$adj.r.squared # still pretty shit
# plotfit3 <- plot(fit3) # residuals v fitted look slightly better
