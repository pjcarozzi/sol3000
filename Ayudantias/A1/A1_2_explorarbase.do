set linesize 120 
quietly log using A1_2_explorardb, replace name(A1_2_explorardb) 

/***

2.1 - Explorar base de datos
============================

Descargamos la base de datos [data_casen_2017_1p][datos1], desde el [Dropbox][dropbox]
del curso, y la guardamos en la carpeta de trabajo declarada para esta sesion. 
La base contiene una muestra aleatoria de 1% de [Casen 2017][source1] y una 
seleccion de variables. 

Abrimos la base de datos
***/

use data_casen_2017_1prc.dta, clear

/***
Revisemos lo ue contiene la base:
***/

*describe

/***
El output de [describe](http://www.stata.com/manuals13/ddescribe.pdf#ddescribe)
nos muestra el nombre del archivo, cuantas observaciones tiene (2164),
cuantas variables tiene (29) y el tamaño del archivo en bytes. Mas abajo, detalla
el nombre de las variables y las etiquetas de cada variable - que describen la 
informacion que contienen -, el nombre del grupo de etiquetas de valores (atributos)
que cada una usa si ha sido declarado, su tipo de almacenamiento y el formato con
el cual se muestran. 
***/

/***
Otro comando basico para explorar variables y observaciones es  
[list](http://www.stata.com/manuals13/dlist.pdf#dlist). 
[list](http://www.stata.com/manuals13/dlist.pdf#dlist) nos muestra, caso a caso, 
los valores registrados para cada variable.
Podemos imprimir los valores para todas las variables y observaciones, seleccionar
algunas variables o seleccionar algunas observaciones. 

Cuando no existe el valor para una determinada variable, es decir, se trata de
un caso missing, Stata lo identifica con un punto (.). 

Revisemos las variables sexo y escolaridad para las primeras 10 observaciones:
***/

list folio sexo esc in 1/10

/***
Otro comando basico es [sort](http://www.stata.com/manuals13/dsort.pdf#dsort), que
nos permite ordenar las observaciones segun una determinada variable.
Ordenamos los datos ascendentemente segun escolaridad:
***/

sort esc

/***
Observemos el resultado usando [list](http://www.stata.com/manuals13/dlist.pdf#dlist) 
***/

list folio sexo esc in 1/5

/***
Los 5 primeros casos tienen 0 años de escolaridad.
***/

/***
2.2 - Sintaxis
==============

La estructura de los comandos de Stata es simple, aunque la cantidad de comandos
pueda parecer inicialmente abrumadora. Antes que todo, es util tener en mente
dos comandos: 
[help](http://www.stata.com/manuals13/u4.pdf#u4Statashelpandsearchfacilities) y
[search](http://www.stata.com/manuals13/u4.pdf#u4Statashelpandsearchfacilities)

[search](http://www.stata.com/manuals13/u4.pdf#u4Statashelpandsearchfacilities)
es el motor de busqueda de Stata. Busca en los archivos locales del programa y
tambien en Internet. Los resultados entregados corresponden a comandos de Stata,
FAQs en [www.stata.com](http://www.stata.com/), blogs oficiales, articulos que 
han aparecido en [Stata Journal](https://www.stata-journal.com), y adiciones 
a Stata creadas por usuarios. 

Supongamos que queremos obtener informacion acerca de test de heteroscedasticidad. 
Podemos escribir:
***/

search heteroskedasticity test

/***
Ejecutado el comando, aparece la ventana _Viewer_ con los resultados de la
busqueda, identificando sus fuentes.

![search](./Ayudantias/A1/img/search.jpg)

[help](http://www.stata.com/manuals13/u4.pdf#u4Statashelpandsearchfacilities)
seguido por el nombre de un comando entrega los archivos de ayuda asociados 
a dicho comando. [help](http://www.stata.com/manuals13/u4.pdf#u4Statashelpandsearchfacilities)
es, por lejos, el comando mas util para aprender a usar Stata. 

Localicemos informacion de uno de los comandos que ya han utilizado en clase:
***/


help summarize

/***
Nuevamente, se abrira ventana _Viewer_. 

![help](./Ayudantias/A1/img/help.jpg)

El primer vinculo bajo el titulo, que aparece precedido por una [R], enlaza
la entrada correspondiente a [summarize](http://www.stata.com/manuals13/rsummarize.pdf#rsummarize)
en el _Stata Base Reference Manual_. Si hacemos click, accedemos esta documentacion,
en formato _pdf_, guardada en los archivos locales del programa.

Volvamos a mirar la ventana de visor. El segundo titulo, _Syntax_, nos muestra
la sintaxis del comando. Como si fuera una oracion gramatical, la sintaxis nos 
indica las reglas que gobiernan el uso del comando, a que se aplica y las 
opciones que acepta. 

_summarize [varlist] [if] [in] [weight] [, options]_

Indica que [summarize](http://www.stata.com/manuals13/rsummarize.pdf#rsummarize)
puede ser escrito bajo la abreviatura [su](http://www.stata.com/manuals13/rsummarize.pdf#rsummarize),
obteniendose los mismos resultados. Señala que 
[summarize](http://www.stata.com/manuals13/rsummarize.pdf#rsummarize) debe ser 
seguido por una variable o una lista de variables y que permite el uso de los 
_qualifiers_ [if](https://www.stata.com/manuals13/u11.pdf#u11.1.3ifexp) e 
[in](https://www.stata.com/manuals13/u11.pdf#u11.1.4inrange). Tambien indica que 
puede utilizarse con ponderadores y que, precedido de una coma (,), pueden usarse
distintas opciones especificadas mas abajo, en el titulo _Options_. 

El titulo _Menu_ nos muestra la manera de acceder al comando desde los menus
desplegables de Stata.

El titulo _Description_ brinda una descripcion general del comando. Como ya 
vieron en la clase, 
[summarize](http://www.stata.com/manuals13/rsummarize.pdf#rsummarize) calcula 
una serie de estadisticos descriptivos univariados.

Ejecutemos el comando
***/

summarize

/***
Nos entrega el numero de observaciones validas, la media, desviacion estandar,
valores minimo y maximo de todas las variables presentes en la base de datos.

Esto no es util para todas las variables, estos estadisticos no tienen mucho
sentido si las variables no son continuas. Calculemos la media de escolaridad
en la muestra.
***/

summarize esc

/***
La media de escolaridad en la muestra es 10,9 años. Tambien podemos obtener mas 
estadisticos descriptivos usando la opcion _detail_ (abreviada _d_), precedida
por una coma.
***/

summarize esc, d

/***
Nos muestra adicionalmente los percentiles, la varianza, asimetria y curtosis.
***/

/***
[dropbox]: http://example.com/  "Dropbox SOL3000"
[datos1]: http://example.com/  "Datos 1"
[source1]: http://observatorio.ministeriodesarrollosocial.gob.cl/casen-multidimensional/casen/casen_2017.php  "Fuente"
***/

quietly log close A1_2_explorardb
