#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
# User interface side

library(shiny)
library(DT)

data <- read.csv(file = "data/synthetic_data.csv")


# Define UI for application that draws a histogram
fluidPage(

    # Application title
    titlePanel("Dummy Cash-based Assistance data - Person Viewer"),

    sidebarLayout(
      sidebarPanel(
        # DataTable for user to click on rows
        DTOutput("data_table"),
        width = 4
      ),
      
      mainPanel(
        # Placeholder for displaying selected person details
        uiOutput("person_details"),
        width = 8
      )
    )
)
