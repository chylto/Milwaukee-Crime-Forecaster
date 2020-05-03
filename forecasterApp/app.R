#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)
#library(forecast)
library(ks)
library(ggplot2)

df <-read.csv('cleanedData.csv')

df <-na.omit(read.csv('cleanedData.csv'))
df <- df[df$y_lat>42.9,]
df<- df[df$y_lat<43.2,]
df<-df[df$x_lng>-88.08,]


# Define UI for application that draws a histogram
ui <- fluidPage(
  theme= shinytheme("superhero"),
    
    # Application3 title
    titlePanel("Milwaukee Crime Forecaster"),
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
          "Select Day of Interest",
            selectInput("month", "Month:", c("January"=1,"February"=2,"March"=3,"April"=4,"May"=5,"June"=6,"July"=7,"August"=8,"September"=9,"October"=10,"November"=11,"December"=12)),
            selectInput("day", "Day", c(1:31)),
            selectInput("year", "Year:", c(2009:2014))
            
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("plot"),
            
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    output$plot <- renderPlot({
        
        
        df1<-df[df$yearN==input$year,]
        df1<-rbind(df1,df[df$monthN==input$month,])
        df1<-rbind(df1,df[df$dayN==input$day,])
      
        #k<-kde(x=c(df1$x_lng,df1$y_lat))
        #print(summary(k))
        
        #plot(x=df1$x_lng, y=df1$y_lat,)
        
        #ggplot(df1,aes(x=x_lng,y=y_lat,shape=j_finding,color=j_finding))+geom_point()
        #heatmap(df1$x_lng,df1$y_lat)
        ggplot(df1,aes(x=x_lng,y=y_lat))+xlim(-88.072,-87.86)+ylim(42.92,43.2)+geom_point(color="blue") + geom_density_2d(color="black",size=1)+coord_fixed()
    })
    
}

# Run the application 
shinyApp(ui = ui, server = server)
