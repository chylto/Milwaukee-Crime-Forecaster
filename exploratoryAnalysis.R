df<-read.csv('dataCleaned.csv')
model<-lm(df$frequency~df$y*df$m*df$d*df$dow)
model<-lm(df$frequency~df$y+df$m+df$d+df$dow)
summary(model)
#Turns out year and month have a significant relationship to number of events, and some days of the week have an influence but not all.
#interestingly, the date in the month does not have a significant effect.

barplot(table(df$y),main=("Number of Crime Events by Year"))
barplot(table(df$m),main=("Number of Crime Events by Month"))
barplot(table(df$d),main=("Number of Crime Events by Day of Month"))
barplot(table(df$dow),main=("Number of Crime Events by Day of Week"))

totalCrimePerYear=c(0,0,0,0,0,0)
avgCrimePerYear<-totalCrimePerYear
for (i in 2009:2014) {
  d<-df[(df$y==i),]
  totalCrimePerYear[i-2008]=sum(d$frequency)
  avgCrimePerYear[i-2008]=totalCrimePerYear[i-2008]/length(d$frequency)
}
years = data.frame(c(2009:2014),totalCrimePerYear,avgCrimePerYear)

barplot(years$avgCrimePerYear,names.arg = years$c.2009.2014.,main = "Average Crime Events by Year")

totalCrimePerMonth = integer(12)
avgCrimePerMonth = integer(12)

for (i in 1:12) {
  d<-df[(df$m==i),]
  totalCrimePerMonth[i]=sum(d$frequency)
  avgCrimePerMonth[i]=totalCrimePerMonth[i]/length(d$frequency)
}

barplot(avgCrimePerMonth,names.arg = c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"), main = "Average Crime Events by Month", ylim=c(0,50))

totalCrimePerDay = integer(31)
avgCrimePerDay = integer(31)

for (i in 1:31) {
  d<-df[(df$d==i),]
  totalCrimePerDay[i]=sum(d$frequency)
  avgCrimePerDay[i]=totalCrimePerDay[i]/length(d$frequency)
}

barplot(avgCrimePerDay,names.arg = c(1:31), main = "Average Crime Events by Day in Month", ylim=c(0,50))

weekday=c("Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday")
totalCrimePerWeekday = integer(7)
avgCrimePerWeekday = integer(7)

weekdayCrime = data.frame(weekday,totalCrimePerWeekday,avgCrimePerWeekday)

d<-df[(df$dow=="Monday"),]
weekdayCrime$totalCrimePerWeekday[1]=sum(d$frequency)
weekdayCrime$avgCrimePerWeekday[1]=weekdayCrime$totalCrimePerWeekday[1]/length(d$X)

d<-df[(df$dow=="Tuesday"),]
weekdayCrime$totalCrimePerWeekday[2]=sum(d$frequency)
weekdayCrime$avgCrimePerWeekday[2]=weekdayCrime$totalCrimePerWeekday[2]/length(d$X)

d<-df[(df$dow=="Wednesday"),]
weekdayCrime$totalCrimePerWeekday[3]=sum(d$frequency)
weekdayCrime$avgCrimePerWeekday[3]=weekdayCrime$totalCrimePerWeekday[3]/length(d$X)

d<-df[(df$dow=="Thursday"),]
weekdayCrime$totalCrimePerWeekday[4]=sum(d$frequency)
weekdayCrime$avgCrimePerWeekday[4]=weekdayCrime$totalCrimePerWeekday[4]/length(d$X)

d<-df[(df$dow=="Friday"),]
weekdayCrime$totalCrimePerWeekday[5]=sum(d$frequency)
weekdayCrime$avgCrimePerWeekday[5]=weekdayCrime$totalCrimePerWeekday[5]/length(d$X)

d<-df[(df$dow=="Saturday"),]
weekdayCrime$totalCrimePerWeekday[6]=sum(d$frequency)
weekdayCrime$avgCrimePerWeekday[6]=weekdayCrime$totalCrimePerWeekday[6]/length(d$X)

d<-df[(df$dow=="Sunday"),]
weekdayCrime$totalCrimePerWeekday[7]=sum(d$frequency)
weekdayCrime$avgCrimePerWeekday[7]=weekdayCrime$totalCrimePerWeekday[7]/length(d$X)


barplot(weekdayCrime$avgCrimePerWeekday,names.arg = weekdayCrime$weekday, main = "Average Crime Events by Day of the Week", ylim=c(0,50))

data<-read.csv("cleanedData.csv")
summary(data)
