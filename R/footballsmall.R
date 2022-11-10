#' Small Football Dataset
#'
#' @description
#' A dataset containing information about the Fußball Bundesliga Saison 2018-19, particularly the monetary worth of a team at the end of the season and some additional information about the clubs. The data was collected using the website \url{https://www.transfermarkt.com} in October 2022.
#'
#' @format A data frame with 18 rows and 14 variables:
#' \describe{
#'   \item{club}{Participating team in the 1. Bundesliga}
#'   \item{clubabbr}{Official Club code consisting of letters and numbers}
#'   \item{points}{Sum of points at the end of the season (win=3, draw=1, loss=0)}
#'   \item{goals_scored}{Total number of scored goals of each team in the season}
#'   \item{goals_received}{Total number of conceded goals of each team in the season}
#'   \item{marketvalue}{Monetary worth of a team at the end of the season in million Euros}
#'   \item{marketvalue_goalkeeper}{Monetary worth of the goalkeeper of a team at the end of the season in million Euros}
#'   \item{marketvalue_defence}{Monetary worth of the defence players of a team combined at the end of the season in million Euros}
#'   \item{marketvalue_midfield}{Monetary worth of the midfield players of a team combined at the end of the season in million Euros}
#'   \item{marketvalue_attack}{Monetary worth of the attack players of a team combined at the end of the season in million Euros}
#'   \item{transferspending}{Total spending used to buy new players by the respective club for the next season}
#'   \item{age_average}{Average age of the players inside a squad in each team in the season}
#'   \item{viewers}{Average number of spectators at home matches in the season}
#'   \item{season}{Football season of the observation}
#' }
#' @source \url{https://www.transfermarkt.de/TODO:WODENNGENAU}
"footballsmall"
