shinyUI(bootstrapPage(

    fluidPage(

        headerPanel("Word cloud generator"),

        sidebarPanel(
            p("Copy your text book, song lyrics... to the text area, then click Generate cloud!"),
            p("Example lyric: https://www.azlyrics.com/lyrics/johnlennon/imagine.html"),
            HTML('<label for="text">Words:</label></br>
                 <textarea id="text" rows="5" cols="35">Insert text...</textarea>'),
            hr(),
            p("Feel free to try different settings!"),
            sliderInput("max", "Maximum number of words appear in the cloud:", min = 5, max = 50, value = 20),
            radioButtons("color", "Choose color palette:",
                         c("Colorful" = "colorful", "Black" = "black"),
                         inline = TRUE),
            actionButton("submit", "Generate Cloud!")
        ),

        mainPanel(
            plotOutput("cloud")
        )

    )

))
