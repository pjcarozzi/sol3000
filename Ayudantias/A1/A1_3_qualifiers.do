quietly log using A1_3_qualifiers, replace name(A1_3_qualifiers) 

/***
3 - Qualifiers y by
===================

Como mostraba el archivo de ayuda, [summarize](http://www.stata.com/manuals13/rsummarize.pdf#rsummarize)
permite usar qualifiers y operadores, que son una parte importante del lenguaje de Stata.
Revisaremos el qualifier [in](https://www.stata.com/manuals13/u11.pdf#u11.1.4inrange), 
el qualifier [if](https://www.stata.com/manuals13/u11.pdf#u11.1.3ifexp) y 
el prefijo [by](https://www.stata.com/manuals13/u11.pdf#u11.5byvarlistconstruct)


3.1 - Qualifier in
------------------

[in](https://www.stata.com/manuals13/u11.pdf#u11.1.4inrange) permite que un 
determinado comando se ejecute usando solo las observaciones especificadas en un 
rango. Los rangos se identifican de la siguente manera:

| Exp | Descripcion                                                     |
|-----|-----------------------------------------------------------------|
| X   | La Xva observacion                                              |
| X/Y | Rango entre la Xva observacion y la Yva observacion             |
| X/l | Rango entre la Xva observacion y la ultima observacion (last)   |
| f/X | Rango entre la primera observacion (first) y la Xva observacion |

Obtengamos la media de escolaridad para las primeras 100 observaciones.
***/

summarize esc in f/100

/***

3.2 - Qualifier if
------------------

[if](https://www.stata.com/manuals13/u11.pdf#u11.1.3ifexp) permite que el
comando en cuestion se ejecute solo en las observaciones que cumplen con una
expresion determinada, condicional a los valores de otra variable.

Las expresiones utilizan operadores:

| Operadores relacionales | Operadores matematicos | Operadores logicos |
|-------------------------|------------------------|--------------------|
| > Mayor que             | + Adicion              | & Y                |
| < Menor que             | - Sustraccion          | | O                |
| >= Mayor o igual que    | * Multiplicacion       | ! No               |
| <= Menor o igual que    | / Division             |                    |
| == Igual                | ^ Potencia             |                    |
| != No igual             |                        |                    |

Obtengamos la media de escolaridad entre las mujeres mayores de 60 años.
Primero veamos como se codifica mujer en la base de datos:
***/

codebook sexo

/***
Observamos que, en las etiquetas de valores, "hombre" esta codificado como "1"
y "mujer" como "2". Calculamos la media de escolaridad para las mujeres que 
tienen 60 años o mas en la muestra, usando qualifiers y operadores
***/

summarize esc if sexo==2 & edad>=60

/***

3.3 - Prefijo by
----------------

[by](https://www.stata.com/manuals13/u11.pdf#u11.5byvarlistconstruct) permite 
ejecutar un comando de manera separada para grupos de observaciones identificados
con un valor determinado en una variable. Es util para analizar subsets de datos.

Supongamos que queremos calcular la media de escolaridad por sexo. Para ello,
ejecutaremos [summarize](http://www.stata.com/manuals13/rsummarize.pdf#rsummarize)
de manera separada para quienes comparten el valor "1", los hombres, y quienes 
comparten el valor "2", las mujeres.

Para poder computarlo, [by](https://www.stata.com/manuals13/u11.pdf#u11.5byvarlistconstruct)
requiere que las observaciones esten ordenadas segun la variable que identifica
los grupos. En este caso, que en la lista de observaciones aparezcan primero
los hombres y luego las mujeres. 

Usamos el comando [sort](http://www.stata.com/manuals13/dsort.pdf#dsort) previamente,
y luego [summarize](http://www.stata.com/manuals13/rsummarize.pdf#rsummarize)
***/

sort sexo
by sexo: summarize esc


/***
La media de escolaridad para los hombres es 11 años y para las mujeres, 10,9 años.

Podemos evitar el paso previo de ordenar las variables usando 
[bysort](https://www.stata.com/manuals13/dby.pdf). Reordenemos las observaciones por folio
***/

sort folio
list sexo in 1/10

/***
Podemos ver que las observaciones ya no estan ordenadas por sexo. Si intentamos
ejecutar el comando que acabamos de usar para calcular las medias, el output
nos mostrara un error
***/

by sexo: summarize esc

/***
Si hacemos click en el link r(5), se abrira la ventana de visor detallando una busqueda
que entrega informacion respecto al error que cometimos.

Usemos [bysort](https://www.stata.com/manuals13/dby.pdf)
***/

bysort sexo: summarize esc

/***
Los resultados que aparecen en el output son exactamente iguales a los
obtenidos al ordenar previamente las observaciones.

El prefijo [by](https://www.stata.com/manuals13/u11.pdf#u11.5byvarlistconstruct)
no puede ser utilizado en forma conjunta con el qualifier
[in](https://www.stata.com/manuals13/u11.pdf#u11.1.4inrange), pero si acepta el 
uso del qualifier [if](https://www.stata.com/manuals13/u11.pdf#u11.1.3ifexp).

Obtengamos la media de escolaridad por zona de residencia (urbana o rural) para 
las observaciones que tienen 45 años o mas y son mujeres.
***/

bysort zona: summarize esc if edad>=45 & sexo==2

/***
En esta muestra, las mujeres de 45 años o mas que viven en una zona urbana tienen en
promedio 9. años de escolaridad, mientras que las mujeres de 45 años o mas que 
viven en una zona rural tienen en promedio 6.8 años de escolaridad.
***/

quietly log close A1_3_qualifiers
