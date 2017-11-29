#' Returns factor levels same as factor levels in Input
#'
#'
#' @param x factor or a character
#'
#' @return factor; return unique levels of input in the order in which they appear in the Input
#' @export
#'
#' @examples
#' data_1 <- c("Asia","Africa","Americas","Europe","Oceania")
#' factor_as_orginal(data_1)
factor_as_orginal <- function(x) {
  if(!(is.factor(x)||is.character(x)))
    stop("Input is neither a character nor a factor")

  asOriginalFactor <-as.character(unique(x))
  factor(x, levels = asOriginalFactor)
 }
