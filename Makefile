test:
	R -f ./tests/testRun.R
test2:
	R -f ./tests/testRun2.R
bench:
	R -f ./tests/bench_polyAlgebra.R
	R -f ./tests/bench_RSymbolic.R

