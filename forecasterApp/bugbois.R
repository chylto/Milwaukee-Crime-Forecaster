library(ks)
library(ggplot2)
df <-na.omit(read.csv('cleanedData.csv'))
df <- df[df$y_lat>42.9,]
df<- df[df$y_lat<43.2,]
df<-df[df$x_lng>-88.08,]

summary(df)
year=2012
month=5
day=22
df1<-df[df$yearN==year,]
df1<-rbind(df1,df[df$monthN==month,])
df1<-rbind(df1,df[df$dayN==day,])


k<-kde(x=c(df1$x_lng,df1$y_lat))
print(summary(k))

plot(x=df1$x_lng, y=df1$y_lat,)

ggplot(df1,aes(x=x_lng,y=y_lat,color=j_finding))+geom_point()
