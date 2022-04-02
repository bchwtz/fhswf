#' Modal Value
#'
#' @description
#' The mode, or modal value, is the most frequent value in a set of values.
#'
#' @param x vector of numbers , characters, logicals or factors
#' @param na.rm logical. If TRUE, NA values are ignored. If FALSE, NA is returned if x has any NA values
#' @export
modal <- function(x, na.rm= FALSE) {
  if (na.rm){x <- na.omit(x)}
  ux <- unique(x)
  tab <- tabulate(match(x, ux))
  return(ux[tab == max(tab)])
}
