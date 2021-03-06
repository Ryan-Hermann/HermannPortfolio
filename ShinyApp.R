library(readr)
library(ggplot2)
library(shiny)
mydata<- USJudgeRatings

ui<- fluidPage(
  #Application Title
  titlePanel("Lawyer View On Judges"),
  
  #Sidebar Layout
  sidebarLayout(
    sidebarPanel(
      
      #X-input
      selectInput(inputId = 'x',
                     label = "X-Axis:",
                     choices = c("# of Contacts of Lawyer with Judge" = "CONT",
                                 "Integrity" = "INTG",
                                 "Demeanor" = "DMNR",
                                 "Dilligence" = "DILG",
                                 "Case Flow Managing" = "CFMG",
                                 "Promp Decisions" = "PREP",
                                 "Familiarity With Law"="FAMI",
                                 "Sound Oral Rulings" = "ORAL",
                                 "Sound Written Rulings" = "WRIT",
                                 "Physical Ability" = "PHYS"),
                     selected = "DILG"),
      #Y-Input
      selectInput(inputId = "y",
                  label = "Y-Axis:",
                  choices = c("# of Contacts of Lawyer with Judge" = "CONT",
                              "Integrity" = "INTG",
                              "Demeanor" = "DMNR",
                              "Dilligence" = "DILG",
                              "Case Flow Managing" = "CFMG",
                              "Promp Decisions" = "PREP",
                              "Familiarity With Law"="FAMI",
                              "Sound Oral Rulings" = "ORAL",
                              "Sound Written Rulings" = "WRIT",
                              "Physical Ability" = "PHYS"),
                  selected = "INTG"),
      
      #Color By
      selectInput(inputId = "color",
                  label = "Color by:",
                  choices = c("# of Contacts of Lawyer with Judge" = "CONT",
                              "Integrity" = "INTG",
                              "Demeanor" = "DMNR",
                              "Dilligence" = "DILG",
                              "Case Flow Managing" = "CFMG",
                              "Promp Decisions" = "PREP",
                              "Familiarity With Law"="FAMI",
                              "Sound Oral Rulings" = "ORAL",
                              "Sound Written Rulings" = "WRIT",
                              "Physical Ability" = "PHYS"),
                  selected = "DMNR"),
      
      #Set Size
      sliderInput(inputId = "size",
                  label = "Size",
                  min = 1, max = 10,
                  value = 5),
      
      
      #Set Transparency
      sliderInput(inputId = "alpha",
                  label = "Transparency",
                  min =0.1, max =1,
                  value = 1),
      
      
      
      
      ),
    
    #output : Show Scatter plot
    mainPanel(
      plotOutput(outputId = "scatterplot")
    )
      
      
    )
  )
  
  
  



#Build the Server
server<- function(input, output){
  
  output$scatterplot<- renderPlot({
    ggplot(data = mydata, aes_string(x = input$x, y=input$y))+
      geom_point(aes_string(color = input$color),
                 alpha = input$alpha, size = input$size)+
      geom_smooth() + scale_color_gradient(low = "red", high = "blue")
  })
}

shinyApp(ui,server)

ggplot(mydata, aes(x = DILG, y = INTG, ))+ 
  geom_point(aes(size = FAMI, color= DMNR )) + geom_smooth()
