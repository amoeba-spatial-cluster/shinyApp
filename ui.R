library(shiny)

shinyUI(fluidPage(
  h1(a('AMOEBA & AMOEBA+', 
       href='http://cran.r-project.org/web/packages/AMOEBA/AMOEBA.pdf'),
       align='center'),
  p('A Multidirectional Optimum Ecotope-Based Algorithm (AMOEBA) is an algorithm
     to calculate spatial clusters using the Getis-Ord local statistic.
     It searches irregular clusters (ecotopes) on a map through boundaries
     or grid of it. AMOEBA makes a 3-way classification over the map. It 
     identifies which areas are over the mean, those areas which are lower 
     than the mean and the areas near to the mean. It was created in Python
     to use with ArcGIS but now it is implemented in R (AMOEBA package). At 
     the same time, AMOEBA+ is an evolution of AMOEBA and it is also 
     implemented in the same package than the original. This evolution 
     consist in apply AMOEBA to those cluster who detects the previous 
     results of AMOEBA, separately. So we can improve the 3-way 
     classification to the next potency of 3. For example, we can 
     identify 9 categories as much, or 27 and go on.'),
  p('To understand better what does AMOEBA and AMOEBA+, we have the next 
     toy example...'),

  br(),
  h3('... working example ...',align='center'),
  
  fluidRow(

    column(5,align='center',
           br(),br(),
           h4('Columbus OH spatial analysis data set'),
           h6('(data from spdep package)'),
           p('In this example we are going to identify clusters about 
              residential burglaries and vehicle thefts per thousand households 
             in the neighborhood.'),
           p('In the right, we have a map distribution of the residential 
              burglaries and vehicle thefts in Columbur OH.')
    ),
    column(7,
           plotOutput('showmap2')
    ),
    column(11,h3('... play ...'),align='center'),
    column(5,
           selectInput('sel1', label=h4('Choose...'), 
                       choices=list('AMOEBA'=1,'AMOEBA+'=2), selected=1),
           br(),
           conditionalPanel(
             condition = "input.sel1==2",
             h5('Now choose between:'),
             radioButtons('sel2', label='',
                          choices=list(' 9 categories as much'=1,
                                       '27 categories as much'=2),selected = 1)
           ),
           actionButton("showButton", "Show")
    ),
    column(6,
           plotOutput('showmap1')
    )
  )
))