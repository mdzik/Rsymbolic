library("Rcpp")
library("gvector")
options(stringsAsFactors=FALSE)
Sys.setenv("PKG_CXXFLAGS"=paste("-I", getwd(),'/src/symboliccpp', sep=""))

sourceCpp("src/SymbolModule.cpp")

source("R/SymbolClass.R")
source('R/polyAlgebraWrapper.R')
source('tests/feq.R')

Density = data.frame()

AddDensity = function(name, dx=0, dy=0, dz=0, comment="", field=name, adjoint=F, group="", parameter=F) {
  if (any((parameter) && (dx != 0) && (dy != 0) && (dz != 0))) stop("Parameters cannot be streamed (AddDensity)");
  if (missing(name)) stop("Have to supply name in AddDensity!")
  if (missing(group)) group = name
  comment = ifelse(comment == "", name, comment);

  dd = data.frame(
    name=name,
    field=field,
    dx=dx,
    dy=dy,
    dz=dz,
    comment=comment,
    adjoint=adjoint,
    group=group,
    parameter=parameter
  )
  Density <<- rbind(Density,dd)
}


AddDensity( name="g[0]", dx= 0, dy= 0, group="g")
AddDensity( name="g[1]", dx= 1, dy= 0, group="g")
AddDensity( name="g[2]", dx= 0, dy= 1, group="g")
AddDensity( name="g[3]", dx=-1, dy= 0, group="g")
AddDensity( name="g[4]", dx= 0, dy=-1, group="g")
AddDensity( name="g[5]", dx= 1, dy= 1, group="g")
AddDensity( name="g[6]", dx=-1, dy= 1, group="g")
AddDensity( name="g[7]", dx=-1, dy=-1, group="g")
AddDensity( name="g[8]", dx= 1, dy=-1, group="g")

U = as.matrix(Density[Density$group=="g",c("dx","dy")])
rho = PV('rho')
u=PV(c('u.x','u.y'))
g = PV(Density$name[Density$group=="g"])

C(g, MRT_feq(U,rho,u*rho))
