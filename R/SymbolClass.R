#sSymbol <- setRcppClass("sSymbol")

setMethod("+", signature(e1=sSymbol, e2=sSymbol), function(e1, e2) { sSymboloperator_plus(e1,e2) }, where=.GlobalEnv)
setMethod("+", signature(e1=sSymbol, e2="numeric"), function(e1, e2) { sSymboloperator_plus(e1,sN(e2)) }, where=.GlobalEnv)
setMethod("+", signature(e1="numeric", e2=sSymbol), function(e1, e2) { sSymboloperator_plus(e2,sN(e1)) }, where=.GlobalEnv)

setMethod("-", signature(e1=sSymbol, e2=sSymbol), function(e1, e2) { sSymboloperator_minus(e1,e2) }, where=.GlobalEnv)
setMethod("-", signature(e1=sSymbol, e2="numeric"), function(e1, e2) { sSymboloperator_minus(e1,sN(e2)) }, where=.GlobalEnv)
setMethod("-", signature(e1="numeric", e2=sSymbol), function(e1, e2) { sSymboloperator_minus(e2,sN(e1)) }, where=.GlobalEnv)

setMethod("*", signature(e1=sSymbol, e2=sSymbol), function(e1, e2) { sSymboloperator_times(e1,e2) }, where=.GlobalEnv)
setMethod("*", signature(e1=sSymbol, e2="numeric"), function(e1, e2) { sSymboloperator_times(e1,sN(e2)) }, where=.GlobalEnv)
setMethod("*", signature(e1="numeric", e2=sSymbol), function(e1, e2) { sSymboloperator_times(e2,sN(e1)) }, where=.GlobalEnv)

setMethod("/", signature(e1=sSymbol, e2=sSymbol), function(e1, e2) { sSymboloperator_divide(e1,e2) }, where=.GlobalEnv)
setMethod("/", signature(e1=sSymbol, e2="numeric"), function(e1, e2) { sSymboloperator_divide(e1,sN(e2)) }, where=.GlobalEnv)
setMethod("/", signature(e1="numeric", e2=sSymbol), function(e1, e2) { sSymboloperator_divide(e2,sN(e1)) }, where=.GlobalEnv)

setMethod("^", signature(e1=sSymbol, e2=sSymbol), function(e1, e2) { sSymboloperator_power(e1,e2) }, where=.GlobalEnv)
setMethod("^", signature(e1=sSymbol, e2="numeric"), function(e1, e2) { sSymboloperator_power(e1,sN(e2)) }, where=.GlobalEnv)
setMethod("^", signature(e1="numeric", e2=sSymbol), function(e1, e2) { sSymboloperator_power(e2,sN(e1)) }, where=.GlobalEnv)

setMethod("==", signature(e1=sSymbol, e2=sSymbol), function(e1, e2) { sSymboloperator_equal(e1,e2) }, where=.GlobalEnv)
setMethod("==", signature(e1=sSymbol, e2="numeric"), function(e1, e2) { sSymboloperator_equal(e1,sN(e2)) }, where=.GlobalEnv)
setMethod("==", signature(e1="numeric", e2=sSymbol), function(e1, e2) { sSymboloperator_equal(e2,sN(e1)) }, where=.GlobalEnv)
