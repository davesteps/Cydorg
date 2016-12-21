





shinyServer(function(input, output, session) {
  
  tempLog <- parseTemp('temp.log')
  tempCrnt <- reactiveFileReader(2000,session,filePath = 'temp.current',readFunc = parseTemp)
  
  observeEvent(tempCrnt(),{
    tempLog <<- rbind(tempLog,tempCrnt())
  })
  output$tempPlot <- renderPlot({
    invalidateLater(60e3)
    if(nrow(tempLog)<10) return(NULL)
    ggplot(tempLog,aes(x=V1,y=V2))+geom_boxplot()
  })
  output$tempVal <- renderValueBox({
    valueBox(tempCrnt()$V2,subtitle = 'C',icon = icon('thermometer-0'),width = 2)
  })
  
  gpsLog <- parseGPS('gps.log')
  gpsCrnt <- reactiveFileReader(2000,session,filePath = 'gps.current',readFunc = parseGPS)
  
  observeEvent(gpsCrnt(),{
    gpsLog <<- rbind(gpsLog,gpsCrnt())
  })
  
  output$gps <- renderPrint({
    str(gpsLog)
  })
  
  # output$speedVal <- renderValueBox({
  #   valueBox(gpsCrnt()$speed,subtitle = 'm/s',width = 2)
  # })
  # 
  # output$altPlot <- renderPlot({
  #   invalidateLater(60e3)
  #   if(nrow(gpsLog)<10) return(NULL)
  #   ggplot(gpsLog,aes(x=V1,y=V2))+geom_boxplot()
  # })
  
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
