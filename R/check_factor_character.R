#' Detects factors that should be characters
#'
#' Detects factors that should be character, because
#' # unique values = length
#'
#' @param x factor
#'
#' @return logical
#' @export
#'
#' @examples
#' #' check_factor_character(iris$Species)
check_factor_character <- function(x){

  if(!is.factor(x))stop("Input is not a factor")

  length(x)==length(unique(x))

}
