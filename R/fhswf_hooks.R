#' @rdname presentation
#' @export
fhswf_hooks <- function(){
  # see: "How can I automate different spacing between text and code blocks in R Markdown?" asked by duckmayr June 19, 2019 13:03, answer by Joris C., June 21, 2019 14:27. URL: https://stackoverflow.com/questions/56704022/how-can-i-automate-different-spacing-between-text-and-code-blocks-in-r-markdown [Accessed: June 23, 2022; 08:38]:
  # hook_chunk = knitr::knit_hooks$get('chunk')
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
