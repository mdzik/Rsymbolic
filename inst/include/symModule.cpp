
using namespace Rcpp;
RCPP_EXPOSED_CLASS(sSymbol)

RCPP_MODULE(class_sSymbol) {


    class_<sSymbol>("sSymbol")

    .constructor<String>()
    .constructor<double>()
    .constructor<int>()    
  //  .constructor<Symbolic>()

    .method("toC", &sSymbol::toC)
    .method("attrs", &sSymbol::toC)
    ;
}