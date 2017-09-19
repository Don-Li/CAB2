#### Count things ####

#' Factorial counts
#'
#' Count the number of events within segments of the event record separated by \code{break_labels} and initiated by \code{reset_labels}.
#'
#' @param event A character vector of events.
#' @param break_labels A character vector of break events.
#' @param reset_labels A character vector of reset events.
#' @param event_labels A character vector of events to tabulate.
#' @param max_breaks An integer specifying the number of break events within a segment of the event record.
#'
#' @usage factorial_counts( event, time, break_label, reset_label, event_labels, max_rfts )
#'
#' @details
#' \code{factorial_counts} counts the number of events in \code{event_labels} that are in the event record, in segments that are initiated by  \code{reset_labels} and separated by \code{event_labels}. For example, consider a multiple schedule that lasts 10 reinforcer deliveries (\code{rft}), where each component is initiated by a stimulus change (\code{comp_start}). \code{factorial_counts()} could be used to compute the number of responses within each inter-reinforcer interval for each component. See examples.
#'
#' @return
#' A \code{n x m} matrix, where \code{n} is \code{max_breaks} while \code{m} is the number of event types in \code{event_labels}.
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
#' }
#'
#' @rdname factorial_counts
#' @name factorial_counts
NULL







