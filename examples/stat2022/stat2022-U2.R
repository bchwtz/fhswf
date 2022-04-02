################################################################################
################################################################################
#####                                                                      #####
#####                       Modul: Statistik 2022                          #####
#####                    Prof. Dr. Benjamin Buchwitz                       #####
#####                    buchwitz.benjamin@fh-swf.de                       #####
#####                                                                      #####
################################################################################
#####                                                                      #####
#####                              Uebung 2                                #####
#####                         Author: Lutz Wenker                          #####
#####                                                                      #####
################################################################################
################################################################################

##### Vorbereitung -------------------------------------------------------------

#install.packages("remotes")
#remotes::install_github("bchwtz/fhswf")
library(fhswf)

##### Daten --------------------------------------------------------------------

stat2022$U2

#####  Aufgabe 1 ---------------------------------------------------------------

hist(stat2022$U2$A1, breaks = c(0, 6, 10, 13, 17, 22, 30),
     main = "Ausgaben fuer Bioprodukte",
     xlab = "Ausgaben in Euro",
     ylab = "Norm. rel. Haeufigkeit")

#####  Aufgabe 2 ---------------------------------------------------------------

table(stat2022$U2$A2)

mean(stat2022$U2$A2)
fhswf::modal(stat2022$U2$A2)
median(stat2022$U2$A2)

sd(stat2022$U2$A2)
var(stat2022$U2$A2)
max(stat2022$U2$A2) - min(stat2022$U2$A2)

#####  Aufgabe 3 ---------------------------------------------------------------

mean_growthrate <- function(x){
  first_year <- x[1]
  last_year <- x[length(x)]
  years <- length(x) - 1
  return((last_year/first_year)^(1/years))
}

mean_growthrate(stat2022$U2$A3$revenue_company)
mean_growthrate(stat2022$U2$A3$revenue_branch)

mean(stat2022$U2$A3$revenue_company)

#####  Aufgabe 4 ---------------------------------------------------------------

name <- c("FH", "Akademien", "Univeristaet","Duale Hochschule")
barplot(stat2022$U2$A4[[1]],
    names = name,
    col=rainbow(length(name)),
    ylab = "Anteil",
    main="Abieter dualer Studiengaenge")

name <- c("BWL, Finanzen & Management", "Ingenieurwesen & Technik",
          "andere Studiengaenge")
barplot(stat2022$U2$A4[[2]],
        names = name,
        col=rainbow(length(name)),
        ylab = "Anteil",
        main="Fachbereiche")

barplot(stat2022$U2$A4[[3]], main="Anteil Hochschulen mit dualem Angebot",
        xlab="Bundeslaender",
        ylab = "Anteil",
        col = c("white","gray","blue"))

#####  Aufgabe 5 ---------------------------------------------------------------

plot(ecdf(stat2022$U2$A5),
     main="Empirische Verteilungsfunktion",
     xlab = "Bibliotheksbesuche",
     ylab = "Kum. rel. Haeufigkeit")

#####  Aufgabe 6 ---------------------------------------------------------------

#install.packages("ineq")
library(ineq)
par(pty="s") # Plot quadratisch

lorenzcurve <- ineq::Lc(stat2022$U2$A6$revenue, n=stat2022$U2$A6$count)
data.frame(kj = lorenzcurve$p, lj = lorenzcurve$L) # Tabelle

plot(lorenzcurve)

data <- rep(stat2022$U2$A6$revenue, times = stat2022$U2$A6$count)
ineq::Gini(data)
