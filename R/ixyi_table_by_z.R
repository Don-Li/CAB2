#' @include RcppExports.R
NULL

#' Tabulate inter-event-intervals on subsets
#'
#' Count the number of ixyi as a fucntion of a different variable. This is useful for computing things like IRTs per inter-reinforcer interval.
#'
#' ixyi_table_by_z() is provded for numeric arguments. ixyi_table_by_z_() is used when \code{event}, \code{x_events}, \code{y_events}, \code{reset_labels}, \code{break_labels}, \code{bin_labels} are character vectors.
#'
#' @usage ixyi_table_by_z( event, x_events, y_events, reset_labels, break_labels
#'     , bin_labels, max_bins )
#' @usage ixyi_table_by_z_( event, x_events, y_events, reset_labels, break_labels
#'     , bin_labels, max_bins )
#'
#' @param event A numeric vector of events.
#' @param x_events A numeric vector naming the event that starts the inter-event interval.
#' @param y_events A numeric vector naming the event that terminates the inter-event interval.
#' @param reset_labels A numeric vector naming events that reset the binning counter.
#' @param break_labels A numeric vector of events that break the inter-event interval.
#' @param bin_labels A numeric vector of the events that bin the inter-event interval.
#' @param max_bins An integer for the number of bins
#'
#' @return
#' Returns a \code{n x m} matrix, where the \code{n} rows define the bins and the \code{m} columns define combinations of the \code{x_events} and \code{y_events}. For example, if we wanted to tabulate the types of IRTs between two alternatives (L and R) for 10 inter-reinforcer intervals, the columns would be ordered (LL, LR, RL, RR) and the rows would be ordered 1 to 10.
#'
#' @rdname ixyi_table_by_z
#' @name ixyi_table_by_z
NULL
