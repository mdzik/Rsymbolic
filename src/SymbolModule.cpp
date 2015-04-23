#include "symbolicc++.h"
#include <Rcpp.h>
using namespace Rcpp ;
#include "Symbol.h"

// [[Rcpp::interfaces(r,cpp)]]

    Symbolic & sSymbol::val() {
      return *pval;
    }
    const Symbolic & sSymbol::val() const {
      return *pval;
    }
    sSymbol::sSymbol(const Symbolic& val_):pval(new Symbolic(val_)) {};
    sSymbol::sSymbol(Rcpp::String val_): pval(new Symbolic(std::string(val_))) {};  
    template <typename T>
    sSymbol::sSymbol(T val_): pval(new Symbolic(val_)) {};    
    template sSymbol::sSymbol<int>(int);
    template sSymbol::sSymbol<double>(double);
    template <> sSymbol::sSymbol<SEXP>(SEXP val_):pval(as< XPtr<Symbolic> >(S4(val_).slot("pointer"))) {
      
    };
    
    sSymbol::~sSymbol() {
    }
    
    sSymbol::operator SEXP() const {
      S4 ret("sAlg");
      ret.slot("pointer") = pval;
      return ret;
    };
    
    std::string sSymbol::toC(){
      std::stringstream v;
      v << std::scientific;
      v.precision(16);
      v << val();
      return v.str();
    };
    



// [[Rcpp::export]]
sSymbol sAlg_fromString(Rcpp::String v) {
  return sSymbol(v);
}

// [[Rcpp::export]]
sSymbol sAlg_fromDouble(double v) {
  return sSymbol(v);
}

// [[Rcpp::export]]
sSymbol sAlg_fromInt(int v) {
  return sSymbol(v);
}

// [[Rcpp::export]]
sSymbol sAlg_plus(const sSymbol& x, const sSymbol& y) {
//  Rcpp::XPtr<sSymbol> ptr1(x);
//  Rcpp::XPtr<sSymbol> ptr2(y);
//  std::cout << ptr1->val() + ptr2->val();
//  Rcpp::XPtr<sSymbol> ptr( new sSymbol(ptr1->val() + ptr2->val()), true );
  return x.val() + y.val();
}
// [[Rcpp::export]]
sSymbol sAlg_minus(const sSymbol& x, const sSymbol& y) {
  return x.val() - y.val();
}
// [[Rcpp::export]]
sSymbol sAlg_times(const sSymbol& x, const sSymbol& y) {
  return x.val() * y.val();
}
// [[Rcpp::export]]
sSymbol sAlg_divide(const sSymbol& x, const sSymbol& y) {
  return x.val() / y.val();
}
// [[Rcpp::export]]
sSymbol sAlg_power(const sSymbol& x, const sSymbol& y) {
  return x.val() ^ y.val();
}
// [[Rcpp::export]]
bool sAlg_equal(sSymbol& x, sSymbol& y) {
  return x.val() == y.val();
}

// [[Rcpp::export]]
std::string sAlg_ToC(sSymbol& x) {
  return x.toC();
}
