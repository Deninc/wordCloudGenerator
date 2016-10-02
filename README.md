# Word Cloud Generator
An interactive `shiny` app.
Generate a word cloud from text input.

# Run locally
From R console:
```
install.packages("shiny")
install.packages("tm") # text mining
install.packages("wordcloud")
```
```
shiny::runApp(appDir = "path/to/project")
```