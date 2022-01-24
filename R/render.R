#' @rdname presentation
#' @export
render_seminarpaper <- function(...){

  files <- c("WirGebenImpulse.pdf",
             "FHSWF.pdf")

  for (f in files)
    if (!file.exists(f))
      file.copy(system.file("rmarkdown", "templates", "fhswf-seminarpaper", "skeleton",
                            f, package="fhswf"),
                ".", recursive=TRUE)

  rmarkdown::render(...)

  files <- c(files,list.files(patter="\\.log"), list.files(patter="\\.tex"))
  for (f in files)
    unlink(f, recursive = FALSE, force = FALSE)


}

