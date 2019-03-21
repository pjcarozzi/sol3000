3 - Qualifiers y by
===================

Como mostraba el archivo de ayuda, [summarize](http://www.stata.com/manuals13/rsummarize.pdf#rsummarize) permite usar qualifiers y operadores, que son una parte importante del
lenguaje de Stata. Revisaremos el qualifier [in](https://www.stata.com/manuals13/u11.pdf#u11.1.4inrange), el qualifier [if](https://www.stata.com/manuals13/u11.pdf#u11.1.3ifexp) y el prefijo [by](https://www.stata.com/manuals13/u11.pdf#u11.5byvarlistconstruct)

3.1 - Qualifier in
------------------

[in](https://www.stata.com/manuals13/u11.pdf#u11.1.4inrange) permite que un determinado comando se ejecute usando solo las observaciones especificadas en un rango. Los rangos se identifican de la siguente manera:

| Exp | Descripcion                                                     |
|-----|-----------------------------------------------------------------|
| X   | La Xva observacion                                              |
| X/Y | Rango entre la Xva observacion y la Yva observacion             |
| X/l | Rango entre la Xva observacion y la ultima observacion (last)   |
| f/X | Rango entre la primera observacion (first) y la Xva observacion |

Obtengamos la media de escolaridad para las primeras 100 observaciones.

          . summarize esc in f/100

              Variable |        Obs        Mean    Std. Dev.       Min        Max
          -------------+---------------------------------------------------------
                   esc |         78    11.98718    3.701504          0         21

3.2 - Qualifier if
------------------

[if](https://www.stata.com/manuals13/u11.pdf#u11.1.3ifexp) permite que el comando en cuestion se ejecute solo en las observaciones que cumplen con una expresion determinada, condicional a los valores de otra variable.

Las expresiones utilizan operadores:

| Operadores relacionales | Operadores matematicos | Operadores logicos |
|-------------------------|------------------------|--------------------|
| > Mayor que             | + Adicion              | & Y                |
| < Menor que             | - Sustraccion          | &#124; O           |
| >= Mayor o igual que    | * Multiplicacion       | ! No               |
| <= Menor o igual que    | / Division             |                    |
| == Igual                | ^ Potencia             |                    |
| != No igual             |                        |                    |

Obtengamos la media de escolaridad entre las mujeres mayores de 60 años. Primero veamos como se codifica mujer en la base de datos:

          . codebook sexo

          -------------------------------------------------------------------------------------------------------------
          sexo                                                                                                     Sexo
          -------------------------------------------------------------------------------------------------------------

                            type:  numeric (double)
                           label:  sexo

                           range:  [1,2]                        units:  1
                   unique values:  2                        missing .:  0/2,164

                      tabulation:  Freq.   Numeric  Label
                                   1,038         1  Hombre
                                   1,126         2  Mujer

Observamos que, en las etiquetas de valores, "hombre" esta codificado como "1" y "mujer" como "2". Calculamos la media de escolaridad para las mujeres que tienen 60 años o mas en la muestra, usando qualifiers y operadores

          . summarize esc if sexo==2 & edad>=60

              Variable |        Obs        Mean    Std. Dev.       Min        Max
          -------------+---------------------------------------------------------
                   esc |        243    7.683128    4.826152          0         19

3.3 - Prefijo by
----------------

[by](https://www.stata.com/manuals13/u11.pdf#u11.5byvarlistconstruct) permite ejecutar un comando de manera separada para grupos de observaciones identificados con un valor determinado en una variable. Es util para analizar subsets de datos.

Supongamos que queremos calcular la media de escolaridad por sexo. Para ello, ejecutaremos
[summarize](http://www.stata.com/manuals13/rsummarize.pdf#rsummarize) de manera separada para quienes comparten el valor "1", los hombres, y quienes comparten el valor "2", las mujeres.

Para poder computarlo, [by](https://www.stata.com/manuals13/u11.pdf#u11.5byvarlistconstruct)
requiere que las observaciones esten ordenadas segun la variable que identifica los grupos. En este caso, que en la lista de observaciones aparezcan primero los hombres y luego las mujeres.

Usamos el comando [sort](http://www.stata.com/manuals13/dsort.pdf#dsort) previamente, y luego
[summarize](http://www.stata.com/manuals13/rsummarize.pdf#rsummarize)

          . sort sexo

          . by sexo: summarize esc

          -------------------------------------------------------------------------------------------------------------
          -> sexo = Hombre

              Variable |        Obs        Mean    Std. Dev.       Min        Max
          -------------+---------------------------------------------------------
                   esc |        821    11.01218    4.077882          0         22

          -------------------------------------------------------------------------------------------------------------
          -> sexo = Mujer

              Variable |        Obs        Mean    Std. Dev.       Min        Max
          -------------+---------------------------------------------------------
                   esc |        928    10.85022    4.408996          0         21

La media de escolaridad para los hombres es 11 años y para las mujeres, 10,9 años.

Podemos evitar el paso previo de ordenar las variables usando [bysort](https://www.stata.com/manuals13/dby.pdf). Reordenemos las observaciones por folio

          . sort folio

          . list sexo in 1/10

               +--------+
               |   sexo |
               |--------|
            1. |  Mujer |
            2. | Hombre |
            3. |  Mujer |
            4. | Hombre |
            5. | Hombre |
               |--------|
            6. | Hombre |
            7. |  Mujer |
            8. | Hombre |
            9. | Hombre |
           10. | Hombre |
               +--------+

Podemos ver que las observaciones ya no estan ordenadas por sexo. Si intentamos ejecutar el comando que acabamos de usar para calcular las medias, el output nos mostrara un error

          . by sexo: summarize esc
          not sorted
          r(5);

          end of do-file

Si hacemos click en el link r(5), se abrira la ventana de visor detallando una busqueda que entrega informacion respecto al error que cometimos.

Usemos [bysort](https://www.stata.com/manuals13/dby.pdf)

          . bysort sexo: summarize esc

          -------------------------------------------------------------------------------------------------------------
          -> sexo = Hombre

              Variable |        Obs        Mean    Std. Dev.       Min        Max
          -------------+---------------------------------------------------------
                   esc |        821    11.01218    4.077882          0         22

          -------------------------------------------------------------------------------------------------------------
          -> sexo = Mujer

              Variable |        Obs        Mean    Std. Dev.       Min        Max
          -------------+---------------------------------------------------------
                   esc |        928    10.85022    4.408996          0         21

Los resultados que aparecen en el output son exactamente iguales a los obtenidos al ordenar previamente las observaciones.

El prefijo [by](https://www.stata.com/manuals13/u11.pdf#u11.5byvarlistconstruct) no puede ser utilizado en forma conjunta con el qualifier [in](https://www.stata.com/manuals13/u11.pdf#u11.1.4inrange), pero si acepta el uso del qualifier [if](https://www.stata.com/manuals13/u11.pdf#u11.1.3ifexp).

Obtengamos la media de escolaridad por zona de residencia (urbana o rural) para las observaciones que tienen 45 años o mas y son mujeres.

          . bysort zona: summarize esc if edad>=45 & sexo==2

          -------------------------------------------------------------------------------------------------------------
          -> zona = Urbano

              Variable |        Obs        Mean    Std. Dev.       Min        Max
          -------------+---------------------------------------------------------
                   esc |        389    9.532134    4.643155          0         21

          -------------------------------------------------------------------------------------------------------------
          -> zona = Rural

              Variable |        Obs        Mean    Std. Dev.       Min        Max
          -------------+---------------------------------------------------------
                   esc |         85    6.976471    4.011817          0         17

En esta muestra, las mujeres de 45 años o mas que viven en una zona urbana tienen en promedio 9. años de escolaridad, mientras que las mujeres de 45 años o mas que viven en una zona rural tienen en promedio 6.8 años de escolaridad.

          . quietly log close A1_3_qualifiers
