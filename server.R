


parseTemp <- function(f){
  t <- read.csv(f,header = F,stringsAsFactors = F)
  t$V1 <- as.POSIXct(t$V1,format='%d-%B-%Y %H:%M')
  t$V2 <- round(as.numeric(t$V2),2)
  t
}

parseGPS <- function(f){
  t <- read.csv(f,header = F,stringsAsFactors = F)
  t$V1 <- as.POSIXct(t$V1,format='%Y-%m-%dT%H:%M:%S')
  t[2:5] <- lapply(t[2:5],as.numeric)
  t
}




shinyServer(function(input, output, session) {
  
  tempLog <- parseTemp('temp.log')
  tempCrnt <- reactiveFileReader(2000,session,filePath = 'temp.current',readFunc = parseTemp)
  
  observeEvent(tempCrnt(),{
    tempLog <<- rbind(tempLog,tempCrnt())
  })
  output$tmpPlot <- renderPlot({
    invalidateLater(60e3)
    if(sum(!is.na(tempLog$V1))<10) return(NULL)
    ggplot(tempLog,aes(x=V1,y=V2))+geom_point()+xlab(NULL)+theme_minimal()+ylab('C')
  })
  
  # output$tempVal <- renderValueBox({
  
  #   valueBox(tempCrnt()$V2,subtitle = 'C',icon = icon('thermometer-0'),width = 2)
  # })
  
  gpsLog <- parseGPS('gps.log')
  gpsCrnt <- reactiveFileReader(2000,session,filePath = 'gps.current',readFunc = parseGPS)
  gpsValid <- function(gpsLog) sum(!is.na(gpsLog$V1))>5
  
  observeEvent(gpsCrnt(),{
    gpsLog <<- rbind(gpsLog,gpsCrnt())
  })
  
  output$altPlot <- renderPlot({
    invalidateLater(30e3)
    if(!gpsValid(gpsLog)) return(NULL)
    ggplot(gpsLog,aes(x=V1,y=V4))+geom_line()+xlab(NULL)+theme_minimal()+ylab('m')
  })
  output$spdPlot <- renderPlot({
    invalidateLater(30e3)
    if(!gpsValid(gpsLog)) return(NULL)
    ggplot(gpsLog,aes(x=V1,y=V5))+geom_line()+xlab(NULL)+theme_minimal()+ylab('m/s')
  })
  

  
  # output$speedVal <- renderValueBox({
  #   valueBox(gpsCrnt()$speed,subtitle = 'm/s',width = 2)
  # })
  # 

  
  output$map1 <- renderLeaflet({
    leaflet() %>% addTiles()  
    
  })
  
  
  observeEvent(gpsCrnt(),{
    lat <- gpsCrnt()$V2
    lng <- gpsCrnt()$V3
    if(!is.na(lng)&&!is.na(lat))
      leafletProxy('map1') %>% addMarkers(lng,lat,layerId = '1') 
  })
  observe({
    invalidateLater(60e3)
    if(gpsValid(gpsLog)){
      t <- gpsLog
      t <- t[!is.na(t$V3)&!is.na(t$V2),]
      leafletProxy('map1') %>% addCircleMarkers(t$V3,t$V2,5,layerId = '2',stroke = F,fillOpacity = 0.8,
                                                color = "red") %>% setView(mean(t$V3),mean(t$V2),15)
    }
  })
  # 
  
})
