library(tidyverse)
library(readxl)

basil <- read_excel("examples/basil/basil.xlsx",
                    col_types = c("numeric", "text", "date",
                                  "date", "date", "text", "text", "numeric",
                                  "numeric", "numeric", "numeric", "numeric",
                                  "numeric", "numeric", "numeric", "numeric",
                                  "numeric", "numeric", "numeric", "numeric",
                                  "numeric", "numeric", "numeric", "numeric",
                                  "numeric"))


#cat(paste0("#'   \\item{",names(basil),"}{ }\n"))

# Saving
f <- paste0("data/basil.rda")
save(basil, file = f, compress="xz")
tools::checkRdaFiles(f)

