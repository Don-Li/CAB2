//[[Rcpp:depends(RccpArmadillo)]]

#include <RcppArmadillo.h>
using namespace Rcpp ;

//'@export factorial_time_bin_2_
// [[Rcpp::export]]
List factorial_time_bin_2_(
        CharacterVector event, NumericVector time,
        CharacterVector break_labels, CharacterVector reset_labels,
        CharacterVector event_labels, int max_bin, double bin_resolution, double offset = 0){

    IntegerVector rft_match = match( event, break_labels );
    IntegerVector component_start_match = match( event, reset_labels );
    IntegerVector resp_match = match( event, event_labels ) - 1;

    int n_bins = floor( max_bin / bin_resolution );

    int response_len = event_labels.length();

    arma::umat response_matrix1( n_bins, response_len, arma::fill::zeros );
    arma::umat response_matrix2( n_bins, response_len, arma::fill::zeros );

    double rft_time = 0;
    double response_time = 0;

    int last_food_loc = 0;
    int component_rft = 0;
    offset = floor( offset / bin_resolution );

    for ( int i = 0; i < event.length(); i ++ ){
        if ( component_start_match(i) != NA_INTEGER ){
            component_rft = 0;
        }
        if ( rft_match(i) != NA_INTEGER ){
            component_rft += 1;
            rft_time = time(i);
            last_food_loc = rft_match(i);
        }
        if ( component_rft > 0 ){
            if ( resp_match(i) != NA_INTEGER ){
                response_time = floor( ( time(i) - rft_time - offset )/bin_resolution );
                if ( response_time < n_bins ){
                    if ( last_food_loc == 1 ){
                        response_matrix1( response_time, resp_match(i) ) ++;
                    }
                    else{
                        response_matrix2( response_time, resp_match(i) ) ++;
                    }
                }
            }
        }
    }
    return( List::create( response_matrix1, response_matrix2 ) );
}

//'@export factorial_time_bin_2
// [[Rcpp::export]]
List factorial_time_bin_2(
        NumericVector event, NumericVector time,
        NumericVector break_labels, NumericVector reset_labels,
        NumericVector event_labels, int max_bin, double bin_resolution, double offset = 0){

    IntegerVector rft_match = match( event, break_labels );
    IntegerVector component_start_match = match( event, reset_labels );
    IntegerVector resp_match = match( event, event_labels ) - 1;

    int n_bins = floor( max_bin / bin_resolution );

    int response_len = event_labels.length();

    arma::umat response_matrix1( n_bins, response_len, arma::fill::zeros );
    arma::umat response_matrix2( n_bins, response_len, arma::fill::zeros );

    double rft_time = 0;
    double response_time = 0;

    int last_food_loc = 0;
    int component_rft = 0;

    for ( int i = 0; i < event.length(); i ++ ){
        if ( component_start_match(i) != NA_INTEGER ){
            component_rft = 0;
        }
        if ( rft_match(i) != NA_INTEGER ){
            component_rft += 1;
            rft_time = time(i);
            last_food_loc = rft_match(i);
        }
        if ( component_rft > 0 ){
            if ( resp_match(i) != NA_INTEGER ){
                response_time = floor( ( time(i) - rft_time - offset )/bin_resolution );
                if ( response_time < n_bins ){
                    if ( last_food_loc == 1 ){
                        response_matrix1( response_time, resp_match(i) ) ++;
                    }
                    else{
                        response_matrix2( response_time, resp_match(i) ) ++;
                    }
                }
            }
        }
    }
    return( List::create( response_matrix1, response_matrix2 ) );
}

//'@export factorial_time_bin_
// [[Rcpp::export]]
arma::imat factorial_time_bin_(
        CharacterVector event, NumericVector time,
        CharacterVector break_labels, CharacterVector reset_labels,
        CharacterVector event_labels, int max_bin, double bin_resolution,
        double offset = 0
        ){

    IntegerVector break_match = match( event, break_labels )-1;
    IntegerVector reset_match = match( event, reset_labels )-1;
    IntegerVector event_match = match( event, event_labels )-1;

    int n_bins = floor( max_bin / bin_resolution );

    int n_events = event.length();

    int event_len = event_labels.length();
    int break_len = break_labels.length();

    arma::imat response_matrix( n_bins, event_len*break_len, arma::fill::zeros );

    double break_time = 0;
    double response_time = 0;

    int last_break_index = 0;
    int last_event_index = 0;
    int reset = 0;

    for ( int i = 0; i < n_events; i ++ ){
        if ( reset_match(i) != NA_INTEGER ){
            reset = 0;
        }
        if ( break_match(i) != NA_INTEGER ){
            reset += 1;
            break_time = time(i);
            last_break_index = break_match(i);
        }
        if ( reset > 0 ){
            if ( event_match(i) != NA_INTEGER ){
                response_time = time(i) - break_time - offset;
                last_event_index = event_match(i);
                if ( response_time < n_bins ){
                    response_matrix( response_time, last_event_index+last_break_index*event_len ) ++;
                }
            }
        }
    }

    return(response_matrix);

}

//'@export factorial_time_bin
// [[Rcpp::export]]
arma::imat factorial_time_bin(
        NumericVector event, NumericVector time,
        NumericVector break_labels, NumericVector reset_labels,
        NumericVector event_labels, int max_bin, double bin_resolution,
        double offset = 0
        ){

    IntegerVector break_match = match( event, break_labels )-1;
    IntegerVector reset_match = match( event, reset_labels )-1;
    IntegerVector event_match = match( event, event_labels )-1;

    int n_bins = floor( max_bin / bin_resolution );

    int n_events = event.length();

    int event_len = event_labels.length();
    int break_len = break_labels.length();

    arma::imat response_matrix( n_bins, event_len*break_len, arma::fill::zeros );

    double break_time = 0;
    double response_time = 0;

    int last_break_index = 0;
    int last_event_index = 0;
    int reset = 0;

    for ( int i = 0; i < n_events; i ++ ){
        if ( reset_match(i) != NA_INTEGER ){
            reset = 0;
        }
        if ( break_match(i) != NA_INTEGER ){
            reset += 1;
            break_time = time(i);
            last_break_index = break_match(i);
        }
        if ( reset > 0 ){
            if ( event_match(i) != NA_INTEGER ){
                response_time = time(i) - break_time - offset;
                last_event_index = event_match(i);
                if ( response_time < n_bins ){
                    response_matrix( response_time, last_event_index+last_break_index*event_len ) ++;
                }
            }
        }
    }

    return(response_matrix);

}
