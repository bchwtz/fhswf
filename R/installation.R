
#' @export
install_fhswf <- function(){
  #
  tinytex::tlmgr_update()
  tinytex::tlmgr_install("elsarticle")
  tinytex::tlmgr_install("pdfcolmk")
  tinytex::tlmgr_install("eurosym")
  tinytex::tlmgr_install("paralist")
  tinytex::tlmgr_install("sectsty")
  tinytex::tlmgr_install("subfig")
  tinytex::tlmgr_install("lineno")
  tinytex::tlmgr_install("caption")
  tinytex::tlmgr_install("algorithm2e")
  tinytex::tlmgr_install("ifoddpage")
  tinytex::tlmgr_install("relsize")
  tinytex::tlmgr_install("setspace")
  tinytex::tlmgr_install("ifdraft")
  tinytex::tlmgr_install("microtype")

  tinytex::tlmgr_install("fp")
  tinytex::tlmgr_install("ms")
  tinytex::tlmgr_install("pgf")
  tinytex::tlmgr_install("babel-english")
  tinytex::tlmgr_install("biblatex")
  tinytex::tlmgr_install("logreq")
  tinytex::tlmgr_install("grffile")
  tinytex::tlmgr_install("bera")
  tinytex::tlmgr_install("fancyhdr")
  tinytex::tlmgr_install("titlesec")
  tinytex::tlmgr_install("palatino")
  tinytex::tlmgr_install("mathtools")
  tinytex::tlmgr_install("eukdate")
  tinytex::tlmgr_install("textpos")
  tinytex::tlmgr_install("grfext")

  tinytex::tlmgr_install("fpl")
  tinytex::tlmgr_install("mathpazo")

  pkg <- c("caption", "xpatch", "csquotes", "verbatimbox", "float","enumitem")
  x <- sapply(pkg, tinytex::tlmgr_install)
}


#' Include PDFs in RMarkdown Document
#'
#' @description
#' The intended use case for this function is to include pdf certificates of the
#' platform Datacamp within the fhswf::seminarpaper document. The example below
#' shows an rmarkdown chunk for importing a series of pdf certificates.
#'
#' @param folder name of the subdirectory in the rmarkdown document folder, the default folder is called "datacampe"
#' @export
#' @examples
#' # Example rmarkdown code chunk
#' ```{r, echo=FALSE, out.width="24%", fig.show='hold'}
#' fhswf::include_datacamp()
#' ```
include_datacamp <- function(dir="datacamp"){
  f <- list.files(paste0("./",dir), full.names = T)
  f <- f[grepl("\\.pdf$", f)]
  knitr::include_graphics(f)
}




