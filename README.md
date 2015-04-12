# Rsymbolic
R clone/port of C/C++ implemented symbolic algebra. Replacement for polyAlgebra

#References

polyAlgebra: https://github.com/llaniewski/polyAlgebra
Symbolicc++: http://issc.uj.ac.za/symbolic/symbolic.html

#Install and run

You need:
 * Rcpp

For test runs, gvector (https://github.com/llaniewski/gvector) is needed.

Only test run is avalible, no package yet.

```bash
$ git clone git@github.com:mdzik/Rsymbolic.git
$ cd Rsymbolic
$ make test
```

#Example usage

```R
> a = sS('a')
> b = sS('b')

> sC(a+b+16*a/b)
[1] "a+b+16*a*(1./(b))"

> sC((a+b+16*a/b)/(a))
[1] "b*(1./(a))+16*(1./(b))+1"

> sC((a+b+16*a/b)/(a+2*a))
[1] "0.333333*b*(1./(a))+5.33333*(1./(b))+0.333333"

> sC(a^2/4+b/a^-1)
[1] "0.25*a*a+b*a"

> sC(a^2/4)
[1] "0.25*a*a"
 
> v0 = sPV(c('c','d'))
> sC(sum(v0))
[1] "c+d"
 
> gapply(v0/c(a,b), sC, simplify=T)
[1] "c*(1./(a))" "d*(1./(b))"

> (a^b)$toC() 
[1] "pow(a,b)"

> ((a^b)/b)$toC()
[1] "pow(a,b)*(1./(b))"

> ((a^b)/a)$toC()
[1] "a*a+pow(b,(3))"

> (a^2+b^3)$toC()
[1] "a*a+pow(b,(3))"

> (a^2+b^3)$toC()
[1] "a*a+pow(b,(3))"

> ((a^2+b^3)/b)$toC()
[1] "a*a*(1./(b))+b*b"

```

with Symbolicc++ much more is possible, but for now this is ony simple wraper.
