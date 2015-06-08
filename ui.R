#### ui.R for High Altitude Baking

# Recommendations for adjustments come from 
# http://www.kingarthurflour.com/recipe/high-altitude-baking.html

# load shiny library

library(shiny)

# Set up header and input fields in sidebar

shinyUI(fluidPage(
    
    titlePanel("Adjustments to Time and Temperature for High Altitude Baking"),
    br(), 
    
    sidebarLayout(
        sidebarPanel(
            h4('If you bake at an elevation of 3000 feet or more, 
               answer the questions below using the information in your recipe.'),
            
            h4('The adjusted time and temperature you should use will be on the right.'),
            br(),
            
            radioButtons("chocolate", "Is this a chocolate or delicate batter?",
                         c("Yes" = "1",
                           "No" = "2"), "2"),
            
            numericInput('minutes', 'Enter bake time (in minutes):', "60"),
            
            numericInput('temp', 'Enter bake temperature (in Fahrenheit degrees):', "325"),
            
            helpText('IMPORTANT: This app is in beta.  Use at your own risk.')
        ),
                
        
        # set up text in Main Panel (output)
        
        mainPanel(
            h3('Make the following changes:'),
            br(),
            
            #verbatimTextOutput("tempfunc") ,
            #verbatimTextOutput("timefunc") ,
            
            h4(textOutput("tempfunc")),
            h4(textOutput("timefunc")),
            br(),            

            p('I hope you found this high altitude baking calculator helpful.  These recommendations are based on those found at the King Arthur Flour website.'),
            
            # create a reference line to source material
            
            tags$div(class="header", checked=NA,
                     tags$p("For more information:"),
                     tags$a(href="http://www.kingarthurflour.com/recipe/high-altitude-baking.html", "King Arthur Flour")
            )
        )
        
    )
)
)