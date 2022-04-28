preprocess <- function(text) {
    # read input and pre preprocessing
    text <- quanteda::tokens(text, remove_punct = TRUE, remove_numbers = TRUE)
    text <- quanteda::tokens_select(text, quanteda::stopwords("english"), selection = "remove")
    # text <- tokens_wordstem(text)
    text <- quanteda::tokens_tolower(text)
    return(text)
}
