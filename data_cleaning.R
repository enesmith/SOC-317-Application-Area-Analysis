# Author: Elisabeth Nesmith
# Title: Data Cleaning
# Purpose: Loading data, selecting variables, and cleaning data

# Load necessary packages
library(data.table)
library(tidyverse)

# Load data as data tables
yrbs_qn <- as.data.table(read.csv("Data/2019_YRBS_qn_variables.csv"))
yrbs_q <- as.data.table(read.csv("Data/2019_YRBS_q_variables.csv"))

# Merge q variables with qn variables with key variables
keys <- c("site", "raceeth", "q6orig", "q7orig", "record", "orig_rec", "q1", "q2", "q3", "q4", "q5", "q6", "q7")
yrbs_2019 <- merge(yrbs_qn, yrbs_q, by = keys, all = TRUE)
