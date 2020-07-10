library(readr)
women <- read_csv("https://www.dropbox.com/s/f8p09seuqh8dy33/women.csv?raw=1")

# Define server logic to plot various variables against Industry ----
server <- function(input, output){
    
    #Data tab
    output$mytable <- renderTable({
        women
    })
    
    #Summary tab
    rendersumry <- reactive({ summary(women)})
    output$sumry <- renderPrint({
        rendersumry()
    })
    
    #Plot
    
    output$WomenOwnedPlot <- renderPlot({
        bar2 <-(women[, input$yaxis])
        namesb= c("HCSC", "PSTS", "RT", "AFS", "OS", "RERL", "ASWMRS", "CN", "WT", "FI")
        color= c('#1f77b4',  '#ff7f0e',  '#2ca02c',  '#d62728',  '#9467bd',  '#8c564b',  '#e377c2',  '#7f7f7f',  '#bcbd22',  '#17becf')
        barplot(t(as.matrix(bar2)), beside=T, las=2, cex.names=.8, names.arg=namesb, col=color, space = c(0, .2))       
        
        
    })
}