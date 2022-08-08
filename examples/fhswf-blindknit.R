rmarkdown::available_templates("fhswf")


rmarkdown::draft("B.Rmd", template = "fhswf-seminarpaper", package = "fhswf", edit=FALSE)
fhswf::render_seminarpaper("B/B.Rmd")




