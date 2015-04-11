#include "symbolicc++.h"
#include <Rcpp.h>
using namespace Rcpp ;
#include "Symbol.h"


RCPP_EXPOSED_CLASS(sSymbol)


RCPP_MODULE(class_sSymbol) {


    class_<sSymbol>("sSymbol")

    .constructor<String>()
    .constructor<double>()
    .constructor<int>()    
  //  .constructor<Symbolic>()
    .field_readonly("test", &sSymbol::test)

    .method("toC", &sSymbol::toC)
    .method("attrs", &sSymbol::toC)
    ;
}


// [[Rcpp::export]]
sSymbol sS(Rcpp::String v) {
  return sSymbol(v);
}

// [[Rcpp::export]]
sSymbol sN(double v) {
  return sSymbol(v);
}

// [[Rcpp::export]]
sSymbol sSymboloperator_plus(const sSymbol& x, const sSymbol& y) {
//  Rcpp::XPtr<sSymbol> ptr1(x);
//  Rcpp::XPtr<sSymbol> ptr2(y);
//  std::cout << ptr1->val + ptr2->val;
//  Rcpp::XPtr<sSymbol> ptr( new sSymbol(ptr1->val + ptr2->val), true );
  return x.val + y.val;
}
// [[Rcpp::export]]
sSymbol sSymboloperator_minus(const sSymbol& x, const sSymbol& y) {
  return x.val - y.val;
}
// [[Rcpp::export]]
sSymbol sSymboloperator_times(const sSymbol& x, const sSymbol& y) {
  return x.val * y.val;
}
// [[Rcpp::export]]
sSymbol sSymboloperator_divide(const sSymbol& x, const sSymbol& y) {
  return x.val / y.val;
}
// [[Rcpp::export]]
sSymbol sSymboloperator_power(const sSymbol& x, const sSymbol& y) {
  return x.val ^ y.val;
}
// [[Rcpp::export]]
bool sSymboloperator_equal(sSymbol& x, sSymbol& y) {
  return x.val == y.val;
}

