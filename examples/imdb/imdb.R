library(httr)
library(jsonlite)
library(purrr)

# from Jürgen Willms, siehe Fallstudie 2

imdbData <- readRDS("data/imdbData.rds")
wortIndex <- readRDS("data/wortIndex.rds")

# Combine data into one list
imdb <- list(imdbData = imdbData,
             wortIndex = wortIndex)

# Saving
f <- paste0("data/imdb.rda")
save(imdb, file = f, compress="xz")
tools::checkRdaFiles(f)
