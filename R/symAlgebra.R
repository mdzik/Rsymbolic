#' Package wrapper for SymbolicC++ library
#'
#' @docType package
#' @name symAlgebra-package
#' @rdname symAlgebra-package
#' @useDynLib symAlgebra
#' @importFrom Rcpp evalCpp
NULL

#' Class that represents a symbolic expression
#' 
#' @slot pointer Pointer to a Symbolic object from SymbolicC++
#' @exportClass sAlg
sAlg = setClass( "sAlg", representation( pointer = "externalptr" ) )

#' @export
as.sAlg = function(x) {
  if (inherits(x,"sAlg")) return(x)
  if (inherits(x,"character")) return(sAlg_fromString(x))
  if (inherits(x,"integer")) return(sAlg_fromInt(x))
  if (inherits(x,"numeric")) return(sAlg_fromDouble(x))
  stop(paste("Cannot convert ",class(x),"to sAlg"))
}

#' @export
"Ops.sAlg" <- function(e1,e2){
  e1 = as.sAlg(e1)
  e2 = as.sAlg(e2)
  if(missing(e2)){
    e1.op <- switch(.Generic,
                    "+" = e1,
                    "-" = e1*(-1),
                    stop(paste0("Unary operator \"",.Generic,"\""," is undefined for class \"sAlg\""))
    )
    return(e1.op)
  }
  e1.op.e2 <- {
    switch(.Generic,
           "+" = sAlg_plus(e1,e2),
           "-" = sAlg_minus(e1,e2,-1),
           "*" = sAlg_times(e1,e2),
           "/" = sAlg_divide(e1,e2),
           "^" = sAlg_power(e1,e2),
           "==" = sAlg_equal(e1,e2),
           stop(paste("Binary operator \"",.Generic,"\""," is undefined for class \"matrix.csr\"",sep=""))
    )
  }
  return(e1.op.e2)
}
