source("../preprocess.R")

test_that("preprocess removes unnecessary words", {
    text <- "The quick brown fox jumps over the lazy dog."
    # "quick" "brown" "fox"   "jump"  "lazi"  "dog"
    expect_lte(quanteda::ntoken(preprocess(text)), 6)
})
