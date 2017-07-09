library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Minimum monthly price of internet access in Europe over time"),
  
  sidebarLayout(
    sidebarPanel(
        
        selectInput("speed", 
                    label = h2("Speed"),
                    choices = unique(internetPrices$breakdown)),
        
        checkboxGroupInput("countries", 
                           label = h2("Countries"), 
                           choices = unique(internetPrices$ref_area),
                           selected = c("BE","NL"))
    ),
    
    mainPanel(
       plotOutput("pricePlot")
    )
  )
))
