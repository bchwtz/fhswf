library(httr)
library(jsonlite)
library(purrr)

# Information for the API
# http://ec2-54-174-131-205.compute-1.amazonaws.com/API/Information.php

indicators <- c(137506, # Human Development Index (HDI)
                44206,  # Total population (millions)
                194506, # Gross domestic product (GDP), total (2017 PPP $ billions)
                69206,  # Life expectancy at birth (years)
                47906,  # Median age (years)
                149206, # Government expenditure on education (% of GDP)
                58006,  # HIV prevalence, adult (% ages 15-49)
                182206, # Tuberculosis incidence (per 100,000 people)
                64406,  # Infants lacking immunization, DTP (% of one-year-olds)
                64306,  # Infants lacking immunization, measles (% of one-year-olds)
                43606,  # Internet users, total (% of population)
                103006, # Mean years of schooling (years)
                57506,  # Mortality rate, under-five (per 1,000 live births)
                181206, # Proportion of births attended by skilled health personnel (%)
                147906  # Youth not in school or employment (% ages 15-24)
                )  # End

base <- "http://ec2-54-174-131-205.compute-1.amazonaws.com/API/HDRO_API.php/indicator_id="
u <- paste0(base,paste0(indicators,collapse = ","))
r <- httr::GET(u)
co <- content(r, as="text", encoding="UTF-8")
d <- fromJSON(co, flatten=T)

# Build Data

country2table <- function(x){
  m <- rbindlist(x, fill=TRUE, idcol="indicator")
  return(as.data.frame(m))
}

# Transform to dataframe
ctl <- lapply(d$indicator_value, country2table)
ctd <- bind_rows(ctl, .id = "country_code")

# Transform to long format
columns <- names(ctd)[names(ctd) %in% 1990:2050]
ctlong <- pivot_longer(ctd, cols = columns, names_to = "year")

# Transform to wide format
ctwide <- pivot_wider(ctlong, id_cols = c("country_code", "year"), names_from = "indicator")

# Correct Naming
ctwide <- ctwide %>% rename(hdi = `137506`,
                            population = `44206`,
                            gdp = `194506`,
                            life_expectancy = `69206`,
                            age = `47906`,
                            expenditure_education = `149206`,
                            hiv = `58006`,
                            tuberculosis = `182206`,
                            dtp = `64406`,
                            measels = `64306`,
                            internet = `43606`,
                            schooling = `103006`,
                            mortality_under5y = `57506`,
                            birthsupport = `181206`,
                            unemployment_youth = `147906`)

# Prepare Saving
whodata <- ctwide

# Saving
f <- paste0("data/whodata.rda")
save(whodata, file = f, compress="xz")
tools::checkRdaFiles(f)
