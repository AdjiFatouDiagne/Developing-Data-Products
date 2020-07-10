library(readr)
women <- read_csv("https://www.dropbox.com/s/f8p09seuqh8dy33/women.csv?raw=1")

# Define UI for women-owned businesses app ----
ui <- fluidPage(
    
    # App title ----
    titlePanel("Women-Owned Businesses, 2018 Census Annual Business Survey"),
    
    # Sidebar layout with input and output definitions ----
    sidebarLayout(
        
        # Sidebar panel for inputs ----
        sidebarPanel(
            
            # Input: Selector for variable to plot against Industry ----
            selectInput("yaxis", "Select Variable", c("Number of Businesses" = "bus",
                                                      "Number of Employees" = "empl",
                                                      "Receipts (Millions of $$)" = "rcpts")),
            
            
        ),
        
        # Main panel for displaying outputs ----
        mainPanel(
            
            tabsetPanel(type="tab",
                        tabPanel("Summary", verbatimTextOutput("sumry")),
                        tabPanel("Women-Owned Business Data", tableOutput("mytable")),
                        tabPanel("Plot", plotOutput("WomenOwnedPlot"))
            )   
            
            
            
            
        )
    )
)