library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Price of internet access in European countries over time"),
  
  sidebarLayout(
    sidebarPanel(
        
        selectInput("speed", 
                    label = h2("Speed"),
                    choices = unique(internetPrices$breakdown)),
        
        checkboxGroupInput("countries", 
                           label = h2("Countries"), 
                           choices = unique(internetPrices$ref_area),
                           selected = "BE")
    ),
    
    mainPanel(
       plotOutput("pricePlot")
    )
  )
))
