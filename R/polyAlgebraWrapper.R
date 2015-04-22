NULL

#' @export
PV = function(x,...,sep="") {
  if (is.character(x)) {
    x = paste(x,...,sep=sep);
  } else {
    x = x
  }
  new("gvector",vec=lapply(x,as.sAlg),dim=length(x))
}
#' @export
print.pAlg = function(p)
{
  class(p) = "data.frame";
  print(p)
  print(attr(p,"var")$toC())
}

#' @export
is.zero = function (x, ...) UseMethod("is.zero")

#' @export
is.zero.sAlg = function(p) all(p == 0)

#' @export
is.zero.numeric = function(p) p == 0

#' @export
is.zero.gvector = function(x) gapply(x, is.zero, simplify=TRUE)

#################################################################3
## export/print functions
#' @export
ToC = function (x, ...)
  UseMethod("ToC")

#' @export
ToC.sAlg = function(p,float=TRUE, minimal=1e-10)
{
  sAlg_ToC(p)
}

#' @export
C = function(x,y,...,eq=" = ",sep) {
  x = ToC(x,...)
  if (missing(y)) {
    if (missing(sep)) sep = ""
    cat(x,sep=sep);
  } else {
    if (missing(sep)) sep = ";\n"
    y = ToC(y,...)
    cat(paste0(x,eq,y,sep),sep="")
  }
}

#' @export
is.int = function(x,min=1e-6) {
  abs(x - round(x)) < min
}

#' @export
ToC.gvector = function(x,...) gapply(x, ToC, ..., simplify=TRUE)

#' @export
ToC.numeric = function(x) {as.character(x)}

