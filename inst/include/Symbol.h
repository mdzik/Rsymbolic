#include <stdio.h>
#include <string>
#include <sstream>

class Symbolic;

class sSymbol {
  public:
    sSymbol(const Symbolic& val_);
    sSymbol(Rcpp::String val_);  
    template <typename T> sSymbol(T val_);
    ~sSymbol();
    std::string toC();
    
    Symbolic * pval;
    Symbolic & val();
    const Symbolic & val() const;
};


