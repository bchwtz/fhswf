library(readr)
library(tidyverse)
library(readxl)

lego <- read_excel("examples/lego/DiB whole sample Dec 2015 prices.xlsx")

## Drop and rename colums

lego <- lego %>%
  rename(year = `year of release`) %>%
  rename(piece_count = `# of pieces`) %>%
  rename(minifigure_count = `# of minifigures`) %>%
  rename(price_secondary_new = `Secondary market prices of new sets in 2015`) %>%
  rename(price_secondary_used = `Secondary market prices of used sets in 2015`) %>%
  rename(price_release = `Primary market price at release`) %>%
  rename(age_recommendation = age) %>%
  rename(size_group = `Size group (1 - Biggest; 4 - Smallest)`) %>%
  mutate(minifigure_count = as.numeric(minifigure_count)) %>%
  mutate(price_secondary_new = as.numeric(price_secondary_new)) %>%
  mutate(price_secondary_used = as.numeric(price_secondary_used))

lego
names(lego)

# Saving
f <- paste0("data/lego.rda")
save(lego, file = f, compress="xz")
tools::checkRdaFiles(f)
