library(readr)
library(tidyverse)

michelin <- read_csv("examples/michelin/michelin_all_with_price.csv",
                     col_types = cols(`postcode` = col_character()))

## Drop and rename colums

michelin <- michelin %>%
  select(-`Unnamed: 0.1`, -`Unnamed: 0`, -other,
         -stars_cat, -county, -state, -...1) %>%
  rename(cooking_style = cooking_type) %>%
  rename(restaurant_link = restaurant_website) %>%
  rename(opening_hours_monday = monday) %>%
  rename(opening_hours_tuesday = tuesday) %>%
  rename(opening_hours_wednesday = wednesday) %>%
  rename(opening_hours_thursday = thursday) %>%
  rename(opening_hours_friday = friday) %>%
  rename(opening_hours_saturday = saturday) %>%
  rename(opening_hours_sunday = sunday) %>%
  rename(cooking_style_classic = classic) %>%
  rename(cooking_style_creative = creative) %>%
  rename(cooking_style_modern = modern) %>%
  rename(cooking_style_french = french) %>%
  rename(michelin_stars = stars) %>%
  rename(location_latitude = latitude) %>%
  rename(location_longitude = longitude)

names(michelin)

michelin <- michelin %>%
  relocate(lower_price, upper_price, michelin_stars,
          country, city, postcode, location_latitude, location_longitude,
          cooking_style, cooking_style_classic, cooking_style_modern, cooking_style_creative, cooking_style_french,
          vegetarian, sustainable, wine_card, nice_view, accessible, online_booking) %>%
  relocate(restaurant_link, michelin_link,.after = last_col())

# Saving
f <- paste0("data/michelin.rda")
save(michelin, file = f, compress="xz")
tools::checkRdaFiles(f)
