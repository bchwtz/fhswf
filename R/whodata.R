#' WHO Data
#'
#' @description
#' A dataset containing information about the development of (almost) all
#' countries on earth from 1990 to 2019 (excluding some years).
#'
#' The data was collected using the Human Development Report Office Statistical
#' Data API (HDRO).
#'
#' @format A data frame with 48895 rows and 16 variables:
#' \describe{
#'   \item{country_code}{3 letter country code aka Alpha-3 code (ISO 3166)}
#'   \item{year}{year of observation}
#'   \item{hdi}{ Human Development Index (HDI), (WHO-ID:137506)}
#'   \item{population}{Total population (millions), (WHO-ID:44206)}
#'   \item{gdp}{Gross domestic product (GDP), total (2017 PPP $ billions), (WHO-ID:194506)}
#'   \item{Life expectancy at birth (years), life_expectancy}{ (WHO-ID:69206)}
#'   \item{age}{Median age (years), (WHO-ID:47906)}
#'   \item{expenditure_education}{Government expenditure on education (% of GDP), (WHO-ID:149206)}
#'   \item{hiv}{HIV prevalence, adult (% ages 15-49), (WHO-ID:58006)}
#'   \item{tuberculosis}{Tuberculosis incidence (per 100,000 people), (WHO-ID:182206)}
#'   \item{dtp}{Infants lacking immunization, DTP (% of one-year-olds), (WHO-ID:64406)}
#'   \item{meases}{Infants lacking immunization, measles (% of one-year-olds), (WHO-ID:64306)}
#'   \item{internet}{Internet users, total (% of population), (WHO-ID:43606)}
#'   \item{schooling}{Mean years of schooling (years), (WHO-ID:103006)}
#'   \item{mortality_under5y}{Mortality rate, under-five (per 1,000 live births), (WHO-ID:57506)}
#'   \item{birthsupport}{Proportion of births attended by skilled health personnel (%), (WHO-ID:181206)}
#'   \item{unemployment_youth}{Youth not in school or employment (% ages 15-24), (WHO-ID:147906)}
#' }
#' @source \url{http://ec2-54-174-131-205.compute-1.amazonaws.com/API/Information.php}
"whodata"
