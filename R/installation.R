
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

  pkg <- c("caption", "xpatch", "csquotes", "verbatimbox", "float","enumitem")
  x <- sapply(pkg, tinytex::tlmgr_install)
}

