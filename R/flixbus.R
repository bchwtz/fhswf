#' Flixbus Dataset
#'
#' @description
#' This data set contains pricing information of the long-distance bus
#' service Flixbus in Europe.
#'
#'
#' @format A data frame with 7862 rows and 25 variables:
#' \describe{
#'   \item{qdate}{ Date when the data was collected. }
#'   \item{ddate}{ Date of departure. }
#'   \item{route}{ Origin and Destination of the connection as advertised by Flixbus.}
#'   \item{dep}{ Time of departure, date part of the data can be ignored.}
#'   \item{arr}{ Time of arrival, date part can be ignored.}
#'   \item{fare}{ One-way price in Euro for a single seat on the given route. }
#'   \item{dur}{ Travel duration, date part can be ignored. }
#'   \item{bookingday}{ Number of days prior to departue. }
#'   \item{seats_remaining}{ Remaining seats of teh connection. }
#'   \item{fare1}{ Fare in Euro of the first seat on sale for the given connection. }
#'   \item{dow_departure}{ Day of the week of departure, where 0=Sunday, 1=Monday, ... }
#'   \item{weekend_departure}{ Indicator singaling wheter the departure is on the weekend. }
#'   \item{dow_booking}{ Day of the week of booking, where 0=Sunday, 1=Monday, ...  }
#'   \item{weekend_book}{ Indicator singaling wheter the booking happens on the weekend. }
#'   \item{o}{ Origin of the connection.}
#'   \item{d}{ Destination of the connection.}
#'   \item{pop_o}{ Population of the origin city, in 100.000. }
#'   \item{gdp_o}{ Per capita Gross Domestic Product (GDP) of the origin city, in 1000 Euro.}
#'   \item{pop_d}{ Population of the destination city, in 100.000.}
#'   \item{gdp_d}{ Per capita Gross Domestic Product (GDP) of the destination city, in 1000 Euro.}
#'   \item{travel_sub}{ Means of transport for a substitution for this connection. }
#'   \item{dist}{ Distance travelled of the conenction, in km.}
#'   \item{pop}{ Geometric mean of the pupulation of the origin and destination cities.}
#'   \item{gdp}{ Geometric mean of the GDP of the origina and destination cities}
#'   \item{flixbus_only}{ Is Flixbus the only transport provider for a direct connection between origin and destiantion? }
#' }
#'
#' @source \url{https://data.mendeley.com/datasets/j89kvrsdkn/1}
"flixbus"
