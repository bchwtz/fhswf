#' @rdname presentation
#' @export
fhswf_hooks <- function(){
  hook_chunk = knitr::knit_hooks$get('chunk')

  knitr::knit_hooks$set(chunk = function(x, options) {
    regular_output = hook_chunk(x, options)
    # add latex commands if chunk option singlespacing is TRUE
    if (isTRUE(options$singlespacing))
      sprintf("\\singlespacing\n %s \n", regular_output)
    else
      regular_output
  })
}


## old version:

# fhswf_hooks <- function(){
#   hook_source <- knitr::knit_hooks$get('source')
#   hook_output <- knitr::knit_hooks$get('output')
#   knitr::knit_hooks$set(
#     source = function(x, options) {
#       x <- hook_source(x, options)
#       paste(c("\\codespacing", x, "\\textspacing"), collapse = "\n")
#     },
#     output = function(x, options){
#       x <- hook_output(x, options)
#       paste(c("\\codespacing", x, "\\textspacing"), collapse = "\n")
#     })
# }
