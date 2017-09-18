// [[Rcpp::depends(RcppArmadillo)]]
#include "RcppArmadillo.h"
using namespace Rcpp;

//'@export ixyi
//'@rdname ixyi
// [[Rcpp::export]]
List ixyi( CharacterVector event, NumericVector time, CharacterVector x_events, CharacterVector y_events, CharacterVector break_events ){

    // Indicators for the event types
    IntegerVector break_indicators = match( event, break_events );
    // We are using match_x and match_y to index C++ arrays, so subtract 1
    IntegerVector match_x = match( event, x_events ) - 1;
    IntegerVector match_y = match( event, y_events ) - 1;

    // Counters
    int i_max = event.length();
    int n_x_types = x_events.length();

    double x_time = 0;
    double y_time = 0;
    int x_code = 0;
    int y_code = 0;
    int ixyi_code = 0;
    bool got_x = false;

    // Return objects
    std::vector<double> ixyi_container(0);
    std::vector<int> ixyi_indicator(0);
    std::vector<int> ixyi_counter( n_x_types * y_events.length() );

    for ( int i = 0; i < i_max; i ++ ){

        // If we do not have an x event stored, check for an x event
        if ( !got_x ){
            if ( match_x(i) != NA_INTEGER ){
                x_code = match_x(i);
                x_time = time(i);
                got_x = true;
            }

        } // Else, check for a y event, check if it is also an x event, check for breaking events
        else{
            // Check for y event
            if ( match_y(i) != NA_INTEGER ){
                y_code = match_y(i);
                y_time = time(i);
                ixyi_container.push_back( y_time - x_time );
                ixyi_code = n_x_types * x_code + y_code;
                ixyi_indicator.push_back( ixyi_code );
                ixyi_counter[ ixyi_code ] ++;
                got_x = false;
            }
            // Check if event was also an x event
            if ( match_x(i) != NA_INTEGER ){
                x_code = match_x(i);
                x_time = time(i);
                got_x = true;
            }
            // Check for breaking events
            if ( break_indicators(i) != NA_INTEGER ){
                got_x = false;
            }
        }
    }

    List return_list = List::create( Named("ixyi") = ixyi_container, Named("ixyi_type") = ixyi_indicator, Named("ixyi_counts") = ixyi_counter );
    return( return_list );
}
