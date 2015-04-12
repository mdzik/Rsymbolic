#include <stdio.h>
#include <string>
#include <sstream>
/**
class sNumber {
  public:
    
   // sSymbol(const Symbolic& _val): val(_val){};
    //template <typename T>
    //sSymbol(T val_): val(val_){};
    //sNumber(const Symbolic& val_): val(val_) {};
    
    //sSymbol(std::string val_): val(val_) {};
    
    sNumber(double val_): val(std::string(val_)) {};    
    
    std::string toC(){
      std::stringstream v;
      v << val;
      return v.str();
    };
    
    double val;
  
};
**/
class sSymbol {
  public:
    
   // sSymbol(const Symbolic& _val): val(_val){};
    //template <typename T>
    //sSymbol(T val_): val(val_){};
    sSymbol(const Symbolic& val_): val(val_) {};
    
    //sSymbol(std::string val_): val(val_) {};
    
    sSymbol(Rcpp::String val_): val(std::string(val_)) {};  
    template <typename T>
    sSymbol(T val_): val(val_) {};    
    
    std::string toC(){
      std::stringstream v;
      v << std::scientific;
      v.precision(16);
      v << val;
      return v.str();
    };
    
    Symbolic val;
    int test;
    
  
};


