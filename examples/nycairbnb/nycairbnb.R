library(tidyverse)
library(readr)

nycairbnb <- read_csv("examples/nycairbnb/AB_NYC_2019.csv")

nycairbnb <- nycairbnb %>%
  rename(host_listings_count = calculated_host_listings_count)

nycairbnb <- as.data.frame(nycairbnb)
names(nycairbnb)

# Saving
f <- paste0("data/nycairbnb.RData")
save(nycairbnb, file = f, compress="xz")



