




readGPS <- function(fp){jsonlite::fromJSON(readLines(fp))}


parseTempLog <- function(){}
parseGPSLog <- function(){}


shinyServer(function(input, output, session) {
  
  # load 

  temp <- reactiveFileReader(2000,session,filePath = 'temp.log',readFunc = readLines)
  # gps <- reactiveFileReader(2000,session,filePath = 'gps.log',readFunc = readGPS)
  # 
  # gpsClean <- reactive({
  #   if(class(gps())!='list')
  #     return()
  #   gps()
  # })
  
  output$map1 <- renderLeaflet({
    # bb <- config()$bounding_box
    leaflet() %>% addTiles()  
    # %>% fitBounds(bb[1],bb[2],bb[3],bb[4])

  })

  
  # observeEvent(gpsClean(),{
  #   
  #   lat <- gpsClean()$lat
  #   lng <- gpsClean()$lon
  #   
  #   leafletProxy('map1') %>% addMarkers(lng,lat,layerId = '1') %>% setView(lng,lat,12)
  #   
  # })
  
  
  makeReactiveBinding('tempdf')
  observeEvent(temp(),{

  })
  
  output$test <- renderPrint({
    s <- strsplit(temp(),',')
    print(s)
  })
  
})
