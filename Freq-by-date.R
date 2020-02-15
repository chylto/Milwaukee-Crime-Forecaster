library(lubridate)
library(dplyr)

pot2 <-read.csv("C:/Users/Caroline/Documents/GitHub/Milwaukee-Crime-Forecaster/cleanedData.csv")
date=as.Date(pot2$date2)

pot2 %>% group_by(date) %>% summarise(frequency = n())
