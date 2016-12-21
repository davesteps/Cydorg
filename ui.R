

shinyUI(  dashboardPage(  
  dashboardHeader(title = 'Cydorg'),
  dashboardSidebar(disable = T),
  dashboardBody(
    fluidRow(
      column(width=4,
             box(width = 12,tags$iframe(src = "http://192.168.1.78:8081",width=324,height=244, seamless='seamless'))
             ),
      column(width=4,
             box(width = 12,leafletOutput('map1',height = 300))
             ),
      column(width=4,
             box(width = 12,plotOutput('tmpPlot',height = 150)),
             box(width = 12,plotOutput('altPlot',height = 150)),
             box(width = 12,plotOutput('spdPlot',height = 150))
             )
    )
    # ,
    # ,
   
    # valueBoxOutput('tempVal',width = 2),
    # valueBoxOutput('speedVal',width = 2)
  )
)
)
