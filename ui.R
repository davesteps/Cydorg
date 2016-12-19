

shinyUI(  dashboardPage(  
  dashboardHeader(title = 'Cydorg'),
  dashboardSidebar(disable = T),
  dashboardBody(
    box(width = 6,leafletOutput('map1')),
    box(verbatimTextOutput('test'))
    
  )
)
)