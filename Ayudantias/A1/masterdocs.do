*******************************************************************************
* Ayudantia 1 - SOL 3000
* masterdoc.do
* 22/03/2018
* Pia Carozzi - pjcarozzi@uc.cl
********************************************************************************

********************************************************************************
* Setup
********************************************************************************
version 14 
set more off
set linesize 110
clear all
macro drop _all
capture log close

********************************************************************************
* Ayudantia 1
********************************************************************************
markdoc "C:\Users\pjcar\Google Drive\201901 - Diseno y Analisis de la Investigacion Social\sol3000\Ayudantias\A1\A1_1_iniciarsesion.smcl", ///
replace statax master ///
markup(markdown) ///
export(html) ///
style("stata") ///
title("Ayudantia 1 - Introduccion a Stata") ///
author("Pia Carozzi") ///
affiliation("PUC") ///
address("pjcarozzi@uc.cl")
