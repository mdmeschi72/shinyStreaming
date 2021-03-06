
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

function(input, output, session) {

  # invalidate later will automatically invalide the 
  # object every 5 seconds, in effect checking the .csv file every 
  # 5 seconds for changes and redrawing the graph
  # this is perfect for streaming 
  
  data <- reactiveFileReader(
     5000,  
     session, 
     '/home/mark/Documents/data.csv',
     read.csv
  )
  
  output$line <- renderPlot({
    plot(data(), type="l")
  })

}
