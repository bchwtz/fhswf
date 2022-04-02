library(tidyverse)
library(readr)
library(tools)

load("./examples/carprices/GSE_auto.rda")

names(auto)
carprices <- auto %>%
  rename(brand = Make,
         doors = "Num-of-doors",
         body = "Body-style",
         drive_wheels = "Drive-wheels",
         engine_location = "Engine-location",
         wheelbase = "Wheel-base",
         length = Length,
         width = Width,
         height = Height,
         weight = "Curb-weight",
         engine_fueltype = "Fuel-type",
         engine_aspiration = Aspiration,
         engine_type = "Engine-type",
         engine_cylinders = "Num-of-cylinders",
         engine_size = "Engine-size",
         engine_fuelsystem = "Fuel-system",
         engine_bore = Bore,
         engine_stroke = Stroke,
         engine_compression = "Compression-ratio",
         hp = Horsepower,
         rpm_max = "Peak-rpm",
         mpg_city = "City-mpg",
         mpg_highway = "Highway-mpg",
         price = Price,
         insurance_symboling = Symboling,
         insurance_normloss = "Normalized-losses") %>%
  select(order(colnames(.)))

# Saving
f <- paste0("data/carprices.rda")
save(carprices, file = f, compress="xz")
tools::checkRdaFiles(f)

