#### Count things ####

#' Factorial counts
#'
#' Count the number of events within segments of the event record separated by \code{break_labels} and initiated by \code{reset_labels}.
#'
#' @usage factorial_counts( event, break_labels, reset_labels, event_labels, max_breaks )
#' @usage factorial_time_bin_2( event, time, break_labels, reset_labels,
#'     event_labels, max_bin, bin_resolution, offset )
#'
#' @param event A character vector of events.
#' @param break_labels A character vector of break events.
#' @param reset_labels A character vector of reset events.
#' @param event_labels A character vector of events to tabulate.
#' @param max_breaks An integer specifying the number of break events within a segment of the event record.
#' @param time A numeric vector of times.
#' @param max_bin An integer specifying the time at the last time bin.
#' @param bin_resolution A double specifying the bin resolution.
#' @param offset A double specifying the offset (see examples).'
#'
#' @details
#' \code{factorial_counts} counts the number of events in \code{event_labels} that are in the event record, in segments that are initiated by \code{reset_labels} and separated by \code{event_labels}. For example, consider a multiple schedule that lasts 10 reinforcer deliveries (\code{rft}), where each component is initiated by a stimulus change (\code{comp_start}). \code{factorial_counts()} could be used to compute the number of responses within each inter-reinforcer interval for each component. See examples.
#'
#' \code{factorial_time_bin_2} counts the number of events in \code{event_labels} for two types of events that are in the event record, in segments initated by \code{reset_labels} and separated by the two types of events in \code{event_labels}. Consider a concurrent VI VI schedule run inside of a mixed schedule like that of Davison and Baum (2000).
#'
#' @return
#' A \code{n x m} matrix, where \code{n} is \code{max_breaks} while \code{m} is the number of event types in \code{event_labels}.
#'
#' \code{factorial_time_bin_2} bins events in time bins. The time bins are represented as a \code{ n x 2 } matrix, where \code{n} is the number of bins and each column holds the counts for each element of \code{event_labels}. One matrix of time bins is constructed for each element of \code{break_labels}. The combined result is returned as a list.
#'
#' @seealso
#' \link{ixyi_table_by_z} for tabulating ixyi's as a function of another variable.
#'
#' @examples
#' \dontrun{
#' # Make an event record
#' event = c(
#'     "comp_start",
#'     rep( c( "resp1", "resp2" ), each = 5 ),
#'     "rft",
#'     rep( c( "resp2", "resp1" ), each = 5 ),
#'     "rft",
#'     "comp_start",
#'     rep( c( "resp2", "resp1" ), each = 5 ),
#'     "rft",
#'     "resp1"
#'     )
#' #In the zeroth IRI there were 10 instances of "resp1" and 10 instances of "resp2"
#' #In the first IRI there were 6 instances of "resp1" and 5 of "resp2"
#' counts = factorial_counts( event, "rft", "comp_start", c("resp2", "resp1"), 2 )
#' #Note that the order of the columns is c("resp2", "resp1")
#'
#' # If we want to ignore the reinforcer deliveries to get the total number of each type of response
#' counts2 = factorial_counts( event, "rft", "comp_start", c("resp2", "resp1"), 2 )
#' # We can use a more efficient function for this though.
#'
#' # Bin events into time bins
#' set.seed(1)
#' times = runif( 50 )
#' rft_deliveries = c( 5, 10, 20, 40 )
#' left_rft = rft_deliveries[ c(1,3) ]
#' right_rft = rft_deliveries[ c(2,4) ]
#' events = sample( c("respL", "respR"), 50, TRUE )
#' events[ left_rft ] = "rftL"
#' events[ right_rft ] = "rftR"
#' events[ 25 ] = "comp_start"
#'
#' times[ rft_deliveries+1 ] = times[ rft_deliveries+1 ] + 1
#' times = cumsum(times)
#' counter = factorial_time_bin_2(
#'    event = events, time = times,
#'    break_labels = c("rftL", "rftR"), reset_labels = "comp_start",
#'    event_labels = c("respL","respR"), max_bin = 5,
#'    bin_resolution = 1, offset = 1
#' )
#'
#' # Make a preference pulse (see Davison & Baum 2002)
#' pp = lapply( counter, function(x) log( x[,1]/x[,2] ) )
#' }
#'
#' @references
#' Davison, M., & Baum, W. M. (2000). Choice in a variable environment: Every reinforcer counts. Journal of the Experimental Analysis of Behavior, 74(1), 1-24. \href{https://doi.org/10.1901/jeab.2000.74-1}{https://doi.org/10.1901/jeab.2000.74-1}
#'
#' @rdname factorial_counts
#' @name factorial_counts
#' @aliases factorial_time_bin_2
#' @aliases preference_pulse
NULL







