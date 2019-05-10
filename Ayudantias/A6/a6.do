********************************************************************************
* Ayudantía 6 - SOL 3000
* a6.do
* 14/05/2019, version 1
* Pia Carozzi - pjcarozzi@uc.cl
********************************************************************************

********************************************************************************
* Setup
********************************************************************************
version 14                                              // Compatibilidad
set more off                                            // Evitar "more"
set linesize 80                                         // Largo de línea
clear all                                               // Limpiar todo
macro drop _all                                         // Limpiar macros
capture log close                                       // Cerrar logs
cd "~\sol3000\Ayudantias\A6"   								  // Directorio de trabajo
********************************************************************************

********************************************************************************
* CODIGO EJERCICIO
********************************************************************************

use GSS2016.dta, clear

*1
twoway (scatter prestg10 educ) 

* ojo con preserve y restore, tienen que ser ingresados en comando.
preserve
set seed 111
sample 200, count

twoway (scatter prestg10 educ, mlabel(id_)) 
twoway (scatter prestg10 educ) (lfit prestg10 educ)

restore
*o
use ayud6.dta, clear

*3 
reg prestg10 educ

*4 
predict fitval
predict resid, resid
gsort -resid
list prestg10 fitval resid in 1/20
twoway (scatter prestg10 educ if resid>=31.75366, mlabel(id_)) (lfit prestg10 educ)

gen resid2=resid^2
gsort -resid2
list prestg10 fitval resid resid2 in 1/20
twoway (scatter prestg10 educ if resid2>=2058.783, mlabel(id_)) (lfit prestg10 educ)

sort id_

*5 Disclaimer margins: como no se vio en clases, no se exige su uso en la tarea 2
margins, at(educ=(12))
margins, at(educ=(16))
margins, at(educ=(0(1)20))
margins, at(educ=(0(2)20))
margins, at(educ=(0(4)20))

*6 
reg prestg10 degbach
reg prestg10 sex
reg prestg10 poc

** tablas outreg2 
ssc install outreg2
quietly reg prestg10 degbach
outreg2 using modelos.xls, replace
quietly reg prestg10 sex
outreg2 using modelos.xls, append
quietly reg prestg10 poc
outreg2 using modelos.xls, append

quietly reg prestg10 degbach
outreg2 using modelos2.xls, stats(coef se tstat pval ci ci_low ci_high) side replace
quietly reg prestg10 sex
outreg2 using modelos2.xls, stats(coef se tstat pval ci ci_low ci_high) side append
quietly reg prestg10 poc
outreg2 using modelos2.xls, stats(coef se tstat pval ci ci_low ci_high) side append

help outreg2

*7 
tab padeg degree, row chi
tab padeg degree, row chi gamma

*8
oneway educ padeg, tab
pwmean educ, over(padeg) mcompare(bonferroni) effects

*9
pwcorr educ paeduc, sig
cor educ paeduc, m
dis 0.4208*(2.935782/4.053221)
dis 0.4208^2
reg educ paeduc

*10
bysort poc: reg educ paeduc
reg educ paeduc if poc==0
reg educ paeduc if poc==1

twoway (scatter educ paeduc if poc==0, mcolor(green)) (scatter educ paeduc if poc==1, mcolor(red)) (lfit educ paeduc if poc==0, lpattern(dash)) (lfit educ paeduc if poc==1, lpattern(solid))
twoway (scatter educ paeduc if poc==0, mcolor(green)) (scatter educ paeduc if poc==1, mcolor(red)) (lfit educ paeduc if poc==0, lpattern(dash)) (lfit educ paeduc if poc==1, lpattern(solid)), by(sex)

* Multivariada
reg prestg10 educ age i.sex i.race
reg prestg10 educ age i.sex i.race, beta


