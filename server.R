library(wordcloud)
source("preprocess.R")

shinyServer(function(input, output) {
    output$cloud <- renderPlot({
        input$submit
        # read input and pre preprocessing
        text <- preprocess(input$text)

        if (input$color == "colorful") {
            wordcloud(text, max.words = input$max, scale = c(4, .5),
                      colors = brewer.pal(8, "Dark2"), random.order = FALSE, rot.per = .2)
        } else {
            wordcloud(text, max.words = input$max, scale = c(4, .5),
                      random.order = FALSE, rot.per = .2)
        }
    })
})
