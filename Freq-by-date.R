library(lubridate)
library(dplyr)

pot2 <-na.omit(read.csv("cleanedData.csv"))
date=as.Date(pot2$date2)

days <- pot2 %>% group_by(date) %>% summarise(frequency = n())
d <- days$date
for (i in 1:length(days$date)) {
  if(nchar(days$date[i])<8){
    days$date[i]=paste0("0",days$date[i])
  }
}

days$y<-as.numeric(substring(days$date, 5,8))
days$m<-as.numeric(substring(days$date, 3,4))
days$d<-as.numeric(substring(days$date, 1,2))
days$date2<- as.Date(x=days$date, format="%d%m%Y")
days$dow <- weekdays(days$date2)
write.csv(days, 'dataCleaned.csv')
