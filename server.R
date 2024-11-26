#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#
# Server side
library(shiny)
library(DT)
library(toastui)
library(ggplot2)

data <- read.csv(file = "data/synthetic_data.csv")
# Define server logic required to draw a histogram
function(input, output, session) {

  # Render the data table
  output$data_table <- renderDT({
    datatable(
      data[, 2:3],
      selection = "single",   # Allows selecting a single row at a time
      options = list(pageLength = 5)  # Limit number of rows displayed at a time
    )
  })
  
  # Reactive expression to get the selected row's data
  selected_person <- reactive({
    selected_row <- input$data_table_rows_selected
    if (length(selected_row) == 0) return(NULL)
    data[selected_row, ]
  })
  
  # Display the selected person's image and details
  output$image <- renderUI({
    person <- selected_person()
    
    if (is.null(person)) {
      return(h3("Select a row to see details"))
    }
    
    # Construct the file path for the image (assuming images are in www/images/)
    img_path <- paste0(person$image_names)
    
    # Display the image only
    tagList(
      h3(person$first_name),
      img(src = img_path, height = "200px"), # Display image
      #h4("Details"),
      #p(strong("Age: "), person$age),
      #p(strong("Phone: "), person$phone_numbers),
      #p(strong("Illness: "), person$illness),
      #p(strong("Children: "), person$children)
    )
  })
  
  # Calendar highlighting logic
  output$date_calendar <- renderCalendar({
    person <- selected_person()
    
    if (is.null(person)) {
      return(NULL)  # Return nothing if no person is selected
    }
    
    # Convert the date column to Date object
    dates <- as.Date(person$date)
    
    # Filter for December dates
    december_dates <- dates[format(dates, "%m") == "12"]
    
    # Check if there are valid December dates
    if (length(december_dates) == 0) {
      return(NULL)  # No dates in December
    }
    
    # Create a list of events for the calendar
    events <- lapply(december_dates, function(d) {
      list(
        start = as.character(d),
        end = as.character(d),
        title = "Event"
      )
    })
    
    # Render the calendar with highlighted dates
    calendar(
      events = events
    )
  })
  
  # Render the line graph showing data from columns 12 to 22 using ggplot2
  output$disbursed_plot <- renderPlot({
    person <- selected_person()
    
    if (is.null(person)) {
      return(NULL)  # Return nothing if no person is selected
    }
    
    # Extract the data from columns 12 to 22
    disbursed_data <- person[, 12:22]
    
    
    # Convert the data to a data frame suitable for plotting
    disbursed_data <- as.data.frame(t(disbursed_data)) # Transpose to long format
    
    month <- c('Jan', 'Feb', 'March', 'April', 'May', 'June', 'July', 'August', 
    'Sept', 'Oct', 'Nov')
  
  disbursed_data$month <- rownames(disbursed_data)
  
  # change column name:
  colnames(disbursed_data)[1] <- "amount"
  
  # Create the plot using ggplot2
  ggplot(disbursed_data, aes(x = month, y = amount, group = 1)) + 
    geom_line(color = 'blue') + 
    geom_point(color = 'red') + 
    labs(title = "Disbursed Amount Over Time",
         x = "Month",
         y = "Amount") + 
    theme_minimal()  # Minimal theme for cleaner look
  
  })
  
  output$person_details <- renderUI({
    person <- selected_person()
    
    if (is.null(person)) {
      return(h3("Select a row to see details"))
    }
    
    # Displaying the person's details in sections
    tagList(
      h3(person$first_name),  # Display the person's name
      
      # Section 1: Age
      div(
        h4("Age"),
        p(person$age)
      ),
      
      # Section 2: Illness
      div(
        h4("Illness"),
        p(person$illness)
      ),
      
      # Section 3: Children
      div(
        h4("Children"),
        p(person$children)
      ),
      
      # Section 4: Phone Number
      div(
        h4("Phone"),
        p(person$phone_numbers)
      ),
      
      # Section 5: Address (if available)
        div(
          h4("House type"),
          p(person$house_type)
        ),
      # Section 6: Address (if available)
      div(
        h4("Flooding secondary effects"),
        p(person$secondary_effects)
      ),
    )
  })
  

}
