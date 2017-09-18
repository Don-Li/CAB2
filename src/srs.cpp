// [[Rcpp::depends(RcppArmadillo)]]

#include <RcppArmadillo.h>
using namespace Rcpp;

//'@export srs
// [[Rcpp::export]]
NumericMatrix srs( int choose_max, int repeats, int sample_size, bool replace ){

    NumericMatrix return_matrix( sample_size, repeats );

    for ( int i = 0; i < repeats; i++ ){
        return_matrix.column(i) = sample( choose_max, sample_size, replace );
    }

    return( return_matrix );
}
