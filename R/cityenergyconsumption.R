#' City Energy Consumption Data
#'
#' @description
#' This dataset is related to power consumption of the distribution network Quads of Tetouan city which is located in north Morocco.
#'
#' @format A data frame with 52416 rows and 7 variables:
#' \describe{
#'   \item{ date }{ Timestamp for historical data which was collected every 10 minutes for the period between 2017-01-01:00:00:00 and 2017-12-31:23:50:00. }
#'   \item{ temperature }{ Air Temperature in Tetouan city in °C. }
#'   \item{ humidity }{ Air Humidity Level in Tetouan city in g/m^3. }
#'   \item{ windspeed }{ Wind speed in Tetouan city in m/s. }
#'   \item{ generaldiffuseflows }{ Probably: Solar irradiance in W/m2 }
#'   \item{ diffuseflows }{}
#'   \item{ consumption }{ Zone 1 Power consumption in UNIT }
#' }
#'
#' @references Salam, A., & El Hibaoui, A. (2018). Comparison of Machine Learning Algorithms for the Power Consumption Prediction:-Case Study of Tetouan city“. In 2018 6th International Renewable and Sustainable Energy Conference (IRSEC) (pp. 1-5). IEEE.
#' @source \url{https://archive.ics.uci.edu/dataset/849/power+consumption+of+tetouan+city}
"cityenergyconsumption"

