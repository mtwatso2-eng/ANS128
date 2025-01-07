require(tidyverse); require(magrittr); require(plotly)

correlationsDir <- "/Users/mtwatson/Desktop/results"
setwd(correlationsDir)

correlationFilePaths <- list.files(pattern = "correlations")

correlations <- correlationFilePaths %>%
  map(., function(x){
    read_csv(x, col_types = "c") %>%
      mutate(
        seed = str_split(x, "_")[[1]][1],
        trait = str_split(x, "_")[[1]][2],
      )
  }) %>%
  bind_rows() %>%
  group_by(seed, trait, method) %>%
  summarise(
    correlation = cor(as.numeric(known), as.numeric(predicted)) ^ 2
  ) %>%
  group_by(seed, trait) %>%
  mutate(ratio = correlation[1] / correlation [2]) %>%
  write_csv("summary.csv")

correlations %>%
  plot_ly(x = ~trait, y = ~correlation, color = ~method, type = "box") %>%
  layout(
    boxmode = "group",
    title = "End-to-end vs traditional genomic prediction for 5 image-derived strawberry fruit traits",
    xaxis = list(
      title = "Extracted numeric trait",
      categoryorder = "array",
      categoryarray = c("LWR", "R", "G", "B", "Redness")
    ),
    yaxis = list(title = "Prediction accuracy (test set Pearson's r²)")
  ) %>%
  print()