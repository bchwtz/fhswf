library(readxl)
library(tidyverse)

data <- read_excel("examples/footballsmall/data.xlsx")

names(data)

footballsmall <- data %>%
  rename(club = Club,
         clubabbr = Club_code,
         points = Points,
         goals_scored = Goals,
         goals_received = Goals_conceded,
         marketvalue = Market_value,
         marketvalue_goalkeeper = Market_value_goalkeeper,
         marketvalue_defence = Market_value_defence,
         marketvalue_midfield = Market_value_midfield,
         marketvalue_attack = Market_value_attack,
         transferspending = Transfer_spending,
         age_average = Average_age,
         viewers = Spectators) %>%
  mutate(season = "2018/2019")

str(footballsmall)
names(footballsmall)

# Saving
f <- paste0("data/footballsmall.rda")
save(footballsmall, file = f, compress="xz")
tools::checkRdaFiles(f)



