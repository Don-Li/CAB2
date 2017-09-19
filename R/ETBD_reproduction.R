#### ETBD reproduction

#' ETBD reproduction functions
#'
#' Functions for sampling and producing parents for the Evolutionary Theory of Behaviour Dynamics.
#'
#' @section Bitwise reproduction:{
#'     \subsection{Usage}{
#'         \code{EBD_BR( fathers, mothers )}
#'     }
#'     \subsection{Arguments}{
#'         \describe{
#'             \item{\code{fathers}}{A numeric matrix}
#'             \item{\code{mothers}}{A numeric matrix}
#'         }
#'     }
#'     \subsection{Details}{
#'         Bitwise reproduction goes through each index for each population member and samples from either the mother or the father at each index.
#'         The \code{fathers} and \code{mothers} are \code{n x m} matrices, where \code{n} is the number of bits for each population member and \code{m} is the population size. The underlying implementation generates a \code{n x m} random matrix of binary elements (\code{X}). The child matrix is then constructed by \code{ fathers * X + mothers * 1-X }.
#'     }
#'     \subsection{Value}{
#'         Returns the new population as a numeric matrix.
#'     }
#' }
#'
#' @section Bitwise reproduction and random selection:{
#'     \subsection{Usage}{
#'         \code{EBD_RS_BR( parents )}
#'     }
#'     \subsection{Arguments}{
#'         \describe{
#'             \item{\code{parents}}{A numeric matrix}
#'         }
#'     }
#'     \subsection{Details}{
#'         Same as \code{EBD_BR} except that it generates the \code{fathers} and \code{mothers} by uniformly selecting parents without replacement.
#'     }
#'     \subsection{Value}{
#'         Returns the new population as a numeric matrix.
#'     }
#' }
#'
#' @rdname ETBD_reproduction
#' @aliases bitwise_reproduction
#' @aliases bitwise_reproduction_random_reproduction
#' @name ETBD_reproduction
#' @examples
#' \dontrun{
#' # Bitwise reproduction with the parents already selected
#' # Behaviours with 10 bits
#' fathers = matrix( 1, nrow = 10, ncol = 1 )
#' mothers = matrix( 0, nrow = 10, ncol = 1 )
#'
#' # Make a child
#' new_population = EBD_BR( fathers, mothers )
#'
#' # Larger population. 10 behaviours, each with 10 bits.
#' fathers = matrix( 1, nrow = 10, ncol = 10 )
#' mothers = matrix( 0, nrow = 10, ncol = 10 )
#'
#' # New population
#' new_population = EBD_BR( fathers, mothers )
#'
#' # Bitwise reproduction with uniform selection
#' new_population2 = EBD_RS_BR( new_population )
#' }

NULL
