

shinyUI(  dashboardPage(  
  dashboardHeader(title = 'Cydorg'),
  dashboardSidebar(disable = T),
  dashboardBody(
    box(width = 4,leafletOutput('map1',height = 300)),
    box(width = 4,tags$iframe(src = "http://192.168.1.78:8081",width=324,height=244, seamless='seamless')),
    # box(width = 4,plotOutput('tempPlot')),
    valueBoxOutput('tempVal',width = 2),
    valueBoxOutput('speedVal',width = 2)
  )
)
)
