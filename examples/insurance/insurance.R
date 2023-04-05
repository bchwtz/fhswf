library(readr)
library(tidyverse)

insurance <- read_csv("examples/insurance/insurance.csv")

#Variable charges auf 2 NKST runden
insurance$charges <- round(insurance$charges, 2)

insurance <- insurance %>% relocate(charges)

names(insurance)

# Saving
f <- paste0("data/insurance.rda")
save(insurance, file = f, compress="xz")
tools::checkRdaFiles(f)
