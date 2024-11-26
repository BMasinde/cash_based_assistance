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
library(bslib)
library(toastui)
library(ggplot2)

data <- read.csv(file = "data/synthetic_data.csv")


page_fillable(
  
  # Application title
    titlePanel("Dummy Cash-based Assistance data - Person Viewer"),
  layout_columns(
    
    # Data table section
    card(card_header("Data Table"),
         DTOutput("data_table"),  # DataTable for user to click on rows
         height = 4
         ),
    # Image of person
    card(card_header("Photo"),
         uiOutput("image"),
         height = 4
         ),
      
    # show other details
      card(card_header("Details"),
           uiOutput("person_details"),
           height = 4
           ),
      col_widths = c(4,3, 5)
  ),
  
  # lower row
  layout_columns(
    
    # graph
    card(card_header("Disbursed amount"),
         plotOutput("disbursed_plot"),
         height = 4
         ),
    
    # the calendar
    card(card_header("Needs re-assesment Calendar"),
         calendarOutput("date_calendar"), # Placeholder for calendar
         height = 4
         ), 
    col_widths = c(8,4)
  )
)