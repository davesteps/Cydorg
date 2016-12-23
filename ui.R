

shinyUI(  dashboardPage(  
  dashboardHeader(title = 'MyDogBytes'),
  dashboardSidebar(disable = T),
  dashboardBody(
    fluidRow(
      column(width=4,
             box(width = 12,tags$iframe(src = "http://mydogbytes:8081",width=324,height=244, seamless='seamless')),
             box(width = 12,leafletOutput('map1',height = 300))
             ),
      column(width=4,
             box(width = 12,verbatimTextOutput('ip'),collapsible = T,collapsed = T),
             valueBoxOutput('tempCrnt',width = 6),
             valueBoxOutput('tempSum',width = 6),
             valueBoxOutput('altMin',width = 6),
             valueBoxOutput('altMax',width = 6),
             valueBoxOutput('spdMean',width = 6),
             valueBoxOutput('spdMax',width = 6)

             ),
      column(width=4,
             box(width = 12,plotOutput('tmpPlot',height = 130),solidHeader = T,footer = 'Temp'),
             box(width = 12,plotOutput('altPlot',height = 130),solidHeader = T,footer = 'Alt'),
             box(width = 12,plotOutput('spdPlot',height = 130),solidHeader = T,footer = 'Speed')
             )
    )
  )
)
)
