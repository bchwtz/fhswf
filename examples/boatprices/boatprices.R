library(dplyr)
library(olsrr)
library(ggplot2)
library(stringr)
library(gapminder)
library(quantmod)
library(readr)
library(libr)
library(sjmisc)

boat_data <- read_csv("examples/boatprices/boatprices.csv")

################################################################################################
##Preparation of data
################################################################################################

#Rename Columns
boat_data <- boat_data %>%
  rename(Engine_Hours = `Engine Hours`) %>%
  rename(Year_Built = `Year Built`)

#Remove unecessary Variables
boat_data <- select(boat_data, Price, Length, Width, `Boat Type`, Manufacturer,
                    Model, Type, Condition,
                    Year_Built, Engine_Hours)
#Remove characters from prices
boat_data$clearprice <- gsub("£","GBP", boat_data$Price)

#Currency converter
#Extract numeric values from price
boat_data$Pricenum <- parse_number(boat_data$clearprice,
                                   locale= locale(decimal_mark=",",
                                                  grouping_mark = "."))

#Extract character (currency) values from price
boat_data$Pricecur <- str_extract(boat_data$clearprice, "[aA-zZ]+")

#Convert prices to EUR
boat_data <- datastep(boat_data, {
  if(is.na(Pricecur))
    ConvPrice <- round(Pricenum, digits=0)
  else if(Pricecur == "EUR")
    ConvPrice <- round(Pricenum, digits=0)
  else if(Pricecur == "USD")
    ConvPrice <- round(Pricenum * 0.877, digits=0)
  else if(Pricecur == "CHF")
    ConvPrice <- round(Pricenum * 0.934, digits=0)
  else if(Pricecur == "DKK")
    ConvPrice <- round(Pricenum / 7.456, digits=0)
  else if(Pricecur == "SEK")
    ConvPrice <- round(Pricenum / 10.491, digits=0)
  else if(Pricecur == "GBP")
    ConvPrice <- round(Pricenum * 1.125, digits=0)
})

#Converting length and width to numeric
boat_data$Length <- parse_number(boat_data$Length)
boat_data$Width <- parse_number(boat_data$Width)
boat_data$Engine_Hours <- parse_number(boat_data$Engine_Hours)
boat_data$Year_Built <- as.numeric(boat_data$Year_Built)

#Extract other than boats with a motor
boat_data <- boat_data %>% filter(`Boat Type` != "Catamaran"
                                  & `Boat Type` != "House Boat"
                                  & `Boat Type` != "Motorsailer"
                                  & `Boat Type` != "Passenger boat"
                                  & `Boat Type` != "Water ski"
                                  & `Boat Type` != "Working Boat"
                                  & `Boat Type` != "Ketch"
                                  & `Boat Type` != "Launch")
#Standardize Boat Type
boat_data <- datastep(boat_data, {
  if(str_contains(`Boat Type`, "Bowrider"))
    `Boat Type` <- "Bowrider"
  else if(str_contains(`Boat Type`,"Cabin Boat"))
    `Boat Type` <- "Cabin Boat"
  else if(str_contains(`Boat Type`,"Center console boat"))
    `Boat Type` <- "Center console boat"
  else if(str_contains(`Boat Type`,"Classic"))
    `Boat Type` <- "Classic"
  else if(str_contains(`Boat Type`,"Deck Boat"))
    `Boat Type` <- "Deck Boat"
  else if(str_contains(`Boat Type`,"Fishing Boat"))
    `Boat Type` <- "Fishing Boat"
  else if(str_contains(`Boat Type`,"Flybridge"))
    `Boat Type` <- "Flybridge"
  else if(str_contains(`Boat Type`,"Hardtop"))
    `Boat Type` <- "Hardtop"
  else if(str_contains(`Boat Type`,"Motor Yacht"))
    `Boat Type` <- "Motor Yacht"
  else if(str_contains(`Boat Type`,"Deck Boat"))
    `Boat Type` <- "Motor Yacht"
  else if(str_contains(`Boat Type`,"Cabin Boat"))
    `Boat Type` <- "Motor Yacht"
  else if(str_contains(`Boat Type`,"Runabout"))
    `Boat Type` <- "Runabout"
  else if(str_contains(`Boat Type`,"Sport Boat"))
    `Boat Type` <- "Sport Boat"
  else if(str_contains(`Boat Type`,"Trawler"))
    `Boat Type` <- "Trawler"
  else if(str_contains(`Boat Type`,"Wakeboard"))
    `Boat Type` <- "Wakeboard"
})

#Remove points with one observation
boat_data <- boat_data %>% filter(`Boat Type` != "Offshore Boat,Pilothouse"
                                  & `Boat Type` != "Mega Yacht")
#Factor Boat Type
boat_data <- boat_data %>%
  mutate(Boat_type_fct = factor(`Boat Type`,
                                levels=c("Flybridge","Hardtop","Motor Yacht",
                                         "Pilothouse","Center console boat",
                                         "Sport Boat","Classic","Trawler",
                                         "Bowrider", "Runabout","Pontoon Boat",
                                         "Wakeboard"),
                                ordered = T)) %>%
  mutate(Condition_fct = as.numeric(Boat_type_fct))

#Extract Boats NAs in ConvPrice,Length, Width, Year Built
boat_data <- boat_data %>% filter(!is.na(ConvPrice)
                                  & !is.na(Length)
                                  & !is.na(Width)
                                  & !is.na(Year_Built)
                                  & !is.na(Engine_Hours))

#Condition for new boats
boat_data <- datastep(boat_data, {
  if(is.na(Condition) &
     str_contains(Type, "new boat from stock"))
    Condition <- "new"
  else if(is.na(Condition) &
          str_contains(Type,"new boat on order"))
    Condition <- "new"
  else if(is.na(Condition) &
          str_contains(Type,"Used boat"))
    Condition <- "used"
})

#Remove Boats that dont work
boat_data <- boat_data %>% filter(!is.na(Condition)
                                  & Condition != "for tinkers"
                                  & Condition != "to be done up")

#Factor for Conditions
boat_data <- boat_data %>%
  mutate(Condition_fct = factor(Condition,
                                levels=c("new","as new","very good","well-groomed","good","used"),
                                ordered = T))%>%
  mutate(Condition_fct = as.numeric(Condition_fct))

################################################################################################
##Cleanup
################################################################################################

#Remove Data out of Scope
boat_data <- boat_data %>% filter(ConvPrice < 300000
                                  & Length < 20
                                  & Width > 0
                                  & Year_Built > 1980
                                  & Engine_Hours< 3000)

#Boats with unusual width
drop_outlier <- c(617,623,1570,2794,2805,3455)
boat_data <- boat_data[-drop_outlier,]


#### Examples

boatprices <- boat_data %>% rename(price = ConvPrice,
                                   length = Length,
                                   width = Width,
                                   boat_type = Boat_type_fct,
                                   engine_hours = Engine_Hours,
                                   model = Model,
                                   condition = Condition_fct,
                                   manufacturer = Manufacturer,
                                   year_built = Year_Built) %>%
  select(price, length, width, boat_type, engine_hours,
         model, condition, manufacturer, year_built)

dim(boatprices)
summary(boatprices$price)

# Saving
f <- paste0("data/boatprices.rda")
save(boatprices, file = f, compress="xz")
tools::checkRdaFiles(f)

