library(tidyverse)
library(readxl)
library(magrittr)

basil <- read_excel("examples/basil/basil.xlsx",
                    col_types = c("numeric", "text", "date",
                                  "date", "date", "text", "numeric", "text",
                                  "numeric", "numeric", "numeric", "numeric",
                                  "numeric", "numeric", "numeric", "numeric",
                                  "numeric", "numeric", "numeric", "numeric",
                                  "numeric", "numeric", "numeric", "numeric",
                                  "numeric", "numeric", "numeric"))

# Sort the individual plant weights by size per pot, so that the heaviest
# individual plant lands in the variable weight_plant1.

tmp  <- basil %>% select(starts_with("weight_plant"))
tmpsorted <- t(apply(tmp, MARGIN = 1, sort, decreasing =  TRUE, na.last = TRUE))
colnames(tmpsorted) <- colnames(tmp)
basil %<>% select(-starts_with("weight_plant")) %>% bind_cols(tmpsorted)

# Create the variable plantcount that signifies the number of individual plants
# per pot and the variable weight_plantsum that is the sum of the individual
# plant weights. The difference to the variable weight_total indicates the
# weight of (potentially lost) individual leaves.

basil$plantcount      <- apply(!is.na(tmp), MARGIN = 1, sum)
basil$weight_plantsum <- apply(tmp, MARGIN=1, sum, na.rm = TRUE)

# Generate additional variables that facilitate analysis
basil %<>%
  mutate(plantdensity = ifelse(potspacing ==  85, "high", NA),
         plantdensity = ifelse(potspacing == 102,  "low", plantdensity),
         weight_lostyield = weight_total - weight_plantsum)

# Add measurements for the distances to the next water groove, as water
# availability between watering cycles may support plant growth. The distance
# to the next water groove is only dependent on the density of the plantplate
# and the column. The following tibble lists the distance from every groove
# to the center of the plant pot columns.

spacing <- tribble(
  #===========================================================================
  ~potspacing, ~column, ~groove1, ~groove2, ~groove3, ~groove4, ~groove5,
  #===========================================================================
  #=== HIGH DENSITY PLANTPLATE: Distances to water grooves by pot column in mm
  #===========================================================================
           85,       1,    27.71,   220.63,   367.71,   514.80,   707.71,
           85,       2,    45.83,   147.08,   294.17,   441.25,   634.17,
           85,       3,    119.37,   73.54,   220.63,   367.71,   560.62,
           85,       4,    192.92,       0,   147.08,   294.17,   487.08,
           85,       5,    266.46,   73.54,    73.54,   220.63,   413.54,
           85,       6,    340.00,  147.08,        0,   147.08,   340.00,
           85,       7,    413.54,  220.63,    73.54,    73.54,   266.46,
           85,       8,    487.08,  294.17,   147.08,        0,   192.37,
           85,       9,    560.62,  367.71,   220.63,    73.54,   119.37,
           85,      10,    634.17,  441.25,   294.17,   147.08,    45.83,
           85,      11,    707.71,  514.80,   367.71,   220.63,    27.71,
  #===========================================================================
  #=== LOW DENSITY PLANTPLATE: Distances to water grooves by pot column in mm
  #===========================================================================
          102,       1,     13.00,  205.92,   353.00,   500.10,   693.00,
          102,       2,    75.250,  117.67,   264.75,   411.83,   604.75,
          102,       3,    163.50,   29.42,    176.5,   323.58,   516.50,
          102,       4,    251.71,   58.83,    88.25,   253.33,   428.25,
          102,       5,    340.00,  235.33,        0,   147.08,   340.00,
          102,       6,    428.25,  235.33,    88.25,    59.83,   251.75,
          102,       7,    516.50,  323.58,   176.50,    29.42,   163.50,
          102,       8,    604.75,  411.83,   264.75,   117.67,    75.25,
          102,       9,    693.00,  500.10,   353.00,   205.92,    12.00)
  #=====================================================================END===

spacing %<>% rowwise() %>% abs() %>%
  mutate(mingroovedist = min(groove1, groove2, groove3, groove4, groove5)) %>%
  select(potspacing, column, mingroovedist)

basil %<>% left_join(spacing)

# Add dummy variables for identifying pots that are placed on the border and
# thus are not surrounded by other plants. As the specific setup may differ by
# run, the specifics for each run (identified by variable ID) must be reflected
# here.

basil %<>% group_by(potspacing) %>%
  #=== STANDARD SETUP ==========================================================
  # The usual setup assumes that a level is equipped with four plantplates. The
  # first plantplate position is located on the water side of the system. The
  # fourth plantplate is located on the electricity side of the system.
  mutate(border_window = ifelse(column == max(column), T, F),
         border_door   = ifelse(column == min(column), T, F),
         border_water  = ifelse(plantplatepos == 1 & row == min(row), T, F),
         border_elec   = ifelse(plantplatepos == 4 & row == max(row), T, F)) %>%
  # All other borders between the plates are located next to another
  # plantplate. Here the pots directly on the border are "missing" and thus the
  # room a plant can obtain is a little spacier. A position is bordering another
  # plantplate, when its located on the max or min row and if the position has
  # not been identified to be bordering the water or electricity side.
  mutate(border_row = ifelse(row == min(row) | row == max(row), T, F),
         border_plantplate = xor(border_row, border_water | border_elec)) %>%
  # Plates for spacing out the plantplates do not exist in the standard setup as
  # all space is equipped with plantplates.
  mutate(border_spaceplate = FALSE) %>%
  #=== RUN ID 1 ================================================================
  # The first testrun made deliberate use of spaceplates to add extra space
  # between the plantplates. Therefore no border was located direcly besides
  # another plantplate. Also no plantplate was bordering the water or
  # electricity side directly. The relevant part of the  setup looked like this:
  # spaceplate + plantplate1 + spaceplate + plantplate2 + spaceplate
  mutate(border_spaceplate = ifelse(ID == 1 & border_row, T, border_spaceplate),
         border_water = ifelse(ID == 1, FALSE, border_water),
         border_elec  = ifelse(ID == 1, FALSE, border_elec)) %>%
  #=== FINALLY =================================================================
  # Given a pot is located at any border it has approximately the same amount
  # of extra space. Therefore we combine all bordering variables into one new
  # variable. We do not consider the cases of two bordering plantplates here,
  # as the amount of extra space seems negligible.
  mutate(border = border_window | border_door | border_water |
           border_elec | border_spaceplate)
  # === END ====================================================================


#cat(paste0("#'   \\item{",names(basil),"}{ }\n"))

# Saving
f <- paste0("data/basil.rda")
save(basil, file = f, compress="xz")
tools::checkRdaFiles(f)





