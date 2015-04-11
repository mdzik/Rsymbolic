library("Rcpp")
library("gvector")

Sys.setenv("PKG_CXXFLAGS"=paste("-I", getwd(),'/src/symboliccpp', sep=""))

sourceCpp("src/SymbolModule.cpp")

source("R/SymbolClass.R")

sC <- function(x) {x$toC()}

sC.gvector = function(x,...) gapply(x, sC, ..., simplify=TRUE)


# from polyAlgebra package by Lukasz Laniewski
spAlg <- function(x) {
  if (is.character(x)) {
    sS(x) 
  } else {
    sN(x) 
  }
}

# from polyAlgebra package by Lukasz Laniewski
#' @export
sPV = function(x,...,sep="") {
  if (is.character(x)) {
    x = paste(x,...,sep=sep);
  } else {
    x = x
  }
  new("gvector",vec=lapply(x,spAlg),dim=length(x))
}

a = sS('a')
b = sS('b')

sC(a+b+16*a/b)
sC((a+b+16*a/b)/(a))
sC((a+b+16*a/b)/(a+2*a))
sC(a^2/4+b/a^-1)
sC(a^2/4)

v0 = sPV(c('c','d'))
sC(sum(v0))

gapply(v0/c(a,b), sC, simplify=T)
