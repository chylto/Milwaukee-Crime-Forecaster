df <- na.omit(read.csv('mke_wibrs_db\\testdata.csv'))
head(df)
tail(df)
summary(df)


df$year <- as.numeric(substring(df$c_violation_date,first=1, last=4))
df$month <- as.numeric(substring(df$c_violation_date,first=6, last=7))
df$day <-as.numeric(substring(df$c_violation_date,first=9, last=10))
df$date <- paste(df$day, df$month,df$year, sep="")
df$date2 <- as.Date(df$date, "%d%m%Y")

year <- c(2009:2014)
months <-c(1:12)
days <- c(1:31)
