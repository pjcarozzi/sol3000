set linesize 120  

quietly log using A1_4_recod, replace name(A1_4_recod) 

/***
4.1 - Variables y etiquetas
===========================

Volvamos a revisar las variables presentes en la base de datos.

***/

describe

/***
Stata tiene distintas formas de identificar una variable:

- _Variable name_. El nombre de la variable, que por conveniencia suele mantenerse
corto para facilitar su uso mediante comandos.

- _Variable label_. La etiqueta de la variable, lo que describe a la variable. Si una
variable tiene etiqueta, este sera el nombre que aparece en las tablas y graficos,
entre otros.

- _Value label_. El nombre de la etiqueta de valores que contiene los nombres de
los atributos de la variable. Las variables continuas no suelen estar asociadas a una
etiqueta de valores, pero estos son utiles para identificar los atributos de las
variables categoricas. 

[codebook](https://www.stata.com/manuals13/dcodebook.pdf#dcodebook) y
[labelbook](https://www.stata.com/manuals13/dlabelbook.pdf#dlabelbook) nos permiten
conocer estos identificadores.

[codebook](https://www.stata.com/manuals13/dcodebook.pdf#dcodebook) examina los 
nombres y etiquetas de las variables. Si no especificamos ninguna variable junto
el comando, [codebook](https://www.stata.com/manuals13/dcodebook.pdf#dcodebook) 
nos muestra informacion para todas las variables en la base de datos. Tambien podemos
ejecutar el comando seguido de una variable o lista de variables.

Exploremos la ocupacion u oficio de los casos en la muestra.

***/

codebook oficio1

/***

Podemos observar que la variable oficio1 es una variable categorica, con un rango 
de atributos que va del 0 al 999. Cuando las variables poseen muchos atributos 
(etiquetados), [codebook](https://www.stata.com/manuals13/dcodebook.pdf#dcodebook) 
no muestra sino parte de ellos, como en este caso.

Si queremos ver todos los atributos etiquetados asociados a las variable, 
usamos el comando [labelbook](https://www.stata.com/manuals13/dlabelbook.pdf#dlabelbook).

[labelbook](https://www.stata.com/manuals13/dlabelbook.pdf#dlabelbook), a diferencia
de [codebook](https://www.stata.com/manuals13/dcodebook.pdf#dcodebook), no se 
refiere a las variables en si, sino a las etiquetas de variables, que son 
registradas en Stata como informacion independiente. Varias variables pueden
compartir una etiqueta de variables. 

Debido a esto, necesitamos identificar previamente el nombre de la etiqueta de variables 
que esta asociada a la variable de interes. El output de 
[codebook](https://www.stata.com/manuals13/dcodebook.pdf#dcodebook) 
nos muestra esta informacion. En este caso, la etiqueta de variable de _oficio1_
tambien se llama _oficio1_.

Si ejecutamos [labelbook](https://www.stata.com/manuals13/dlabelbook.pdf#dlabelbook)
sin especificaciones, se desplegara el libro de etiquetas completo. Nuevamente, si ejecutamos 
[labelbook](https://www.stata.com/manuals13/dlabelbook.pdf#dlabelbook) seguido por
una etiqueta de variable o una lista de etiquetas de variables, nos mostrara los
atributos etiquetados solo para estas etiquetas.

***/

labelbook oficio1

/***
Podemos ver que, si bien el rango de valores de _oficio1_ va de 0 a 999, no todos
los valores estan etiquetados. El valor 999 corresponde a "Sin dato". En este 
caso, la etiqueta de valores _oficio1_ solo es usada por la variable _oficio1_.

Revisemos otra etiqueta de valores:
***/

labelbook DICO

/***
La etiqueta de valores _DICO_, definida como 1 "si", 2 "no", 9 "no sabe/no responde", 
es compartida por las variables _o1_, _o2_, _o3_ y _o6_.

4.2 - Recodificaciones
======================

Identificar previamente el nivel de medicion y los atributos de las variables es
necesario a la hora de recodificar variables, o crear variables a partir de las 
existentes. 

Dos comandos basicos que permiten recodificar datos son 
[generate](https://www.stata.com/manuals13/dgenerate.pdf#dgenerate) y
[replace](https://www.stata.com/manuals13/dgenerate.pdf#dgenerate).

[generate](https://www.stata.com/manuals13/dgenerate.pdf#dgenerate), abreviado 
gen o g, nos permite crear una nueva variable especificando su nombre y una 
expresion que determinara su contenido.

Creemos una variable llamada _varnueva_ en la cual todas las observaciones 
compartan el valor 1.  
***/ 

gen varnueva=1

list varnueva in 1/5

/***
[replace](https://www.stata.com/manuals13/dgenerate.pdf#dgenerate) cambia el 
contenido de una variable existente. 

Reemplacemos el contenido de _varnueva_ indicando que todas las observaciones
tengan el valor 7
***/

replace varnueva=7

list varnueva in 1/5

/***
Eliminemos _varnueva_
***/

drop varnueva

/***
Los qualifiers y operadores que ya revisamos nos permitiran recodificar variables.
Usemos operadores aritmeticos para calcular el ingreso total per capita para 
cada observacion de la muestra, creando una variable que se llamara _ypcapita_.

Utilizaremos dos variables existentes: _ytotcorh_, el ingreso total del hogar, y
_numper_, el numero de personas en el hogar.
***/

gen ypcapita=ytotcorh/numper

/***
Revisemos los estadisticos descriptivos para el ingreso total per capita.
***/

summarize ypcapita

/***
La media de ingreso per capita es $357333. La variable _ypc_, generada por Casen,
contiene la misma informacion. 
***/

list ypcapita ypc in f/10

/*** 
Supongamos que nos encargan calcular el porcentaje de personas en edad de trabajar.
Sabemos que, por definicion de Casen, son personas en edad de trabajar todos quienes
tienen 15 años o mas. 

Construyamos una variable dicotomica que identifique con 1 a quienes tienen 15 
años o mas, y con 0 a quienes tienen menos de 15 años.

Primero, verifiquemos si la variable _edad_ tiene valores perdidos o si existe un
valor que identifique que la edad no ha sido registrada (ej. NS/NR, 999).
***/

*codebook edad

/***
La variable no tiene casos perdidos. Tampoco se ha codificado un valor tal que nos 
sugiera dejar fuera algunos casos para los que no existe el dato.

Usamos la variable _edad_, tal y como es codificada en Casen, y el qualifier 
[if](https://www.stata.com/manuals13/u11.pdf#u11.1.3ifexp) para crear una nueva 
variable llamada _pet_.
***/

gen pet=0
replace pet=1 if edad>=15

/***
[recode](https://www.stata.com/manuals13/drecode.pdf) es oro comando que podemos 
usar para cumplir con esta tarea. [recode](https://www.stata.com/manuals13/drecode.pdf)
cambia los valores numericos de una variable de acuerdo con reglas especificas.

Esta vez usaremos rangos de edad:
***/

gen pet2=edad
recode pet2 (0/14=0) (15/95=1)

/***
Ambas maneras nos entregan los mismos resultados. Corroboremos si la cantidad de 
personas en edad de trabajar es igual bajo ambas recodificaciones. Utilizamos el
comando [tabulate](http://www.stata.com/manuals13/rtabulateoneway.pdf#rtabulateoneway),
abreviado [tab](http://www.stata.com/manuals13/rtabulateoneway.pdf#rtabulateoneway), 
para obtener tablas de frecuencias y porcentajes. Podemos escribir, en dos pasos:
***/

tab pet
tab pet2

/***
O en sólo uno:
***/

tab1 pet pet2

/***
Ambas tablas muestran que tenemos 1760 personas en edad de trabajar, lo que equivale
a un 81.33% de nuestra muestra.

Supongamos ahora que nos encargan identificar la condicion de actividad de los
encuestados, con el fin de calcular las tasas de ocupacion, desocupacion e inactividad.

Primero necesitamos identificar las variables que nos sirven para construir la
variable que identifique en la muestra a quienes estan ocupados, desocupados e 
inactivos. La siguiente figura muestra un fragmento del Modulo Trabajo del 
[Cuestionario Casen 2017][source2] y sintetiza la logica que seguiremos en nuestra
recodificacion.

![recod](./img/recod.jpg)

Generamos tablas de frecuencia para las variables que necesitamos usando 
[tab1](http://www.stata.com/manuals13/rtabulateoneway.pdf#rtabulateoneway)
con la opcion missing (abreviada m). La opción missing nos permite tratar 
los datos perdidos como si fueran una categoría adicional y saber cual 
es su porcentaje en la muestra
***/

tab1 o1 o2 o3 o6, m

/***
En _o1_ tenemos 404 casos perdidos. Esto se explica porque las preguntas de _o1_
a _o8_ solo son contestadas por quienes tienen 15 años o mas. Podemos comprobarlo
al ejecutar:
***/

tab o1 if edad<15, m

/***
A las variables _o2_, _o3_ y _o6_ se le suman como casos perdidos quienes han 
respondido "si" en las preguntas anteriores. 
***/

dis 404+920
dis 1324+13
dis 1337+25 

/*** 
Creamos una variable nueva, llamada _act_, que sea condicional a los valores de 
_o1_, _o2_, _o3_ y _o6_, usando el qualifier 
[if](https://www.stata.com/manuals13/u11.pdf#u11.1.3ifexp).

_act_ es igual a 1 si el o la encuestada contesto _o1_ u _o2_ u _o3_ con “si”, 
por lo tanto, se encuentra ocupado/a.
***/ 

gen act=1 if o1==1 | o2==1 | o3==1

/***
Esto genera 1206 casos pedidos para los que la expresion logica no se cumple. 
Reemplazamos parte de esos casos perdidos con "2" si el o la encuestada responde
"si" en la pregunta _o6_, por lo tanto, se encuentra desocupado.
***/

replace act=2 if o6==1

/***
Son reemplazados 82 casos para los cuales si se cumplia _o6==1_. Finalmente, 
nos queda definir a quienes respondieron "no" en _o6_. Alternativamente, podemos
usar el operador _!=_ y condicionar el remplazo a quienes no respondieron "si"
en las preguntas anteriores, dejando como perdidos a quienes no son poblacion
en edad de trabajar (el resultado es el mismo)
***/

replace act=3 if o1!=1 & o2!=1 & o3!=1 & o6!=1
replace act=. if pet==0 

/***
Comparamos la variable recien creada tabulando _act_ y _activ_, variable creada
por Casen que contiene la misma informacion.
***/

tab1 act activ, m

/***
O como tabla cruzada
***/

tab act activ, m

/***
Nos falta identificar la variable _act_ y sus atributos. Primero creamos una 
etiqueta de variable que la describa
***/

label variable act "Actividad"

/*** 
Si queremos usar otra etiqueta, simplemente sobreescribimos.
***/

label variable act "Actividad recodificada"

/***
Ahora etiquetemos los atributos. Primero debemos definir una etiqueta de valores
y parear cada valor con el atributo que queremos que muestre.
***/

label define valactividad 1 "Ocupado" 2 "Desempleado" 3 "Inactivo"

/***
Si queremos cambiar algun valor o etiqueta de valor, usamos la opcion _replace_ 
***/

label define valactividad 1 "Ocupado" 2 "Desocupado" 3 "Inactivo", replace

/***
Si queremos agregar un valor y su etiqueta, usamos la opcion _add_
***/

label define valactividad 9 "No PET", add

/***
El segundo paso es enlazar la variable a la etiqueta de valores creada.
***/

label values act valactividad

/***
Tabulemos la variable _act_
***/

tab act, m

/***
Las etiquetas de valores no modifican los valores de las variables. En este caso,
definimos una etiqueta para el valor "9" como "No PET", pero este no existe en la 
variable, por lo que simplemente no los muestra. 

Recodifiquemos a quienes no son poblacion en edad de trabajar como "9" 
***/

replace act=9 if pet==0

/***
Veamos ahora la tabla de frecuencias de _act_
***/

tab act, m

/***
4.2 - Cerrar sesion
===================

Finalicemos la sesion de hoy. para guardar la base de datos modificada, usamos:
***/

save data_casen_ayud1, replace

/***
Si estamos usando un _log file_, lo cerramos usando su nombre:
***/

log close ayudantia


/***
[source2]: http://observatorio.ministeriodesarrollosocial.gob.cl/casen-multidimensional/casen/docs/Cuestionario_Casen2017.pdf  "Cuestionario Casen 2017"
***/

quietly log close A1_4_recod
