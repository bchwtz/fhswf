stat2022 <- list()
nodata <- "No Data"

## Uebung 1 --------------------------------------------------------------------

stat2022$U1 <- nodata

## Uebung 2 --------------------------------------------------------------------

### Aufgabe 1
breaks <- c(0,6,10,13,17,22,30)
counts <- c(120,100,60,48,40,32)
mids <- breaks[-length(breaks)] + diff(breaks) / 2
data <- rep(mids, times = counts)

stat2022$U2$A1 <- data

### Aufgabe 2

stat2022$U2$A2 <- c(10,13,9,11,12,10,11,12,12,11,9,11,13,10,9,11,12,10,11,
                    10,12,8,6,9,12,8,7,9,8,13,10,10,8,10,13,10,11,13,10,9,
                    9,11,12,7,10,11,9,11,12,11,13,9,10,13,10,9,10,8,10,9,
                    10,7,11,8,9,12,8,12,8,11,5,12,9,11,14,13,12,11,7,14,11,
                    10,12,15,11,8,10,9,11,10,14,9,11,12,10,11,6,10,9,12)

## Aufgabe 3

stat2022$U2$A3 <- data.frame(year            = c(2010,2011,2012,2013,2014,2015),
                             revenue_company = c(47.2,48.5,55.3,45.2,55.1,55.4),
                             revenue_branch  = c(12.5,13.4,16.2,13.5,16.5,17.1))
## Aufgabe 4

T1 <- c(FH=0.64, Akademie=0.23, Uni=0.07, Dual=0.06)
T2 <- c(BWL=0.48, Ing=0.39, Andere=0.13)
T3 <- c(BaWue=0.21, NRW=0.26, Bayern=0.2)

stat2022$U2$A4 <- list(T1, T2, T3)

## Aufgabe 5

counts <- c(3,6,16,22,15,7,1)
data <- rep(0:6, times=counts)

stat2022$U2$A5 <- data

## Aufgabe 6

data <- data.frame(revenue = c(25200, 48600, 66150, 151200),
                   count   = c(9, 7, 6, 3))

stat2022$U2$A6 <- data

## Uebung 3 --------------------------------------------------------------------

stat2022$U3 <- "No data"



# End

save(stat2022,file=paste0("data/stat2022.RData"))
