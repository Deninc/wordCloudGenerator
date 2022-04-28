shinyUI(bootstrapPage(

    fluidPage(

        headerPanel("Word cloud generator"),

        sidebarPanel(
            p("Copy your text book, song lyrics... to the text area, then click Generate cloud!"),
            p("Example lyric: https://www.azlyrics.com/lyrics/johnlennon/imagine.html"),
            HTML(c("<label for='text'>Words:</label></br>
                <textarea id='text' rows='10' cols='35'>Imagine there's no heaven",
                "\nIt's easy if you try\nNo hell below us\nAbove us only sky\nImagine all the people",
                "\nLiving for today... Aha-ah...</textarea>")),
            hr(),
            p("Feel free to try different settings!"),
            sliderInput("max", "Maximum number of words appear in the cloud:", min = 5, max = 30, value = 10),
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
