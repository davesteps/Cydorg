require(shiny)
require(shinydashboard)
require(leaflet)
require(ggplot2)
require(plyr)

# pi : pw 99*****s!


parseTemp <- function(f){
  t <- read.csv(f,header = F,stringsAsFactors = F)
  t$V1 <- as.POSIXct(t$V1,format='%d-%B-%Y %H:%M')
  t$V2 <- round(as.numeric(t$V2),2)
  t
}

parseGPS <- function(f){
  fl <- lapply(readLines(f),jsonlite::fromJSON)
  plyr::ldply(fl,as.data.frame,stringsAsFactors = F)
}
