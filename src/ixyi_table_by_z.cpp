// [[Rcpp::depends(RcppArmadillo)]]
#include "RcppArmadillo.h"
using namespace Rcpp;

//'@export ixyi_table_by_z
// [[Rcpp::export]]
arma::imat ixyi_table_by_z(
    CharacterVector event,
    CharacterVector x_events, CharacterVector y_events,
    CharacterVector reset_labels, CharacterVector break_labels,
    CharacterVector bin_labels, int max_bins ){

    int n_x_types = x_events.length();
    int n_y_types = y_events.length();

    IntegerVector break_match = match( event, break_labels );
    IntegerVector match_x = match( event, x_events ) - 1;
    IntegerVector match_y = match( event, y_events ) - 1;
    IntegerVector reset_match = match( event, reset_labels );
    IntegerVector bin_match = match( event, bin_labels );

    arma::imat container( max_bins, n_x_types*n_y_types, arma::fill::zeros );

    int i_max = event.length();
    int x_code = 0;
    int y_code = 0;
    int ixyi_code = 0;
    bool got_x = false;
    int bin = -1;

    for ( int i = 0; i < i_max; i ++ ){

        if ( reset_match(i) != NA_INTEGER ){
            bin = 0;
            continue;
        }

        if ( break_match(i) != NA_INTEGER ){
            got_x = false;
            continue;
        }

        if ( bin_match(i) != NA_INTEGER ){
            bin ++;
            continue;
        }

        if ( bin >= 0 ){
            if ( !got_x ){
                if ( match_x(i) != NA_INTEGER ){
                    x_code = match_x(i);
                    got_x = true;
                }
            }

            else{
                if ( match_y(i) != NA_INTEGER ){
                    y_code = match_y(i);
                    ixyi_code = n_x_types * x_code + y_code;
                    container( bin, ixyi_code ) ++;
                    got_x = false;
                }

                if ( match_x(i) != NA_INTEGER ){
                    x_code = match_x(i);
                    got_x = true;
                }
            }
        }
    }

    return( container );
}
