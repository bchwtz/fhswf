ytsubs.tseries <- readRDS("examples/youtubesubs/tseries.subs.rds")
ytsubs.bibi    <-   readRDS("examples/youtubesubs/bibi.subs.rds")

# Saving
f <- paste0("data/ytsubs.bibi.rda")
save(ytsubs.bibi, file = f, compress="xz")
tools::checkRdaFiles(f)

f <- paste0("data/ytsubs.tseries.rda")
save(ytsubs.tseries, file = f, compress="xz")
tools::checkRdaFiles(f)

