
#' @export
install_fhswf <- function(){
  #
  tinytex::tlmgr_update()

  pkgs <- c("caption", "xpatch", "csquotes", "verbatimbox", "float","enumitem",
            "elsarticle","pdfcolmk","eurosym","paralist","sectsty","subfig",
            "lineno","algorithm2e","ifoddpage","relsize","setspace",
            "ifdraft","microtype","fp","ms","pgf","babel-english","biblatex",
            "logreq","grffile","bera","fancyhdr","titlesec","palatino",
            "mathtools","eukdate","textpos","grfext","fpl","mathpazo","biber")

  pkgs <- pkgs[!duplicated(pkgs)]
  pkgs <- sort(pkgs)

  tinytex::tlmgr_install(pkgs = pkgs)
}

#' @export
update_fhswf <- function(){
  message("Updating the fhswf package...\n")
  remotes::install_github("bchwtz/fhswf", dependencies = TRUE,
                          upgrade = TRUE, quiet = TRUE)
}

#' Include PDFs in RMarkdown Document
#'
#' @description
#' The intended use case for this function is to include pdf certificates of the
#' platform Datacamp within the fhswf::seminarpaper document. The example below
#' shows an rmarkdown chunk for importing a series of pdf certificates.
#'
#' @param dir name of the subdirectory in the rmarkdown document folder, the default folder is called "datacamp"
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




