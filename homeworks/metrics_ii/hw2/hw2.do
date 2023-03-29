/*part 1*/
program genest
drop _all
set obs 50
gen eps = rnormal()
gen x = 3 + 2*rnormal()
gen y = -2 + 1.5*x + eps
regress y x
end

/*part 2*/
genest

/*part 3*/
set seed 1
simulate est = _b[x] se = _se[x], reps(200): genest
summarize


/*part 4*/
program genestboot
drop _all
set obs 50
gen eps = rnormal()
gen x = 3 + 2*rnormal()
gen y = -2 + 1.5*x + eps
regress y x, vce(bootstrap)
end

/*part 5*/
genestboot

/*part 6*/
set seed 1
simulate estboot = _b[x] seboot = _se[x], reps(200): genestboot
summarize

/*part 7*/
program genestiv
drop _all
set obs 50
matrix C = (1, .1 \ .1, 1)
drawnorm eps1 eps2, n(50) corr(C)
gen z = rnormal(0,sqrt(3))
gen x = 3 + z + eps1
gen y = -2 + 1.5*x + eps2
ivregress 2sls y (x = z)
end

/*part 8*/
genestiv

/*part 9*/
set seed 1
simulate estiv = _b[x] seiv = _se[x], reps(200): genestiv
summarize


/*part 10*/
program genestivboot
drop _all
set obs 50
matrix C = (1, .1 \ .1, 1)
drawnorm eps1 eps2, n(50) corr(C)
gen z = rnormal(0,sqrt(3))
gen x = 3 + z + eps1
gen y = -2 + 1.5*x + eps2
ivregress 2sls y (x = z), vce(bootstrap)
end

/*part 11*/
genestivboot

/*part 12*/
set seed 1
simulate estivboot = _b[x] seivboot = _se[x], reps(200): genestivboot
summarize

/*end*/

