#' Michelin Restaurant Dataset
#'
#' @description
#' This data set consists of information about 210 Michelin-star-awarded
#' restaurants across six European countries. Data was scraped from the
#' official website of the Guide Michelin as of September 2023.
#'
#' @format A data frame with 210 rows and 31 variables:
#' \describe{
#'   \item{lower_price}{ Price in Euro of the smallest main regular tasting menu of the restaurant. }
#'   \item{upper_price}{ Price in Euro of the most expensive main regular tasting menu of the restaurant. Identical to \textbf{lower_price} if ther restaurant offers only a single main tasting menu.}
#'   \item{michelin_stars}{ Number of awarded Michelin stars.}
#'   \item{country}{ Two digit country code indicating the residence country of the restuaurant.}
#'   \item{city}{ City in which the restaurant is located.}
#'   \item{postcode}{ Postcode of teh resturant.}
#'   \item{location_latitude}{ Latitude of the restaurant location. }
#'   \item{location_longitude}{ Longitude of the restaurant location. }
#'   \item{cooking_style}{ Classified cooking style of the restaurnt. }
#'   \item{cooking_style_classic}{ Indicator signaling if the restaurant features a classic cooking style. }
#'   \item{cooking_style_modern}{ Indicator signaling if the restaurant features a modern cooking style. }
#'   \item{cooking_style_creative}{ Indicator signaling if the restaurant features a creative cooking style. }
#'   \item{cooking_style_french}{ Indicator signaling if the restaurant features a french cooking style.}
#'   \item{vegetarian}{ Indicator: Does the restaurant offer special items for vegetarians? }
#'   \item{sustainable}{ Indicator: Does the restaurant scource mainly local and sustainable ingredients? Also known as "Green Star". }
#'   \item{wine_card}{ Indicator: Has the restaurant a high quality wine menu? }
#'   \item{nice_view}{ Indicator: Is the restuarant located in an exceptionally nice location and does it offer a especially nice view?}
#'   \item{accessible}{ Indicator: Is the resturant accessible by whellchairs? }
#'   \item{online_booking}{ Indicator: Can a reservation be made during the Guide Michelin website?}
#'   \item{chef}{ Name of the head chef of the restuarant. }
#'   \item{restaurant_name}{ Given name of the restaurant. }
#'   \item{opening_hours_monday}{ Opening hours for regular mondays.}
#'   \item{opening_hours_tuesday}{ Opening hours for regular tuesdays.}
#'   \item{opening_hours_wednesday}{ Opening hours for regular wednesday.}
#'   \item{opening_hours_thursday}{ Opening hours for regular thursday.}
#'   \item{opening_hours_friday}{ Opening hours for regular friday.}
#'   \item{opening_hours_saturday}{ Opening hours for regular saturday.}
#'   \item{opening_hours_sunday}{ Opening hours for regular sunday.}
#'   \item{days_open}{ Number of days per week that the restaurant is usually open for business. Extracted from the opening hours.}
#'   \item{restaurant_link}{ URL to the website of the restaurant.}
#'   \item{michelin_link}{ URL to the entry in the digital Guide Michelin.}
#' }
#'
#' @source \url{https://guide.michelin.com/de/de/restaurants}
"michelin"
