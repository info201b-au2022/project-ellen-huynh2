library(tidyverse)
library(ggplot2)

#source("data_cleaning_small.R")
source("data_cleaning.R")

#view(crime_data)

summary_table <- crime_data %>%
  mutate(assign_1 = 1) %>%
  group_by(year) %>%
  summarise(
    number_crimes_that_year = sum(assign_1),
    most_frequent_crime_that_year = names(which.max(Offense)),
    most_frequent_neighborhood_that_year = names(which.max(MCPP))
  )
    
#Descriptive Paragraph:
#This table provides information whose purpose is to provide
#summarizing information of our findings to be included in
#our report. For example, it includes the number of crimes for
#a year, the most frequently committed crime, and neighborhood
#with most frequent crime in a given year.
  
