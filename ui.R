library(shiny)

shinyUI( 
  pageWithSidebar(
  headerPanel('Body Mass Index calculator'),
  sidebarPanel(
    sliderInput('height','Your height in cm:', min = 100, max = 220, value = 175),
    sliderInput('weight','Your weight in kg:', min = 40, max = 150, value = 75),
    numericInput('age','Age in years', 40, 
                 min=18, max=100, step=1),
    radioButtons('gender', "Gender", c("Male" = "1","Female" = "2")),
    selectInput('activity', "Activity level", choices = c("Sedentary" = "1", "Low active" = "1.12", "Active" = "1.27", "Very active" = "1.45"), selected = 1),
    submitButton("Go!"),
    br(),
    p("The mediterranean diet:"),
    img (src="mediterranean.png")
  ),
  
  mainPanel(
    tabsetPanel(
      tabPanel('Your BMI results',
        p("The", a('body mass index (BMI)', href='http://www.cdc.gov/healthyweight/assessing/bmi/adult_bmi/index.html'),
        "is a number calculated from a person`s weight and height. BMI is a fairly reliable indicator of body fatness for most people."),
        p("Introduce your weight in kilograms and height in centimeters by moving the sliders in order to calculate your BMI."),
        p("You can play with the sliders to determine what weight you should have to be in your healthy weight."),
        plotOutput("bmiPlot")
      ),
      tabPanel('Additional results',
        h3('Outputs'),
        h4('Basal metabolism (calories per day)'),
        p("Basal metabolism is the rate of energy expenditure by humans at rest. Rest is defined as existing in a neutrally temperate 
          environment while in the post-absorptive state. In other words, the energy you need to breath, propel blood through your body and so on.
          It is calculated based on the Harris and Benedict equations"),
        verbatimTextOutput("BasalMet"),
        h4('Total calories taking into account the activity level (calories per day)'),
        p("Diferences in exercise provoke diferences in energy consumption. Food and Nutrition Board of the Institute of Medicine of the National Academies recommended equations has been used."),
        p("- Sedentary: Typical daily living activities (e.g., household tasks, walking to the bus)."),
        p("- Low active: Typical daily living activities PLUS 30 - 60 minutes of daily moderate activity (ex. walking at 5-7 km/h)"),
        p("- Active: Typical daily living activities PLUS At least 60 minutes of daily moderate activity"),
        p("- Very active: Typical daily living activities PLUS At least 60 minutes of daily moderate activity PLUS An additional 60 minutes of vigorous activity or 120 minutes of moderate activity"),
        verbatimTextOutput("Exercise")
      ),
      tabPanel('Documentation',
        p("Hi user."),
        p("If you are using the Body Mass Index calculator you are concerned of your health, a course evaluator, or both. Whoever you are, I thank you for your time."),
        p("Next, you will see two parts in the first screen. On the left, there are the slider and numeric inputs in which you will introduce your information so that the program 
        can make measures. After you are done this, please click on the Go! button in order it offers conclusions. Bellow the data area, there is a picture with the classical 
        Mediterranean diet as an example of one healthy and equilibrated diet. On the right part, you can see your body mass index (BMI) in a scale from underweight to obese. 
        Colors are indicating whether you are in a risky group (underweight or obese), moderated risky group (overweight) or healthy weight. This is important because people 
        in risky groups can develop illnesses such as cardiovascular disease. In addition, there is extra information on what the BMI is."), 
        p("Finally in the second slide, there are two types of outputs: Basal metabolism and Total calories taking into account the activity level. The first one measures the 
        energy requirements to carry out all the body activities while resting like breathing, food digesting, heart beating and so on. Harris and Benedict equations are used 
        for this purpose. The second output consists in a measure of the calories required when the physical activity is taken into account. Moreover, a short explanation 
        about the meaning of the activity levels is displayed.")
      )
    )
    )
))
