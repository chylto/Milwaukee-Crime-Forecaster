df <- na.omit(read.csv('testdata.csv'))
head(df)
tail(df)
summary(df)


df$year <- (substring(df$c_violation_date,first=1, last=4))
df$month <- (substring(df$c_violation_date,first=6, last=7))
df$day <-(substring(df$c_violation_date,first=9, last=10))
df$date <- paste(df$day, df$month,df$year, sep="")
df$date2 <- as.Date(df$date, "%d%m%Y")

df$yearN <- as.numeric(substring(df$c_violation_date,first=1, last=4))
df$monthN <- as.numeric(substring(df$c_violation_date,first=6, last=7))
df$dayN <-as.numeric(substring(df$c_violation_date,first=9, last=10))

write.csv(df, file="cleanedData.csv")

year <- c(2009:2014)
months <-c(1:12)
days <- c(1:31)

d <- df$date
library(lubridate)

dd<- df%>% group_by(date2) %>% summarise(frequency = n())
dd$year <- year(dd$date2)
dd$month <- month(dd$date2)
dd$day <-day(dd$date2)

write.csv(dd, file="frequencyData.csv")
