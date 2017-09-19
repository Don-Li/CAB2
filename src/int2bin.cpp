#include <Rcpp.h>
using namespace Rcpp;

//'@export int2bin
// [[Rcpp::export]]
IntegerVector int2bin( int digits, IntegerVector integers ){
    IntegerMatrix stack(digits, integers.length() );
    for ( int integer_n = 0; integer_n < integers.length(); integer_n++ ){
        int temp_n = integers[ integer_n ];
        int i = 0;
        while ( ( temp_n != 0 )){
            int remainder = temp_n % 2;
            stack(i++, integer_n) = remainder;
            temp_n /= 2;
        }
    }
    return( stack );
}
