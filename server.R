library(quanteda.textplots)
source("preprocess.R")

shinyServer(function(input, output) {
    output$cloud <- renderPlot({
        input$submit
        # read input and pre preprocessing
        text <- preprocess(input$text)

        if (input$color == "colorful") {
            textplot_wordcloud(quanteda::dfm(text), min_count = 2, max_words = input$max,
            color = rev(RColorBrewer::brewer.pal(8, "Dark2")))
        } else {
            textplot_wordcloud(dfm(text), min_count = 2, max_words = input$max, color = "black")
        }
    })
})
