#' @rdname presentation
#' @export
fhswf_hooks <- function(){
  hook_source <- knitr::knit_hooks$get('source')
  hook_output <- knitr::knit_hooks$get('output')
  knitr::knit_hooks$set(
    source = function(x, options) {
      x <- hook_source(x, options)
      paste(c("\\codespacing", x, "\\textspacing"), collapse = "\n")
    },
    output = function(x, options){
      x <- hook_output(x, options)
      paste(c("\\codespacing", x, "\\textspacing"), collapse = "\n")
    })
}
