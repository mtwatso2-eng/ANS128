require(shiny)
require(tidyverse); require(magrittr)
require(plotly); require(googledrive)
source("utils.R")

heiferData <- read.csv("Lab03HeiferData.csv")

sapply(list.files(path = "modules", recursive = TRUE, pattern = "^.*\\.R$", full.names = TRUE), source)