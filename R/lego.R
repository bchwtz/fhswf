#' Lego Set Marketprices Dataset
#'
#' @description
#' This data set contains descriptive information as well as primary and
#' secondary market prices for sets containing terminal blocks from
#' the danish company LEGO.
#'
#' @format A data frame with 2322 rows and 11 variables:
#' \describe{
#'   \item{id}{ Identification number of the set as assigned by the lego company. }
#'   \item{theme}{ Thematic category of the set. }
#'   \item{name}{ Name of the set. }
#'   \item{year}{ Year of the initial release of the set. }
#'   \item{piece_count}{ Number of LEGO pieces contained in the set.}
#'   \item{minifigure_count}{ Number of minifigures that are part of the set. }
#'   \item{price_secondary_new}{ Average price in US dollars of a new and unused set in online markets. }
#'   \item{price_secondary_used}{ Average price in US dollars of a used set in online markets. }
#'   \item{price_release}{ Price in US dollars of the set at release, als suggested by the manufacturer (MSRP). }
#'   \item{age_recommendation}{ Recommended minimum age of the set. }
#'   \item{size_group}{ Indicator showing the size group of the set, where 1 is the biggest and 4 is smallest set size category. }
#' }
#'
#' @source \url{https://data.mendeley.com/datasets/v9hhs66vm3/1}
"lego"
