********************************************************************************
* Ayudantia 1 - SOL 3000
* ayudantia1.do
* 22/03/2018, version clase
* Pia Carozzi - pjcarozzi@uc.cl
********************************************************************************

********************************************************************************
* Setup / 1 - Iniciar una sesion en Stata
********************************************************************************
version 14                                              // Compatibilidad
set more off                                            // Evitar "more"
set linesize 110                                        // Largo de línea
clear all                                               // Limpiar todo
macro drop _all                                         // Limpiar macros
capture log close                                       // Cerrar logs

mkdir "C:\Users\pjcar\Desktop\ayudantia1"
* mkdir ~ /projects/ayudantia1 o algo asi en Mac
* rmdir "directory name" para eliminar carpetas
cd "C:\Users\pjcar\Desktop\ayudantia1"                  // Directorio de trabajo
dir


log using logayudantia1, replace name(ayudantia)        // Crear log file

* Texto *
dis 41+58

log close ayudantia
log using logayudantia1, append name(ayudantia)         // Crear log file

* Sigamos *

********************************************************************************
* 2 - Explorar base de datos. Sintaxis, comandos y qualifiers
********************************************************************************

* Descargar base de datos y guardar en la carpeta de trabajo
dir

* Abrir la base
use data_casen_2017_1prc.dta, clear

* Comandos utiles
describe

list
list in 1/10
list sexo esc in 1/10

sort esc
list sexo esc in 1/10
sort folio

* search y help
search heteroskedasticity test

help summarize

* sintaxis: summarize
summarize
summarize esc
summarize esc, d

* in
summarize esc in f/100

* if
codebook sexo
summarize esc if sexo==2 & edad>=60

* by 
sort sexo
by sexo: summarize esc

sort folio
list sexo in 1/10
by sexo: summarize esc

bysort sexo: summarize esc

bysort zona: summarize esc if edad>=45 & sexo==2

********************************************************************************
* 3 - Variables y recodificacion
********************************************************************************
