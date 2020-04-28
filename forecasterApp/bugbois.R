library(ks)
df <-read.csv('cleanedData.csv')

summary(df)

k<-kde(x=c(df$x_lng, df$ylat))
print(summary(k))

plot(k)
