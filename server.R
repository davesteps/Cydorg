




readGPS <- function(fp){jsonlite::fromJSON(readLines(fp))}

shinyServer(function(input, output, session) {

  
  temp <- reactiveFileReader(2000,session,filePath = 'temp.log',readFunc = readLines)
  gps <- reactiveFileReader(2000,session,filePath = 'gps.log',readFunc = readGPS)
  
  
  output$map1 <- renderLeaflet({
    # bb <- config()$bounding_box
    leaflet() %>% addTiles() 
    # %>% fitBounds(bb[1],bb[2],bb[3],bb[4])

  })

  output$test <- renderPrint({
    print(temp())
    str(gps())
  })
  
})
