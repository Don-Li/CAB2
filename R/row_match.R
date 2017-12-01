#### Row match #####

#' Find matching rows in a match
#'
#' For a matrix \code{x}, find the rows that are equal to a vector \code{y}.
#'
#' @usage row_match( mat, ref )
#' @usage row_match1( mat, ref )
#'
#' @param mat Numeric matrix
#' @param ref Numeric vector
#'
#' @details
#' \code{row_match} returns all of the rows of \code{mat} that match \code{ref}.
#'
#' \code{row_match1} returns the first matching row. More efficient if only looking for one match because the function terminates when the first match is found.
#'
#' @return
#' A vector of matched row indices.
#'
#' @examples
#' \dontrun{
#' mat = matrix( 1:9, ncol = 3, byrow = T, nrow = 6 )
#' ref = 1:3
#' # Get all matching rows
#' row_match( mat, ref )
#' # Get first matching row
#' row_match1( mat, ref )
#' }
#'
#' @name row_match
#' @rdname row_match
NULL
