library(shiny)
library(testthat)
library(ggplot2)

setwd("/var/shiny-server/www/testthat-Shiny/tests/")

# Define server logic required to generate and plot a random distribution
shinyServer(function(input, output) {
    
    output$test_cases <- renderText({
        file <- file(input$package)
        lines <- readLines(file)
        
        #lines[which(lines == "")] <- "\n"
        #lines <- gsub("    ", "\n\t", lines)
        
        return(paste(lines, "\n", sep = ""))
    })
    
    output$test_results <- renderText({
        test_result <- capture.output(test_file(input$package, reporter = tolower(input$reporter)))
        
        return(paste(test_result, "\n", sep = ""))
    })
    
    output$test_errors_plot <- renderPlot({
        test_result <- capture.output(test_file(input$package, reporter = "minimal"))
        result_table <- data.frame(Result = c("Success", "Failure"), Count = as.numeric(table(factor(strsplit(test_result, split = "")[[1]], levels = c(".", "E")))))
        
        print(qplot(Result, Count, geom = "bar", group = Result, fill = Result, data = result_table, stat = "identity"))
    })
})
