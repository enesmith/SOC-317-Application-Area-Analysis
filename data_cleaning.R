# Author: Elisabeth Nesmith
# Title: Data Cleaning
# Purpose: Loading and cleaning data

# Load necessary packages
library(data.table)
library(tidyverse)

# This data is from the 2020-2021 Healthy Minds Study. The data I pull in here is a subset of the original dataset, which contained
# over 2000 variables. This subset only contains gender, race, age, and financial variables, as well as three different indicators of
# student wellbeing and belonging.

# Load data as data tables
hms_data <- as.data.table(read.csv("Data/hms_2021_data_sub.csv"))

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

# remove rows with NA gender and NA response variables
hms_data_new <- hms_data %>% 
  filter(!is.na(gender_female) | !is.na(gender_male) | !is.na(gender_transm) | !is.na(gender_transf) | !is.na(gender_queernc) |
           !is.na(gender_nonbin) | !is.na(gender_selfID)) %>% 
  filter(!is.na(aca_impa)) %>% 
  filter(!is.na(discrim)) %>% 
  filter(!is.na(belong1))

# check how many sex at birth is NA
hms_data_new %>% 
  filter(is.na(sex_birth))

# investigate descriptive statistics of new data
hms_data_new %>% 
  filter(!is.na(gender_transm) | !is.na(gender_transf) | !is.na(gender_queernc) |
           !is.na(gender_nonbin) | !is.na(gender_selfID))

# 1878 rows, out of 43487 rows - 4.3% of sample identifies as trans, genderqueer, gender non-conforming, nonbinary, or otherwise non-cis 

# create new variable which encompasses all non-cis gender categories on the survey
hms_data_new <- hms_data_new %>% 
  mutate(trans = ifelse(!is.na(gender_transm) | !is.na(gender_transf) | !is.na(gender_queernc) | 
                        !is.na(gender_nonbin) | !is.na(gender_selfID), 1, 0))

# create variable for cisgender students
hms_data_new <- hms_data_new %>% 
  mutate(cis = ifelse(trans == 0, 1, 0))

# write csv of hms_data_new into data file
write_csv(hms_data_new, "Data//hms_data_new.csv")
