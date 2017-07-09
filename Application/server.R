library(shiny)
library(ggplot2)
library(dplyr)

internetPrices <- read.csv("data/internet-price.csv")
levels(internetPrices$breakdown) <- c("100 MBps", "12-30 MBps", "30-100 MBps", "8-12 MBps")

shinyServer(function(input, output) {
    
  output$pricePlot <- renderPlot({
    countries <- input$countries
    speed <- input$speed
    
    dataset <- subset(internetPrices, ref_area %in% countries & breakdown == speed)
    
    stats <- subset(internetPrices, breakdown == speed) %>%
        group_by(time_period) %>%
        summarise(min_value = min(value),
                  max_value = max(value), 
                  mean_value = mean(value))
    
    g <- ggplot() +
        geom_ribbon(aes(x = time_period, ymin = min_value, ymax  = max_value, group = NA, color = NA), data = stats, fill = "Gray", color = NA, alpha = 0.3) +
        geom_line(aes(x = time_period, y = mean_value, group = NA), data = stats, color = "Black", linetype = 2) +
        geom_line(aes(x = time_period, y = value, group = ref_area, color = ref_area), data = dataset) +
        scale_y_continuous(expand = c(0, 0), limits=c(0,150), breaks = seq(0, 150, 25)) +
        labs(x = "Year", y = "Monthly Cost (€)", color = "Country") 
    
    g
  })
  
  output$hoverInfo <- renderPrint({
      x = input$plotHover$x
      
      stats <- subset(internetPrices, breakdown == input$speed) %>%
          group_by(time_period) %>%
          summarise(min_value = min(value),
                    max_value = max(value), 
                    mean_value = mean(value))
      
      year = unique(stats$time_period)[x]
      current = subset(stats, time_period == year)
      
      cat("Year:", as.character(year), "\n")
      cat("Highest price:", current$max_value, "\n")
      cat("Lowest price:", current$min_value, "\n")
      cat("Mean price:", current$mean_value, "\n")
  })
  
})
