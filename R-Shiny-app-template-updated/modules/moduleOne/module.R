moduleOne <- list(
  
  "ui" = fluidPage(
    selectInput("columnOfInterest", "Select column to plot", choices = colnames(heiferData)),
    plotlyOutput("plot")
  ),
  
  "server" = function(input, output, session){
    
    output$plot <- plot_ly(heiferData, x = ~Year, y = ~get(input$columnOfInterest), type = "box") %>%
      layout(barmode = "group") %>%
      layout(yaxis = list(title = input$columnOfInterest)) %>%
      renderPlotly
    
  }
)