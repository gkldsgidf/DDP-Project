library(shiny)
#library(rCharts)
#library(ggplot2)

bmi <- function(weight, height) {
  plot(c(12.5, 36), c(0, 1), type='n', asp=5, xlab='BMI', ylab='', yaxt='n', main='Body Mass Index areas')
  rect(12.5, 0, 18.5, 1, col='light green')
  text(15.5, 0.5, 'Underweight', adj=0.5)
  rect(18.5, 0, 25, 1, col='green')
  text(21.75, .5, 'Healthy weight', adj=0.5)
  rect(25, 0, 30, 1, col='yellow')
  text(27.5, .5, 'Overweight', adj=0.5)
  rect(30, 0, 36, 1, col='red')
  text(33, .5, 'Obese', adj=0.5)
  index = weight / ((height / 100) ^ 2)
  xcoord = index
  if (index < 12.5) xcoord = 12.5
  if (index > 36) xcoord = 36
  adj = 0
  if (xcoord > 20) adj = 1
  abline(v=xcoord, lwd=2, col='dark blue')
  text(xcoord + .3 - .6 * adj, 1.1, paste('BMI: ', round(index, 1)), adj=adj)
}
#Basal metabolism: Harris and Benedict equations
Basal <- function(weight, height, age, gender){
  if (gender == 1) {
  BasalMet <- 66.4730 + 13.751 * weight + 5.0033 * height - 6.75 * age } else {
  BasalMet <- 655.1 + 9.463 * weight + 1.8 * height - 4.6756 * age}
  BasalMet}
#Exercise  (http://www.mynetdiary.com/faq.html#faqCaloriesEstimate)
exer <- function(weight, height, gender, age, activity){
  act <- as.numeric(activity)
  if (gender == 1) {
    exerCal <- 662 - 9.53 * age + act * (15.91 * weight + 539.6 * (height / 100))
  } else {
    exerCal <- 354 - 6.91 * age + act * (9.36 * weight + 726 * (height / 100))}
  exerCal}


shinyServer(function(input, output) {
  output$bmiPlot <- renderPlot({
    bmi(input$weight, input$height)
  })
  
  output$BasalMet <- renderText({
    Basal(input$weight, input$height, input$age, input$gender)
  })
  
  output$Exercise <- renderText({
    exer(input$weight, input$height, input$gender, input$age, input$activity)
  })
 
}
)