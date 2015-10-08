#load the respective packages for the app
 library(shiny)
 
 #create a fluid page with headerpanel,sidebars and mainpanel
shinyUI(fluidPage(
      headerPanel("Zappos.com Inc.,",windowTitle = "Analysis"),
      
  #sidepanel containing buttons,selections and other inputs
      sidebarLayout(position = "right",
      sidebarPanel(
        selectInput(inputId = "xaxis",label = "X - Coordinate",choices  = "visits"),
        selectInput(inputId = "yaxis",label = "Y - Coordinate",choices = c("distinct_sessions","bounces","add_to_cart","orders")),
        selectInput(inputId="color",label = "color",choices = c("seagreen","red","blue"))
      ),
      
    #mainpanel is the output plot containing various panels
      mainPanel(
        tabsetPanel(
          tabPanel("Plot",plotOutput("zapposplot")),
          tabPanel("Description", verbatimTextOutput("zapposdesc"))
      )
  ))))