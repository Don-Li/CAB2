#### Simple random sampling

#' Sampling with and without replacement
#'
#' Repeated sampling with and without replacement.
#'
#' @param choose_max An integer enumerating the number of objects to sample from.
#' @param repeats An integer specifying how many times to do the sampling.
#' @param sample_size An integer specifying how many objects to sample per repeat.
#' @param replace A logical. Sample with or without replacement.
#'
#' @usage srs( choose_max, repeats, sample_size, replace )
#'
#' @return
#' Returns a matrix of indices that were sampled. Each column contains sampled objects for one round of sampling. Each row contains the ith sample in a round of sampling
#'
#' @details
#' This function is for repeated sampling. This is equivalent to \code{sample.int} when \code{repeats} is \code{1} and the sampling probabilities are uniform. However, because the implementation is in C++, we can do multiple samples faster than if we looped with \code{sample.int}.
#'
#' @examples
#' \dontrun{
#' # Sample 5 elements from 1:10 with replacement
#' sample1 = srs( 10, 1, 5, T )
#' # Sample 5 elements from 1:10 with replacement 3 times
#' sample2 = srs( 10, 3, 5, T )
#'
#' # Sample 9 elements from 1:10 without replacement
#' sample3 = srs( 10, 1, 9, F )
#' # Sample 9 elements from 1:10 without replacement 3 times
#' # Notice no repeats down the columns because each column is one round of sampling
#' sample4 = srs( 10, 3, 9, F )
#'
#' # Note that srs() is equivalent to a loop of sample.int()
#' sample1a = sample.int( 10, 5, TRUE )
#' sample1b = sample.int( 10, 5, FALSE )
#'
#' # Speed comparisons
#' # Make a byte code function
#' R_sample = function( choose_max, repeats, sample_size, replace ){
#'     x = matrix( NaN, sample_size, repeats )
#'     for ( i in 1:repeats ){
#'         x[ , i ] = sample.int( choose_max, sample_size, replace )
#'     }
#'     x
#' }
#' R_sample = compiler::cmpfun( R_sample, options = list(optimize = 3) )
#'
#' # Sampling with replacement
#' microbenchmark::microbenchmark(
#'     time1 = srs( 10, 100, 5, T ),
#'     time2 = R_sample( 10, 100, 5, T )
#' )
#'
#' # Sampling without replacement
#' microbenchmark::microbenchmark(
#'     time1 = srs( 10, 100, 5, F ),
#'     time2 = R_sample( 10, 100, 5, F )
#' )
#'
#' }
#'
#' @name srs
#' @rdname srs
#'

NULL
