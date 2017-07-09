library(shiny)
library(ggplot2)

internetPrices <- read.csv("data/internet-price.csv")

shinyServer(function(input, output) {
    
  output$pricePlot <- renderPlot({
    countries <- input$countries
    speed <- input$speed
      
    dataset <- subset(internetPrices, ref_area %in% countries && breakdown == speed)
    
    g <- ggplot(internetPrices, aes(y = time_period, color = ref_area)) +
        geom_line(aes(y = value)) +
        labs(x = "Year", y = "Cost (€)")
    
    g
  })
  
})
