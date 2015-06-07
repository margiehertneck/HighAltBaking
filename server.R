#### server.R for High Altitude Baking

# Recommendations for adjustments come from the following:
# http://www.kingarthurflour.com/recipe/high-altitude-baking.html

# load shiny library
library(shiny)

# define server
  
shinyServer(
    function(input,output) {
        
        #define output
        
        output$oalt <- renderPrint({input$alt})
        output$ochocolate <- renderPrint({input$chocolate})        
        output$ominutes <- renderPrint({input$minutes})        
        output$otemp <- renderPrint({input$temp})        

        
        # Temperature - if chocolate/delicate is "Yes", then temp+15, else temp+25
        tempfunc <- function(chocolate) {
            tempy <- ifelse(chocolate=="1",(input$temp+15), (input$temp+25))
            print(paste("Change your temperature from",input$temp,"to", tempy,"degrees Fahrenheit."))
        } #endtempfunc       
        
        # for every 30 min of baking time, subtract by 5 to 8 minutes (range).
        timefunc <- function(minutes) {
            timex <- round(input$minutes-((input$minutes/30)*8),0)   
            timey <- round(input$minutes-((input$minutes/30)*5),0)
            print(paste("Instead of baking for",input$minutes,"minutes, bake from",timex, "to",timey,"minutes."))
        } #endtimefunc
    
        #define function output
        
#         output$tempfunc <- renderPrint({tempfunc(input$chocolate)})
#         output$timefunc <- renderPrint({timefunc(input$time)})
        
        output$tempfunc <- renderText({tempfunc(input$chocolate)})
        output$timefunc <- renderText({timefunc(input$time)})
    }
)