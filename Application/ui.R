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
       plotOutput("pricePlot", hover = hoverOpts(
           id = "plotHover"
       )),
       verbatimTextOutput("hoverInfo"),
       
       h4("Summary"),
       p("This interactive visualization shows the evolution of the monthly price of an internet connection across Europe."),
       p("On the left, you can choose the speed of the connection, as well as the countries for which to show the data. 
         The plot contains the price trend for the selected parameters, as well as general statistics across all countries for the selected connection speed."),
       p("The gray ribbon in the plot show the maximum and minimum monthly price, and the dashed line represents the mean. The exact values for these statistics
         will be shown in the box below when hovering over the plot."),
       h4("Source"),
       p("Data for this application was taken from the European Union Open Data Portal: "),
       a("Link", href="https://data.europa.eu/euodp/en/data/dataset/nu6TLMS46TeSDUKnHAkw")
    )
  )
))
