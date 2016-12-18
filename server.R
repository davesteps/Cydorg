

shinyServer(function(input, output) {

  output$map1 <- renderLeaflet({
    # bb <- config()$bounding_box
    leaflet() %>% addTiles() 
    # %>% fitBounds(bb[1],bb[2],bb[3],bb[4])

  })

})
