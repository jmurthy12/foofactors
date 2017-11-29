#' Reorder levels in descending order
#'
#' A version of reorder that uses dplyr::desc() to reorder
#' factor levels in descending order
#'
#' @param x factor
#'
#' @return factor
#' @export
#'
#' @examples
#' data_2 <- factor(c("setosa","versicolor"))
#' reorder_descending(data_2)
reorder_descending <- function(x) {
  if(is.null(x))stop("Please input a non 'NULL' vector")
  if(!is.factor(x))stop("Input vector is not a factor")
   stats::reorder(x, dplyr::desc(x))
}
