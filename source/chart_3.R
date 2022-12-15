#A bar chart displaying the total of crimes occurred in each month
#Ellen Huynh

library(tidyverse)
library(ggplot2)

#source("data_cleaning_small.R")
source("data_cleaning.R")

#getOption("timeout")
#options(timeout = 300)
#view(crime_data)

#create a column with just the month
crime_data <- crime_data %>%
  mutate(
    month = format(
      as.POSIXct(
        Offense.Start.DateTime, format = '%Y-%m-%d %H:%M:%S'),
      '%m'
    )
  )

#create a column that assigns the value"1" to each crime so that I can find
#total for each month

crime_data <- mutate(
  crime_data, 
  number_of_crime = 1
)

#create a column that finds the total of crimes for each month
total_crimes_in_month <- crime_data %>%
  group_by(month) %>%
  summarise(number_of_crimes = sum(number_of_crime))

#create bar chart
ggplot(total_crimes_in_month, aes(x=month, y=number_of_crimes)) +
  geom_bar(stat = "identity", width=0.5)

#Descriptive Paragraph:

#This bar chart showcases the total of crimes occurred in each month.
#The chart shows crime spikes in certain months. However, this caused 
#us to observe that some months may appear to have a higher count because 
#there were "more" of that month represented in the datset. Therefore, in 
#a future iteration, we will only calculate for just one year.

