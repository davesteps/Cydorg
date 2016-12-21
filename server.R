






parseTemp <- function(f){
  t <- read.csv(f,header = F,stringsAsFactors = F)
  t$V1 <- as.POSIXct(t$V1,format='%d-%B-%Y %H:%M')
  t$V2 <- round(as.numeric(t$V2),2)
  t
}

parseGPS <- function(f){
  fl <- lapply(readLines(f),jsonlite::fromJSON)
  plyr::ldply(fl,as.data.frame)
}

shinyServer(function(input, output, session) {
  
  tempLog <- parseTemp('temp.log')
  tempCrnt <- reactiveFileReader(2000,session,filePath = 'temp.current',readFunc = parseTemp)
  
  observeEvent(tempCrnt(),{
    tempLog <<- rbind(tempLog,tempCrnt())
  })
  output$tempPlot <- renderPlot({
    invalidateLater(60e3)
    ggplot(tempLog,aes(x=V1,y=V2))+geom_point()
  })
  output$tempVal <- renderValueBox({
    valueBox(tempCrnt()$V2,'C',icon = icon('thermometer'),width = 2)
  })
  
  # gpsLog <- parseGPS('gps.log')
  # makeReactiveBinding('gpsLog')
  # gpsCrnt <- reactiveFileReader(2000,session,filePath = 'gps.current',readFunc = parseGPS)
  
  
  
  
  
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
  
  
})
