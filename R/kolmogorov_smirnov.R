#### Kolmogorov-Smirnov statistic

#' Kolmogorow-Smirnov statistic
#'
#' Calculates the two-sample Kolmogorov-Smirnov statistic
#'
#' @param sample1 Numeric vector.
#' @param sample2 Numeric vector.
#'
#' @details
#' The KS statistic is computed the same way as it is in the \code{ks.test} function in the \code{stats} package. We implemented the algorithm in C++ so that it is faster and does not do the associated hypothesis test.
#'
#' The KS statistic is a dissimilarity between samples that ranges between 0 (equivalent) and 1 (most different).
#'
#' @examples
#' \dontrun{
#' x = rnorm( 1000, 0, 1 )
#' y = rnorm( 1000, 1, 1 )
#' ks( x, y )
#'
#' # x and y come from the same distribution. Low KS
#' y2 = rnorm( 1000, 0, 1 )
#' ks( x, y2 )
#'
#' # Higher KS
#' y3 = rnorm( 1000, 0, 10 )
#' ks( x, y3 )
#'
#' # x and y do not need to be the same size sample.
#' y4 = rnorm( 100, 0, 1 )
#' ks( x, y4 )
#' }
#'
#' @return
#' Returns \code{Inf} if the lengths of either \code{sample1} or \code{sample2} are 1.
#'
#' @name ks
#' @rdname ks
#' @seealso \link{ks.test}
#' @seealso \href{https://en.wikipedia.org/wiki/Kolmogorov-Smirnov_test}{Wikipedia}
NULL
