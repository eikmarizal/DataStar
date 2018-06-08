#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Project 1"),
  
  # Sidebar with a slider input for number of bins 
  
       sliderInput("num",
                   "Please enter number:",
                   min = 1,
                   max = 2000,
                   value = 100),
   
    
    # Sidebar for dropdown menu
    selectInput('color',
                 'Please select your favorite color:',
                 choices = c('Red','Blue','Green')),
    # Add text
    h4('Run baby run'),
    p('Runn away!!!!!!!!!!!!!!!!'),
  
    # Add image
    img(src = 'r.png'),
  
  
  mainPanel(
  plotOutput('hist')
  
    )
  )
)

    
