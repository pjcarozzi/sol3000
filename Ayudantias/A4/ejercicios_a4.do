********************************************************************************
* Ayudantía 4 - SOL 3000
* ejercicios_a4.do
* 26/04/2019, version 1
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
cd "~\sol3000\Ayudantias\A4"   								  // Directorio de trabajo
********************************************************************************

use "issp2012cl.dta", clear

**** Ejercicios
*1 
* H0: Las var son independientes    Ha: Las var son dependientes
tab sexo rq32, row chi2
* Rechazamos H0

*2
tabchi sexo rq32, raw adjust

*3
tab sexo rq321, row
* Odds mujeres
dis 380/399
* Odds hombres
dis 42/366
* Odds ratio
dis (380/399)/(42/366)
cci 380 42 399 366, level(95)

*4
tab tedad rq1b, row gamma
dis 0.0617 - (1.96*0.031)
dis 0.0617 + (1.96*0.031)
dis 0.0617/0.031
* Una cola P-Value 0.023295
* Dos colas P-Value 0.046591

*5
tabi 16 36 15 \ 11 36 21 \ 2 12 8, row chi2 gamma

*6
oneway htrab educ, tab

*7
oneway hcuid ninos, bonferroni tab
pwmean hcuid, over(ninos) mcompare(bonferroni) effects
