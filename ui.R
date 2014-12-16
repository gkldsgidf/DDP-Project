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
    p("The Mediterranean diet:"),
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
      tabPanel('Further step',
               p("Up until now, you know your present BMI, and your caloric needs according 
        to your gender, age and activity level. The next question is “am I gaining 
        or losing weight with my current diet?” Generally speaking, there is one way to 
        know it: Just compare your caloric needs to the calories you ingest in your diet. 
        So simple and so complex. The problem here is that almost each and every person 
        in the Earth have a different food intake. In other words, the caloric variability 
        from food is extremely high. Think about how your diet differs from your neighbors' 
        or your colleagues'."), 
        p("Fortunately, it is easy to find information at least for 
        many western dishes in webpages like ", a('this', href='http://www.nal.usda.gov/fnic/foodcomp/search/'), " or", a('this', href='http://www.bedca.net/bdpub/index.php')," (the last one in Spanish)."), 
        h6("- Firstly, write down all the dishes you consume in a period of time (i.e. in a week)"),
        h6("- Secondly, look for the dishes in the above or other pages. You only need the calories data"),
        h6("- Then, sum them up and divide it by the number of days to obtain your real caloric intake per day"),
        h6("- Finally, compare it with your caloric intake requirements"),

        p("This way you will find if your are gaining or losing weight."), 
        p("Please take into account that it does not matter if you eat extra food one day if you burn the extra calories the next days."),
        plotOutput("Further step")
      ),
      tabPanel('Documentation',
        p("Hi user."),
        p("If you are using the Body Mass Index calculator you are concerned of your health, a course evaluator, or both. Whoever you are, I thank you for your time."),
        p("Next, you will see two parts in the first screen. On the left, there are the slider and numeric inputs in which you will introduce your information so that the program 
        can make measures. After you are done this, please click on the Go! button in order it offers conclusions. Bellow the data area, there is a picture with the classical 
        Mediterranean diet as an example of one healthy and equilibrated diet. On the right part, you can see your body mass index (BMI) in a scale from underweight to obese. 
        Colors are indicating whether you are in a risky group (underweight or obese), moderated risky group (overweight) or healthy weight. This is important because people 
        in risky groups can develop illnesses such as cardiovascular disease. In addition, there is extra information on what the BMI is."), 
        p("In the second slide, there are two types of outputs: Basal metabolism and Total calories taking into account the activity level. The first one measures the 
        energy requirements to carry out all the body activities while resting like breathing, food digesting, heart beating and so on. Harris and Benedict equations are used 
        for this purpose. The second output consists in a measure of the calories required when the physical activity is taken into account. Moreover, a short explanation 
        about the meaning of the activity levels is displayed."),
        p(" In the third slide, there are steps in case you want to know more about your diet adn your present health state.")
      )
    )
    )
))
