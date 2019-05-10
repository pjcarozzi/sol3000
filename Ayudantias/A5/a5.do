********************************************************************************
* Ayudantía 5 - SOL 3000
* a5.do
* 10/05/2019, version 1
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
cd "~\sol3000\Ayudantias\A5"   								  // Directorio de trabajo
********************************************************************************

use "data\GSS2006.dta", clear


**** Exploracion visual
twoway (scatter educ paeduc)

* OJO: es necesario ejecutar _preserve_ y _restore_ desde la ventana Command
* si se ejecuta desde el dofile no funciona!

preserve
set seed 123
sample 300, count
twoway (scatter educ paeduc)
twoway (scatter educ paeduc) (lfit educ paeduc)
restore

**** Regresion lineal simple
regress educ paeduc

**** Valores predichos
dis 10.23162 + (0.3107844*12)
margins, at(paeduc=(12))
margins, at(paeduc=(0(1)20))
predict fitted
twoway (line fitted paeduc) //Sólo línea de regresión
twoway (lfit educ paeduc)
twoway (lfitci educ paeduc) //Línea con IC

* OJO: es necesario ejecutar _preserve_ y _restore_ desde la ventana Command
* si se ejecuta desde el dofile no funciona!

preserve
set seed 123
sample 300, count
twoway (scatter educ paeduc) (line fitted paeduc)
restore


**** Ajuste
regress educ paeduc
dis 11033.3131/55345.9409

**** r, Beta y R2
pwcorr educ paeduc, sig star(95)
cor educ paeduc, means
dis 0.4465*(2.952502/4.241711)
dis 0.4465^2
