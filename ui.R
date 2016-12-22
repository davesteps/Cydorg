

shinyUI(  dashboardPage(  
  dashboardHeader(title = 'DogTelemtry'),
  dashboardSidebar(disable = T),
  dashboardBody(
    fluidRow(
      column(width=4,
             box(width = 12,tags$iframe(src = "http://192.168.1.78:8081",width=324,height=244, seamless='seamless',align = "center"))
             ),
      column(width=4,
             box(width = 12,leafletOutput('map1',height = 300)),
             box(width = 12,verbatimTextOutput('ip'))

             ),
      column(width=4,
             box(width = 12,plotOutput('tmpPlot',height = 130),solidHeader = T,footer = 'Temp'),
             box(width = 12,plotOutput('altPlot',height = 130),solidHeader = T,footer = 'Alt'),
             box(width = 12,plotOutput('spdPlot',height = 130),solidHeader = T,footer = 'Speed')
             )
    )
    # ,
    # ,
   
    # valueBoxOutput('tempVal',width = 2),
    # valueBoxOutput('speedVal',width = 2)
  )
)
)
