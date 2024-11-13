#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(DT)

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
  output$person_details <- renderUI({
    person <- selected_person()
    
    if (is.null(person)) {
      return(h3("Select a row to see details"))
    }
    
    # Construct the file path for the image (assuming images are in www/images/)
    img_path <- paste0(person$image_names)
    
    # Display the image and other details
    tagList(
      h3(person$first_name),
      img(src = img_path, height = "200px"), # Display image
      h4("Details"),
      p(strong("Age: "), person$age),
      p(strong("Phone: "), person$phone_numbers),
      p(strong("Illness: "), person$illness),
      p(strong("Children: "), person$children)
    )
  })

}
