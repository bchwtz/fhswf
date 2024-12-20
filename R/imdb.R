#' IMDb (Internet Movie Database) data
#'
#' @description
#' A dataset containing 100 movie reviews.
#'
#' The data is from the Internet Movie Database (IMDb) accessed via the R package
#' keras. The IMDB dataset contains of much more movie reviews.
#'
#' @format A list containing the sublists imdbData and wortIndex.
#' \describe{
#' imdbData consists of x (a list containing 100 elements) and y
#'  (a vector containing 100 elements).
#'   \item{x}{consists of 100 movies reviews (each element represents one movie review); each movie review consists of index values indicating words (see wortIndex.)}
#'   \item{y}{is a vector of length 100 containing binary values; 0 means a negative review and 1 a positive review}
#'  wortIndex consists of 88,584 elements (word-index value): Each element is an integer vector of length 1. Each element has a word as name and an index indicating how often the word has been used.
#'  For example, the most frequent word is "the" which has 1 as index, the second most frequent word is "and" which has the index 2 and so on.
#' }
#' @source R package keras.
#' @seealso `?keras::dataset_imdb_word_index()` and `?keras::dataset_imdb()`
"imdb"
