library(shiny)
library(AMOEBA)
library(maptools)
library(plotrix)

data(columbus)
map<-readShapePoly(system.file('etc/shapes/columbus.shp',package='spdep')[1])

shinyServer(
  function(input,output){
    output$showmap2<-renderPlot({
      color<-rev(rainbow(length(table(columbus$CRIME)),start=0,end=2/6))
      plot(map,col=color[as.factor(columbus$CRIME)])
      color.legend(map@bbox[1,1],map@bbox[2,1]-0.2,map@bbox[1,2],map@bbox[2,1]-0.4,c('\nLess than 1%','\nMore than 6.5%'),color,align='rb')
    })
    
    output$showmap1<-renderPlot({
      plot(map)
      
      input$showButton

      if (input$showButton>0){
        isolate({
          if (input$sel1==1)
            res<-AMOEBA(columbus$CRIME,col.gal.nb,1,1)
          else{
            if (input$sel2==1)
              res<-AMOEBA(columbus$CRIME,col.gal.nb,2,1)
            else
              res<-AMOEBA(columbus$CRIME,col.gal.nb,3,1)
          }
          color<-rev(rainbow(length(table(res)),start=0,end=2/6))
          plot(map,col=color[as.factor(res)])
          names<-c('\nLow','\nMedium','\nHigh')
          color.legend(map@bbox[1,1],map@bbox[2,1]-0.2,map@bbox[1,2],map@bbox[2,1]-0.4,names,color,align='rb')
        })
      }
      
    })
  }
)