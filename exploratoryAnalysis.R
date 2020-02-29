df<-read.csv('dataCleaned.csv')
model<-lm(df$frequency~df$y*df$m*df$d*df$dow)
model<-lm(df$frequency~df$y+df$m+df$d+df$dow)
summary(model)
#Turns out year and month have a significant relationship to number of events, and some days of the week have an influence but not all.
#interestingly, the date in the month does not have a significant effect.