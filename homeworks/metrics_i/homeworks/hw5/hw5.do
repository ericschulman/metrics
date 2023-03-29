. log using "C:\Users\ehs588\Downloads\hw5_output.txt", text replace
/*fuck STATA -- no time to code these things in python tho*/

/*---------------Question 2---------------*/
use "C:\Users\ehs588\Downloads\wagepan.dta", clear
regress lwage exper expersq educ union black poorhlth
xtreg lwage exper expersq educ union black poorhlth, fe
estimates store fixed
xtreg lwage exper expersq educ union black poorhlth, re
hausman fixed ., sigmamore

/*Do it again with dummy variables*/
regress lwage exper expersq educ union black poorhlth d81 d82 d83 d84 d85 d86 d87
xtreg lwage exper expersq educ union black poorhlth d81 d82 d83 d84 d85 d86 d87, fe
estimates store fixed
xtreg lwage exper expersq educ union black poorhlth d81 d82 d83 d84 d85 d86 d87, re
hausman fixed ., sigmamore

/*---------------Question 3---------------*/

/*part (b)*/
use "C:\Users\ehs588\Downloads\MROZ.DTA", clear
mprobit inlf kidslt6 huswage kidsge6 educ
tobit hours kidslt6 huswage kidsge6 educ, ll
truncreg hours kidslt6 huswage kidsge6 educ, ll(0)

/*part (c)*/
kdensity hours
graph export "C:\Users\ehs588\Downloads\q3_graph.png", replace

/*---------------Question 4---------------*/
use "C:\Users\ehs588\Downloads\cps09mar.dta", clear

/*part (b)*/
kdensity wage, normal
graph export "C:\Users\ehs588\Downloads\q4_graph1.png", replace

/*part (c)*/
kdensity lwage, normal 
graph export "C:\Users\ehs588\Downloads\q4_graph2.png", replace

/*part d*/
lpoly wage exp if female==1 & white==1
graph export "C:\Users\ehs588\Downloads\q4_graph3.png", replace
lpoly wage exp if female==0 & white==1
graph export "C:\Users\ehs588\Downloads\q4_graph4.png", replace
lpoly lwage exp if female==1 & white==1
graph export "C:\Users\ehs588\Downloads\q4_graph5.png", replace
lpoly lwage exp if female==0 & white==1
graph export "C:\Users\ehs588\Downloads\q4_graph6.png", replace

translate "C:\Users\ehs588\Downloads\hw5_output.txt" "C:\Users\ehs588\Downloads\hw5_output.pdf"
log close
