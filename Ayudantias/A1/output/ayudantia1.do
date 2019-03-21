********************************************************************************
* Ayudantia 1 - SOL 3000
* ayudantia1.do
* 22/03/2018, version clase
* Pia Carozzi - pjcarozzi@uc.cl
********************************************************************************

********************************************************************************
* Setup
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
log using logayudantia1, append name(ayudantia)        // Crear log file

* Sigamos *

