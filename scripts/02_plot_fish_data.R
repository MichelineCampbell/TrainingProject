## Script Name: 02_plot_fish_data
## Purpose: To plot the fish data
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
## plots
##

# plot1 -  we just want to look at counts of all the fish types
dat2 <- dat %>% 
  group_by(species)

plot1 <- ggplot(data = dat2, aes(x = species, y = count)) +
  geom_point()
plot1
#plot2, let's make add a boxplot
plot2 <- ggplot(data = dat2, aes(x = species, y = count)) + 
  geom_boxplot() +
  geom_point()
plot2

# plot3, I'm also interested in location
plot3 <- ggplot(data = dat2, aes(x = species, y = count, colour = location)) +
  geom_point()
plot3

# plot4, I want to look at only bottom dwelling fish
dat3 <- dat %>% 
  filter(depth == "Bottom")

plot4 <- ggplot(data = dat3, aes(x = species, y = count)) +
  geom_point()
plot4 ##  I wonder where they are found?

plot5 <- ggplot(data = dat3, aes(x = species, y = count, colour = location)) +
  geom_point()
plot5 # All in the Pacific!!

### New question, I only care about whales
dat4 <- dat %>% 
  filter(species == "Whale")

# what depths to whales like?\
plot6 <- ggplot(data = dat4, aes(x = depth, y = count)) +
  geom_point()
plot6

