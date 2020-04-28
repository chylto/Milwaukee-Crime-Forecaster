#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
#library(forecast)
library(ks)
df <-read.csv('cleanedData.csv')

# Define UI for application that draws a histogram
ui <- fluidPage(
    
    # Application3 title
    titlePanel("Milwaukee Crime Forecaster"),
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
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
        
        summary(df1)
        
        
        k<-kde(x=c(df1$x_lng, df1$ylat))
        print(summary(k))
        
        plot(k)
    })
    
}

# Run the application 
shinyApp(ui = ui, server = server)
