// [[Rcpp::depends(RcppArmadillo)]]
#include "RcppArmadillo.h"
using namespace Rcpp;

//'@export factorial_counts
// [[Rcpp::export]]
arma::umat factorial_counts(
        CharacterVector event,
        CharacterVector break_labels,
        CharacterVector reset_labels,
        CharacterVector event_labels,
        int max_breaks ){

    // Indicators for the event types
    IntegerVector break_match = match( event, break_labels );
    IntegerVector reset_start_match = match( event, reset_labels );
    IntegerVector event_match = match( event, event_labels );

    // Counters
    int n_resp_types = event_labels.length();
    int i_max = event.length();
    int component_rft = 0;

    // Contains the counts. Rows for the IRI, cols for response types
    arma::umat return_matrix = arma::umat( max_breaks, n_resp_types, arma::fill::zeros );

    for ( int i = 0; i < i_max; i ++ ){

        // Check for new component
        if ( reset_start_match(i) != NA_INTEGER ){
            component_rft = 0;
        }

        // Check for rft
        if ( break_match(i) != NA_INTEGER ){
            component_rft += 1;
            if ( component_rft > max_breaks ){
                stop( "More rft than maximum" );
            }
        }

        // Check if it is a response
        if ( event_match(i) != NA_INTEGER ){
            // match() indexes from 1, subtract 1
            return_matrix( component_rft, event_match(i)-1 ) += 1;
        }
    }

    return( return_matrix );
}
