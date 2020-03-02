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
