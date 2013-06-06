library(shiny)

files <- dir("/var/shiny-server/www/testthat-Shiny/tests")

# Define UI for application that plots random distributions 
shinyUI(pageWithSidebar(
    
    # Application title
    headerPanel("testthat-Shiny Prototype"),
    
    sidebarPanel(
        selectInput("package", "Select a File:", files),
        radioButtons("reporter", "Choose a Reporter:", choices = c("Summary", "Stop", "Tap", "Minimal"))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
        tabsetPanel(
            tabPanel("Summary", h3("Test Cases"), verbatimTextOutput("test_cases"), br(), h3("Test Results"), verbatimTextOutput("test_results")),
            tabPanel("Plots", plotOutput("test_errors_plot"))
        )
    )
))