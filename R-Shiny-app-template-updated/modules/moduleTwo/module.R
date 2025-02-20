moduleTwo <- list(
  
  "ui" = fluidPage(
    "Lab 6: R Shiny apps

* Download and unzip the R Shiny app template repository: https://github.com/mtwatso2-eng/R-Shiny-app-template\n
* Take a look at the files in the app folder you downloaded. Which one do you use to run the app?
* Open that file and run the app locally using the “Run App” button.
* The app contains two modules (which are displayed like tabs in the app). You could potentially use each of these to display a different part of the report for your group project. Let’s say you want module two to contain paragraphs of text describing your dataset. Where in the app folder would you go to change this?
* Now let’s rename module two to”Dataset description”. How do we change its name?
* Load some of the data from your group project into the app.
* Edit the first module to plot features from your project data.
* Publish your project to shinyapps.io so it’s accessible from a public URL. Does it still work?"
  ),
  
  "server" = function(input, output, session){
    
    
    
  }
  
)