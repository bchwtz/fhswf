#' Motor Yacht Price Dataset
#'
#' @description
#' This dataset was scraped from boat24.com. The observations represent actual
#' listings of boats for sale in July of 2020. Compared to the original dataset
#' version listed in the references the variables have been reduced, cleaned
#' up and prices have been converted to Euros.
#'
#' @format A data frame with 3528 rows and 9 variables:
#' \describe{
#'   \item{ price }{Price of the listed boat in Euro. Has been converted to Euro from the original currency listed using the average foreign exchange rate for the period of the dataset.}
#'   \item{ length }{Lenght of the boat in meters.}
#'   \item{ width }{Width of the boat in meters.}
#'   \item{ boat_type }{Specific Type of boat as an ordered factor with 12 Levels. }
#'   \item{ engine_hours }{Operating hours of the engine.}
#'   \item{ model }{Specific Model description, when in doubt the Type can be researched using this information.}
#'   \item{ condition }{Condition of the boat at the time of sale rnaging from 1 (new) to 6 (used):}
#'   \itemize{
#'      \item{1: new}
#'      \item{2: as good as new}
#'      \item{3: very good}
#'      \item{4: well-groomed}
#'      \item{5: good}
#'      \item{6: used}
#'   }
#'   \item{ manufacturer }{Manufactuer of the boat.}
#'   \item{ year_built }{Year in which the boat was built.}
#' }
#'
#' @source \url{https://www.kaggle.com/datasets/artemkorottchenko/large-boatyacht-pricing-dataset}
"boatprices"

