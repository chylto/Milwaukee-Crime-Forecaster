library(lubridate)
library(dplyr)

pot2 <-na.omit(read.csv("cleanedData.csv"))
date=as.Date(pot2$date2)

days <- pot2 %>% group_by(date) %>% summarise(frequency = n())
d <- days$date
for (i in 1:length(days$date)) {
  if(length(days$date[i])<8){
    days$date[i]=paste("0",days$date[i])
  }
}
