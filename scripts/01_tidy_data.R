## Script Name: 01_tidy_data.R
## Purpose: Tidy Asha's fish data
## Initial Author: Dr. Micheline Campbell
## Contributing Authors: Dr. Asha McNeill
## Date Created: 20200424
## Last Edited:
##  By: MC
## Email: michelineleecampbell@gmail.com
## Notes: Step 1 in the how to R guide for Ash!

##
## Libraries
##

## you will have to install any libraries you don't have with install.packages("name of library")
library(tidyverse) ## Tidyverse is a whole bunch of packages all together
library(janitor) ## useful for cleaning up new data sets

##
## Notes
##

# I'm using tidyverse syntax for the most part because it's user friendly!


##
## Date
##

dat <- read_csv("data/data.csv")

##
## Data tidying
##

# we need to make sure the data file is going to do what we want it to do

dat <- dat %>% 
  clean_names() # clean names removed any symbols and spaces from column names. Janitor has a heap of functions that are really useful

str(dat) # we need to check the classes of our data. 
View(dat)
# looking at this output we want to change species, location, and depth to factors. Sometimes you will want integers, sometimes, numeric, sometimes date. Rarely character haha. Learn the classes :) 

dat2 <- dat %>% 
  mutate(species = as.factor(species),
         location = as.factor(location),
         depth = as.factor(depth))
str(dat2) # check classes have changed

View(dat2) ## Looking good, now we'll save this tidied data

saveRDS(dat2, "output/tidy_fish_data.rds") ## outputting tidy data as a .rds keeps all of the classes intact. 

