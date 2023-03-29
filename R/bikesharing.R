#' Bike Sharing Dataset
#'
#' @description
#' This data set contains the daily count of utilized rental bikes between years 2011 and 2012 in the Capital bikeshare system (Washington D.C., USA) with the corresponding weather and seasonal information.
#'
#' @format A data frame with 731 rows and 13 variables:
#' \describe{
#'   \item{cnt}{count of total rental bikes}
#'   \item{dteday}{date}
#'   \item{season}{season (1: winter, 2: spring, 3: summer, 4: fall)}
#'   \item{yr}{year (0: 2011, 1: 2012)}
#'   \item{mnth}{month (1 to 12)}
#'   \item{holiday}{whether day is a holiday on a workingday or not (1: holiday on a workingday, 0: holiday on weekend or no holiday)}
#'   \item{weekday}{day of the week (0: sunday, 1: monday, 2: tuesday, 3: wednesday, 4: thursday, 5: friday, 6: saturday)}
#'   \item{workingday}{if day is neither weekend nor holiday is 1, otherwise 0}
#'   \item{weathersit}{weather conditions in Washington D.C., USA}
#'   \itemize{
#'      \item{1: clear, few clouds, partly cloudy}
#'      \item{2: mist, mist + cloudy, mist + few clouds , mist + broken clouds}
#'      \item{3: light snow, light rain + scattered clouds, light rain + thunderstorm + scattered clouds}
#'      \item{4: heavy rain + ice pallets + thunderstorm + mist, snow + fog}
#'   }
#'   \item{temp}{temperature in Celsius}
#'   \item{atemp}{"feels like" temperature in Celsius}
#'   \item{hum}{relative humidity in percent}
#'   \item{windspeed}{wind speed in mph}
#' }
#'
#' @source \url{https://archive.ics.uci.edu/ml/datasets/Bike+Sharing+Dataset}
#' @source \url{http://capitalbikeshare.com/system-data}
#' @source \url{http://www.freemeteo.com}
#' @source \url{https://dchr.dc.gov/page/holiday-schedules}
#'
#' @references Fanaee-T, Hadi, and Gama, Joao, "Event labeling combining ensemble detectors and background knowledge", Progress in Artificial Intelligence (2013): pp. 1-15, Springer Berlin Heidelberg, doi:10.1007/s13748-013-0040-3.
"bikesharing"
