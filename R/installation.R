
#' @export
install_fhswf <- function(){
  #
  tinytex::tlmgr_update()

  pkgs <- c("caption", "xpatch", "csquotes", "verbatimbox", "float","enumitem",
            "elsarticle","pdfcolmk","eurosym","paralist","sectsty","subfig",
            "lineno","algorithm2e","ifoddpage","relsize","setspace",
            "microtype","fp","ms","pgf","babel-english","biblatex",
            "logreq","grffile","bera","fancyhdr","titlesec","palatino",
            "mathtools","eukdate","textpos","grfext","fpl","mathpazo","biber",
            "colortbl", "wrapfig", "pdflscape", "xcolor", "multirow", "carlito",
            "hyphen-german")

  # pkgs <- c(pkgs, "ifdraft") # Package not present in any (?) TexLive Repo

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
#' @param autorename character vector, that contains special characters that are automatically removed from the pdf filenames.
#' @param verbose indicates if messages should be outputted on the command line. In the example chunk those information is also included in a pdf. Default is TRUE.
#' @export
#' @examples
#' # Example rmarkdown code chunk
#' ```{r, echo=FALSE, out.width="24%", fig.show='hold', fig.align = 'left'}
#' fhswf::include_datacamp()
#' ```
include_datacamp <- function(dir = "datacamp",
                             autorename = c(" ","ä","ö","ü","Ä","Ö","Ü","ß"),
                             verbose = TRUE){
  path <- paste0("./",dir)
  if (!dir.exists(path)){
    if(verbose) message("fhswf::include_datacamp --> There is no folder named: ", dir)
    if(verbose) message("Please create the folder:", file.path(getwd(),dir))
  } else {
    f <- list.files(path, full.names = F, pattern = "\\.pdf$")
    if(length(f) == 0){
      if(verbose) message("fhswf::include_datacamp --> There are no PDFs in the folder: ", dir)
    } else {
      # Autoremoving special characters
      if(any(grepl(" ", f)) & !isFALSE(autorename)){
        if(verbose) message("fhswf::include_datacamp --> Some files contain special characters; they are removed.")
        for (char in autorename) f <- gsub(char, "", f)
        file.rename(list.files(path, full.names = T, pattern = "\\.pdf$"),
                    file.path(path,f))
      }
      knitr::include_graphics(list.files(path, full.names = T, pattern = "\\.pdf$"))
    }
  }
}




