#load the necessary library file for the app
library(shiny)

#add the dataset in a readable form and store it in an object 
train <-  read.csv("data1.csv", header = T, sep = ",")

#the function to plot graph in the ui afer getting responsive input from the user
plotgraph <- function(ycord,plotcolor){
  #check the y-cord and decide the plot according to their values
  if((toString(ycord))=="distinct_sessions")
  {
        plot(train$visits,train$distinct_sessions,pch=14,
         col=plotcolor,
         xlab = "visits",ylab = "distinct sessions", main = "visits vs session") 
  }
  else if((toString(ycord))=="add_to_cart")
  {
    plot(train$visits,
         train$add_to_cart,pch=19,
         col=plotcolor,
         xlab = "visits",ylab = "product added", main = "visits vs product added")
  }
  else if((toString(ycord)) == "orders")
  {
    plot(train$visits,
         train$orders,pch=13,
         col=plotcolor,
         xlab = "visits",ylab = "orders", main = "visits vs orders")
  }
  else
  {
    plot(train$visits,
         train$bounces,pch=12,
         col=plotcolor,
         xlab = "visits",ylab = "bounces", main = "visits vs bounces")
  }
}

#function for building the description of a graph
plotdesc <- function(x,y,color){
  paste("This is an analysis graph from the data set given, showing",x,"vs",y,"in",color,"colour",sep=" ")
}

#shiny server
shinyServer(function(input, output) {
  
  #object to capture the reactive value of the x-axis and y-axis
  plotdescription <- reactive( {
   input_xcord <- input$xaxis
    input_ycord <- input$yaxis
    input_color <- input$color
    plotdesc(input_xcord,input_ycord,input_color)
  })
  
  plotgraph_obj <- reactive( {
    input_xcord <- input$xaxis
    input_ycord <- input$yaxis
    input_color <- input$color
    plotgraph(input_ycord,input_color)
  })
  
  #object to render text and plot values to the respective output zones 
  output$zapposdesc <- renderText({
    p <- plotdescription()
    #store the reactive function in a variable and render it in the output
    p
  })
  
  output$zapposplot <- renderPlot({
    q <- plotgraph_obj()
    #store the reactive function in a variable and render it in the output
    q
  })
  
  })

