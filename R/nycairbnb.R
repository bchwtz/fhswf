#' New York City Airbnb Offerings
#'
#' A dataset containing information including prices and other attributes of
#' almost 49000 Airbnb accomodation offerings.
#'
#' @format A data frame with 48895 rows and 16 variables:
#' \describe{
#'   \item{id}{a unique identifier for each offering}
#'   \item{name}{name of the listing, displayed headline on the airbnb website}
#'   \item{host_id}{a unique identifier for each host}
#'   \item{host_name}{name of the host}
#'   \item{neighbourhood_group}{name of the borough where the accomodation offering is located}
#'   \item{neighhourhood}{name of the neighbourhood where the accomodation offering is located}
#'   \item{latitude}{latitude coordinate (north–south position on the Earth's surface) of the offering}
#'   \item{longitude}{longitude coordinate (east–west position on the Earth's surface) of the offering}
#'   \item{room_type}{room type of the offering, either entire home/appartment, private room or shared room}
#'   \item{price}{the price per night in US dollars}
#'   \item{minimum_nights}{number of nights to stay that a guest has to book}
#'   \item{number_of_reviews}{number of reviews for that specific offering}
#'   \item{last_review}{date of the last published review}
#'   \item{reviews_per_month}{average number of reviews per month for an offering}
#'   \item{host_listings_count}{amount of active listings of the corresponding host}
#'   \item{availability_365}{number of days in a year that the listing is available for booking}
#' }
#' @source \url{https://www.kaggle.com/datasets/dgomonov/new-york-city-airbnb-open-data}
#' @source \url{http://insideairbnb.com/}
"nycairbnb"
