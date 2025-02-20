modulePanel <- function(title, value){
  tabPanel(
    title = title,
    value = value,
    eval(parse(text = value))$ui
  )
}

reloadWarning <- tags$head(tags$script(HTML("
    // Enable navigation prompt
    window.onbeforeunload = function() {
        return 'Your changes will be lost!';
    };
")))