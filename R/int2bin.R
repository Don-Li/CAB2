#### Binary to integer conversions

#' Binary to integer conversions
#'
#' Convert binary vectors to integers and the reverse.
#'
#' @usage int2bin( digits, integers )
#' @usage bin2int( digits, binaries )
#'
#' @param digits An integer specifying the number of bits to return.
#' @param integers A vector of base 10 integers to convert to binary.
#' @param binaries A matrix of binary integers to convert to base 10.
#'
#' @return
#' \code{int2bin()} returns an \code{n x m} matrix. Columns are ordered as in the \code{integers} argument. Each column is an binary number. Each row is a digit of the binary number with total number of rows given by \code{digits}.
#'
#' \code{bin2int()} returns a vector of integers. Semantic inverse of \code{int2bin()}.
#'
#' @examples
#' \dontrun{
#' x = c(0, 1023)
#' y = int2bin( 10, x )
#' z = bin2int( 10, y )
#' }
#'
#' @name int2bin
#' @aliases bin2int
#' @rdname int2bin
#'
#' @export bin2int

bin2int = function( digits, binaries ){
    crossprod( binaries, 2^(0:(digits-1)) )[,1]
}
