source("global.R")

ui <- navbarPage(id = "tabs", collapsible = TRUE, title = "Title",
  modulePanel("Module One", value = "moduleOne"),
  modulePanel("Module Two", value = "moduleTwo"),
  tags$head(tags$link(rel="shortcut icon", href="")),
  reloadWarning
)
  
server <- function(input, output, session) {
  
  sapply(list.files(path = "modules"), function(module){
    get(module)$server(input, output, session)
  })
  
}

shinyApp(ui = ui, server = server)