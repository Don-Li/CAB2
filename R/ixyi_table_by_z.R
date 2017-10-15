#' @include RcppExports.R
NULL

#' Tabulate inter-event-intervals on subsets
#'
#' Count the number of ixyi as a fucntion of a different variable. This is useful for computing things like IRTs per inter-reinforcer interval.
#'
#' @usage ixyi_table_by_z( event, time, x_events, y_events, reset_labels, break_labels, bin_labels,  max_bins )
#'
#' @param time A numeric vector of times.
#' @param event A character vector of events.
#' @param x_events A character vector naming the event that starts the inter-event interval.
#' @param y_events A character vector naming the event that terminates the inter-event interval.
#' @param break_labels A character vector of events that break the inter-event interval.
#' @param bin_labels A character vector of the events that bin the inter-event interval.
#' @param max_bins An integer for the number of bins
#'
#' @return
#' Returns a \code{n x m} matrix, where the \code{n} rows define the bins and the \code{m} columns define combinations of the \code{x_events} and \code{y_events}. For example, if we wanted to tabulate the types of IRTs between two alternatives (L and R) for 10 inter-reinforcer intervals, the columns would be ordered (LL, LR, RL, RR) and the rows would be ordered 1 to 10.
#'
#' @rdname ixyi_table_by_z
#' @name ixyi_table_by_z

NULL
