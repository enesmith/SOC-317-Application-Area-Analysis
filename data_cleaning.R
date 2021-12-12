# Author: Elisabeth Nesmith
# Title: Data Cleaning
# Purpose: Loading and cleaning data, creating basic visualizations

# Load necessary packages
library(data.table)
library(tidyverse)

# This data is from the 2020-2021 Healthy Minds Study. The data I pull in here is a subset of the original dataset, which contained
# over 2000 variables. This subset only contains gender, race, age, and financial variables, as well as three different indicators of
# student wellbeing and belonging.

# Load data as data tables
hms_data <- (read.csv("Data/hms_2021_data_subset.csv"))

# check for NA categories
no_gender <- hms_data %>% 
  filter(is.na(gender_female) & is.na(gender_male) & is.na(gender_transm) & is.na(gender_transf) & is.na(gender_queernc) &
           is.na(gender_nonbin) & is.na(gender_selfID))
hms_data %>% 
  filter(is.na(aca_impa))

hms_data %>% 
  filter(is.na(discrim))

hms_data %>% 
  filter(is.na(belong1))

# remove rows with NA gender and NA academic impact (academic impact has fewest number of NAs of three response variables)




