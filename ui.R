

shinyUI(  dashboardPage(  
  dashboardHeader(title = 'Cydorg'),
  dashboardSidebar(disable = T),
  dashboardBody(
    box(width = 6,leafletOutput('map1')),
    box(width = 6,tags$iframe(src = "http://192.168.1.78:8081",width=400,height=300, seamless=NA)),
    box(verbatimTextOutput('test'))
    
  )
)
)