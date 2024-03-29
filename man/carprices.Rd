% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/carprices.R
\docType{data}
\name{carprices}
\alias{carprices}
\title{Car Price Dataset}
\format{
A data frame with 205 rows and 26 variables:
\describe{
  \item{body}{body style of the car, either hardtop, wagon, sedan, hatchback or convertible}
  \item{brand}{manufacturer of the car}
  \item{doors}{number of doors of the car, either 2 or 4}
  \item{drive_wheels}{wheels supplied with torque, either Four Wheel Drive (4wd), Front Wheel Drive (fwd) or Rear Wheel Drive (rwd)}
  \item{engine_aspiration}{air intake by the engine, either standard (std) or turbocharger (turbo)}
  \item{engine_bore}{diameter of the bore for the cylinders, in inches}
  \item{engine_compression}{compression ratio of the engine}
  \item{engine_cylinders}{number of cylinders in the engine, from 2 to 12}
  \item{engine_fuelsystem}{fuel injection method, either 1bbl, 2bbl, 4bbl, idi, mfi, mpfi, spdi or spfi}
  \item{engine_fueltype}{fuel type required by the engine, either diesel or gas}
  \item{engine_location}{location of the engine, either front or rear}
  \item{engine_size}{egine displacement, in cubic inches}
  \item{engine_stroke}{stroke length, distance traveled by the pistons in the engine, in inches}
  \item{engine_type}{valve controlling mechanism, either dohc, dohcv, l, ohc, ohcf, ohcv or rotor. e.g. dohc = Double Overhead Overhead Camshaft, rotor = Wankel Motor }
  \item{height}{height of the car, in inches}
  \item{hp}{gross horsepower rating of the engine}
  \item{insurance_normloss}{The relative average loss payment per insured vehicle year. This value is normalized for all autos within a particular size classification (two-door small, station wagons, sports/speciality, etc...), and represents the average loss per car per year.}
  \item{insurance_symboling}{The degree to which the auto is more risky than its price indicates. Cars are initially assigned a risk factor symbol associated with its price. Then, if it is more risky (or less), this symbol is adjusted by moving it up (or down) the scale. Actuarians call this process "symboling". A value of +3 indicates that the auto is risky, -3 that it is probably pretty safe.}
  \item{length}{length of the car, in inches}
  \item{mpg_city}{fuel consumption in the city, in miles per gallon}
  \item{mpg_highway}{fuel consumption on the highwas, in miles per gallon}
  \item{price}{list price of the car, in US dollars}
  \item{rpm_max}{maximum rotation speedof the engine, in revolutions per minute}
  \item{weight}{weight of the car, lbs}
  \item{wheelbase}{length of the wheel base, in inches}
  \item{width}{width of the car, in inches}
}
}
\source{
\url{http://archive.ics.uci.edu/ml/datasets/Automobile}
}
\usage{
carprices
}
\description{
This data set consists of three types of entities: (a) the specification of
an auto in terms of various characteristics, (b) its assigned insurance risk
rating, (c) its normalized losses in use as compared to other cars.
}
\keyword{datasets}
