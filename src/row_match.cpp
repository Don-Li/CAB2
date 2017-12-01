#include <Rcpp.h>
using namespace Rcpp;

//'@export row_match
// [[Rcpp::export]]
IntegerVector row_match( NumericMatrix mat, NumericVector ref ){

    int n = mat.nrow();
    std::vector<double> return_(0);

   for ( int i = 0; i < n; i ++ ){
       if ( is_true( all( mat(i,_) == ref ) ) ){
           return_.push_back(i+1);
       }
   }

    return( wrap( return_ ) );
    }

//'@export row_match1
// [[Rcpp::export]]
IntegerVector row_match1( NumericMatrix mat, NumericVector ref ){

    int n = mat.nrow();
    std::vector<double> return_(0);

   for ( int i = 0; i < n; i ++ ){
       if ( is_true( all( mat(i,_) == ref ) ) ){
           return_.push_back(i+1);
            break;
       }
   }

    return( wrap( return_ ) );
}
