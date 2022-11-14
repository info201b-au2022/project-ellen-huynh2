#A pie chart displaying the most common types of crime occurring in Seattle
#Angela Menge

library(tidyverse)
library(dplyr)
library(ggplot2)

source("data_cleaning_small.R")

#create a column with just the hour
small_crime_data <- small_crime_data %>%
  mutate (
    Hour = format(
      as.POSIXct(
        Offense.Start.DateTime, format = '%Y-%m-%d %H:%M:%S'),
      '%H'
      
    )
  )

