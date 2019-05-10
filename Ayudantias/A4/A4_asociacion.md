Ayudantia 1 - Asociacion entre variables categóricas
====================================================

Pia Carozzi

PUC

*pjcarozzi\@uc.cl*

------

Decimos que hay asociación entre dos variables cuando la distribución de una de ellas cambia de alguna forma en la medida en que cambia la otra.

El análisis de asociación entre dos variables es llamado análisis bivariado. Usualmente los análisis de asociación estudian cómo los resultados de una de las variables, o variable de respuesta, dependen de o son explicados por los valores de otra variable, o variable explicativa. Es necesario apuntar, no obstante, que la existencia de una asociación entre variables no implica que existe una relación causal entre ellas.

En la primera parte de esta ayudantía se presentarán métodos para detectar y describir asociaciones entre variables categóricas.

Esta sesión usaremos la base de datos [issp2012cl][datos1], que pueden descargar desde el [Dropbox][dropbox] del curso. La base contiene variables seleccionadas de la encuesta [ISSP 2012][source1] Family and Changing Gender Roles IV para Chile.



## Tablas de contingencia

El primer paso para investigar la asociación entre variables es generar una tabla de contingencia. Las **tablas de contingencia** son una forma de presentar los datos para el análisis de variables categóricas. Este tipo de tabla da cuenta de el número o proporción de sujetos observados para todas las combinaciones posibles entre variables.

Usando la base de datos [issp2012cl][datos1] generamos una tabla de contingencia entre dos variables categóricas, _sexo_ y _rq30a_, situacion laboral cuando un hijo estaba en edad preescolar. Asumimos que _sexo_ es la variable explicativa y _rq30a_ la variable de respuesta.

```
tab sexo rq30a, row
```
###### Tabla 1 - Situación laboral cuando un hijo estaba en edad preescolar según sexo, porcentajes de fila

<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;margin:0px auto;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
.tg .tg-fckz{color:#333333;border-color:#f9f9f9;text-align:center;vertical-align:top}
.tg .tg-h0yh{background-color:#f9f9f9;color:#333333;border-color:#ffffff;text-align:left;vertical-align:top}
.tg .tg-cypf{background-color:#f0f0f0;color:#333333;border-color:#f0f0f0;text-align:left;vertical-align:top}
.tg .tg-igxt{background-color:#f0f0f0;color:#333333;border-color:#f0f0f0;text-align:center;vertical-align:top}
.tg .tg-idf9{background-color:#f9f9f9;color:#333333;border-color:#ffffff;text-align:center;vertical-align:top}
.tg .tg-cmbj{color:#333333;border-color:#f9f9f9;text-align:left;vertical-align:top}
.tg .tg-hobq{color:#333333;border-color:#ffffff;text-align:left;vertical-align:top}
.tg .tg-juwk{color:#333333;border-color:#ffffff;text-align:center;vertical-align:top}
@media screen and (max-width: 767px) {.tg {width: auto !important;}.tg col {width: auto !important;}.tg-wrap {overflow-x: auto;-webkit-overflow-scrolling: touch;margin: auto 0px;}}</style>
<div class="tg-wrap"><table class="tg">
  <tr>
    <th class="tg-cypf"></th>
    <th class="tg-igxt">Trabajó Jornada completa</th>
    <th class="tg-igxt">Trabajó jornada parcial</th>
    <th class="tg-igxt">No trabajó remuneradamente</th>
    <th class="tg-igxt">Total</th>
  </tr>
  <tr>
    <td class="tg-h0yh">Hombre</td>
    <td class="tg-idf9">377</td>
    <td class="tg-idf9">23</td>
    <td class="tg-idf9">7</td>
    <td class="tg-idf9">407</td>
  </tr>
  <tr>
    <td class="tg-cmbj"></td>
    <td class="tg-fckz">92.6</td>
    <td class="tg-fckz">5.7</td>
    <td class="tg-fckz">1.7</td>
    <td class="tg-fckz">100</td>
  </tr>
  <tr>
    <td class="tg-h0yh">Mujer</td>
    <td class="tg-idf9">279</td>
    <td class="tg-idf9">160</td>
    <td class="tg-idf9">287</td>
    <td class="tg-idf9">726</td>
  </tr>
  <tr>
    <td class="tg-hobq"></td>
    <td class="tg-juwk">38.4</td>
    <td class="tg-juwk">22</td>
    <td class="tg-juwk">39.5</td>
    <td class="tg-juwk">100</td>
  </tr>
  <tr>
    <td class="tg-h0yh">Total</td>
    <td class="tg-idf9">656</td>
    <td class="tg-idf9">183</td>
    <td class="tg-idf9">294</td>
    <td class="tg-idf9">1133</td>
  </tr>
  <tr>
    <td class="tg-hobq"></td>
    <td class="tg-juwk">57.9</td>
    <td class="tg-juwk">16.2</td>
    <td class="tg-juwk">25.9</td>
    <td class="tg-juwk">100</td>
  </tr>
</table></div>
Las frecuencias totales de las filas y de las columnas son llamados **distribuciones marginales**. La distribución marginal de la muestra para situación laboral cuando un hijo estaba en edad preescolar es (656, 183, 294). 

Para estudiar cómo depende la variable de respuesta de la variable explicativa, observamos los porcentajes que reflejan la proporción de la variable explicativa en cada categoría de la variable de respuesta. En el caso de la Tabla 1, corresponden a los porcentajes de fila, es decir, la proporción en cada situación laboral para hombres y mujeres. Estos porcentajes son llamados **distribuciones condicionales**. Reflejan la distribución de la variable dependiente condicional en la variable explicativa. La distribución de situación laboral para las mujeres es el set (38.4,22,39.5) para (Trabajó jornada completa, Trabajó jornada parcial, No trabajó remuneradamente).

También podemos computar distribuciones de la variable explicativa condicional en la variable de resultado, pero convencionalmente se presentan las distribuciones para la variable de resultado.

Otra forma de reportar los porcentajes es mostrar un único set para todas las celdas, usando el tamaño total de la muestra como base. 

```
tab sexo rq30a, cel
```

###### Tabla 2 - Situación laboral cuando un hijo estaba en edad preescolar según sexo, porcentajes de celda

<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;margin:0px auto;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
.tg .tg-fckz{color:#333333;border-color:#f9f9f9;text-align:center;vertical-align:top}
.tg .tg-h0yh{background-color:#f9f9f9;color:#333333;border-color:#ffffff;text-align:left;vertical-align:top}
.tg .tg-cypf{background-color:#f0f0f0;color:#333333;border-color:#f0f0f0;text-align:left;vertical-align:top}
.tg .tg-igxt{background-color:#f0f0f0;color:#333333;border-color:#f0f0f0;text-align:center;vertical-align:top}
.tg .tg-idf9{background-color:#f9f9f9;color:#333333;border-color:#ffffff;text-align:center;vertical-align:top}
.tg .tg-cmbj{color:#333333;border-color:#f9f9f9;text-align:left;vertical-align:top}
.tg .tg-hobq{color:#333333;border-color:#ffffff;text-align:left;vertical-align:top}
.tg .tg-juwk{color:#333333;border-color:#ffffff;text-align:center;vertical-align:top}
@media screen and (max-width: 767px) {.tg {width: auto !important;}.tg col {width: auto !important;}.tg-wrap {overflow-x: auto;-webkit-overflow-scrolling: touch;margin: auto 0px;}}</style>
<div class="tg-wrap"><table class="tg">
  <tr>
    <th class="tg-cypf"></th>
    <th class="tg-igxt">Trabajó Jornada completa</th>
    <th class="tg-igxt">Trabajó jornada parcial</th>
    <th class="tg-igxt">No trabajó remuneradamente</th>
    <th class="tg-igxt">Total</th>
  </tr>
  <tr>
    <td class="tg-h0yh">Hombre</td>
    <td class="tg-idf9">377</td>
    <td class="tg-idf9">23</td>
    <td class="tg-idf9">7</td>
    <td class="tg-idf9">407</td>
  </tr>
  <tr>
    <td class="tg-cmbj"></td>
    <td class="tg-fckz">33.3</td>
    <td class="tg-fckz">2</td>
    <td class="tg-fckz">0.6</td>
    <td class="tg-fckz">35.9</td>
  </tr>
  <tr>
    <td class="tg-h0yh">Mujer</td>
    <td class="tg-idf9">279</td>
    <td class="tg-idf9">160</td>
    <td class="tg-idf9">287</td>
    <td class="tg-idf9">726</td>
  </tr>
  <tr>
    <td class="tg-hobq"></td>
    <td class="tg-juwk">24.6</td>
    <td class="tg-juwk">14.1</td>
    <td class="tg-juwk">25.3</td>
    <td class="tg-juwk">64.1</td>
  </tr>
  <tr>
    <td class="tg-h0yh">Total</td>
    <td class="tg-idf9">656</td>
    <td class="tg-idf9">183</td>
    <td class="tg-idf9">294</td>
    <td class="tg-idf9">1133</td>
  </tr>
  <tr>
    <td class="tg-hobq"></td>
    <td class="tg-juwk">57.9</td>
    <td class="tg-juwk">16.2</td>
    <td class="tg-juwk">25.9</td>
    <td class="tg-juwk">100</td>
  </tr>
</table></div>
En la Tabla 2, de los 1133 sujetos, 287 o 25.3% están en la celda (Mujer, No trabajó remuneradamente). Esta distribución porcentual es llamada **distribución conjunta** de la muestra, y es útil para comparar las frecuencias relativas de ocurrencia para combinaciones de los niveles de las variables. 

Al analizar tablas de contingencia se presentan tres principales preguntas:

-  ***¿Hay asociación entre las variables?*** Se responde al realizar un test de chi-cuadrado de independencia

-  ***¿Cómo difieren los datos respecto a si fueran independientes?*** Para responderla, se utiliza el análisis de los residuos estandarizados.

-  ***¿Qué tan fuerte es la asociación?*** Se usan medidas de asociación, estadísticos que describen la fuerza de la dependencia, como la diferencia de proporciones, formando un intervalo de confianza para estimar la intensidad de la asociación en la población.

   

## Test de Chi-Cuadrado de Independencia
Dos variables categóricas son estadísticamente independientes si las distribuciones condicionales poblacionales de una de las variables son idénticas en cada categoría de la otra variable. Respectivamente, las variables son estadísticamente dependientes si estas distribuciones condicionales no son idénticas.

La definición de independencia estadística se refiere a la población. Dada la variabilidad de muestreo, se puede esperar que los porcentajes de la muestra difieran de los porcentajes de la población. Lo más común es que las distribuciones condicionales de la muestra no sean idénticas, incluso cuando sean independientes. En ese caso, la pregunta es si las diferencias en porcentajes entre las categorías de la variable explicativa en las distribuciones condicionales sean simplemente por variación de muestreo, o si estas diferencias son poco probables aceptando independencia de las variables. 

Estas preguntas son abordadas por un test de significancia que formula las siguientes hipótesis:

$$
H_{0} = Las \, variables \, son \, estadísticamente \,  independientes
$$
$$
H_{a}= Las \, variables \, son \, estadísticamente \, dependientes
$$

El test chi-cuadrado de independencia se sirve de tablas de contingencia para comparar las **frecuencias observadas** en la muestra, denotadas $f_{o}$, con valores que satisfarían la hipótesis nula si esta fuera verdadera, llamadas **frecuencias esperadas** y denotadas $f_{e}$.

```
tab sexo rq30a, exp
```
###### Tabla 3 - Situación laboral cuando un hijo estaba en edad preescolar según sexo, frecuencias observadas y esperadas

<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;margin:0px auto;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
.tg .tg-fckz{color:#333333;border-color:#f9f9f9;text-align:center;vertical-align:top}
.tg .tg-h0yh{background-color:#f9f9f9;color:#333333;border-color:#ffffff;text-align:left;vertical-align:top}
.tg .tg-cypf{background-color:#f0f0f0;color:#333333;border-color:#f0f0f0;text-align:left;vertical-align:top}
.tg .tg-igxt{background-color:#f0f0f0;color:#333333;border-color:#f0f0f0;text-align:center;vertical-align:top}
.tg .tg-idf9{background-color:#f9f9f9;color:#333333;border-color:#ffffff;text-align:center;vertical-align:top}
.tg .tg-cmbj{color:#333333;border-color:#f9f9f9;text-align:left;vertical-align:top}
.tg .tg-hobq{color:#333333;border-color:#ffffff;text-align:left;vertical-align:top}
.tg .tg-juwk{color:#333333;border-color:#ffffff;text-align:center;vertical-align:top}
@media screen and (max-width: 767px) {.tg {width: auto !important;}.tg col {width: auto !important;}.tg-wrap {overflow-x: auto;-webkit-overflow-scrolling: touch;margin: auto 0px;}}</style>
<div class="tg-wrap"><table class="tg">
  <tr>
    <th class="tg-cypf"></th>
    <th class="tg-igxt">Trabajó Jornada completa</th>
    <th class="tg-igxt">Trabajó jornada parcial</th>
    <th class="tg-igxt">No trabajó remuneradamente</th>
    <th class="tg-igxt">Total</th>
  </tr>
  <tr>
    <td class="tg-h0yh">Hombre</td>
    <td class="tg-idf9">377</td>
    <td class="tg-idf9">23</td>
    <td class="tg-idf9">7</td>
    <td class="tg-idf9">407</td>
  </tr>
  <tr>
    <td class="tg-cmbj"></td>
    <td class="tg-fckz">235.7</td>
    <td class="tg-fckz">65.7</td>
    <td class="tg-fckz">105.6</td>
    <td class="tg-fckz">407</td>
  </tr>
  <tr>
    <td class="tg-h0yh">Mujer</td>
    <td class="tg-idf9">279</td>
    <td class="tg-idf9">160</td>
    <td class="tg-idf9">287</td>
    <td class="tg-idf9">726</td>
  </tr>
  <tr>
    <td class="tg-hobq"></td>
    <td class="tg-juwk">420.3</td>
    <td class="tg-juwk">117.3</td>
    <td class="tg-juwk">188.4</td>
    <td class="tg-juwk">726</td>
  </tr>
  <tr>
    <td class="tg-h0yh">Total</td>
    <td class="tg-idf9">656</td>
    <td class="tg-idf9">183</td>
    <td class="tg-idf9">294</td>
    <td class="tg-idf9">1133</td>
  </tr>
  <tr>
    <td class="tg-hobq"></td>
    <td class="tg-juwk">656</td>
    <td class="tg-juwk">183</td>
    <td class="tg-juwk">294</td>
    <td class="tg-juwk">1133</td>
  </tr>
</table></div>

La Tabla 3 muestra las frecuencias observadas $f_{o}$ de nuestro ejemplo de situación laboral por sexo y también las frecuencias esperadas $f_{e}$ que satisfacen la $H_{0}$ de independencia.

Para calcular $f_{e}$ para la fila $i$ de la columna $j$:

$$
f_{eij}=\dfrac{(T_{i}*T_{j})}{N}
$$

Donde $T_{i}$ es el total de la fila $i$ y $T_{j}$ es el total de la columna $j$. Calculemos $f_{e}$ para la celda de las mujeres que no trabajaron remuneradamente cuando tenían un hijo en edad preescolar. 

$$
f_{e}=\dfrac{(726*294)}{1133}
$$

```
dis (726*294)/(1133)
```

$$
f_{e}=\dfrac{(726*294)}{1133}=188.38835
$$

Como aparece en la tabla, $f_{e}=188.4$. En otras palabras, para la muestra completa, 294 de 1133 personas no trabajaron remuneradamente cuando tenían un hijo en edad preescolar, un 25.9%. Si las variables fueran independientes, esperaríamos que 25.9% de las mujeres no trabajaran remuneradamente cuando tenían un hijo en edad preescolar, e idéntica proporción entre los hombres. Ese porcentaje equivale a $f_{e}=188.4$ mujeres, pero en la muestra se observan $f_{o}=287$ que no trabajaron remuneradamente cuando tenían un hijo en edad preescolar. Volveremos a estas diferencias pronto.

El estadístico de prueba del test es **chi-cuadrado**, o $\chi^{2}$. Es equivalente a:

$$
\chi^{2}=\sum\dfrac{(f_{o}-f_{e})^{2}}{f_{e}}
$$

Cuando $H_{0}$ es verdadera, $f_{o}$ y $f_{e}$ son similares en cada celda, y $\chi^{2}$ es relativamente pequeño. Si $H_{0}$ es falsa, $f_{o}$ y $f_{e}$ son disimiles, y $\chi^{2}$ se vuelve mayor.

La distribución muestral de $\chi^{2}$ indica que tan grande debe ser $\chi^{2}$ para que exista evidencia de que $H_{0}$ es falsa. Para muestras grandes esta distribución se corresponde con la **distribución de probabilidad chi-cuadrado**. Sus principales propiedades son:

- Se ubica en el cuadrante positivo de ambos ejes. En otras palabras, $\chi^{2}$ no puede ser negativo. El mínimo valor posible es $\chi^{2}=0$ y ocurre cuando $f_{o}=f_{e}$
- Está sesgada a la derecha.
- Su forma precisa depende de los grados de libertad $df$.
- Su media y desviación estándar equivalen a:
$$
\mu=df
$$
$$
\sigma=\sqrt{2df}
$$
De manera que la distribución se vuelve más dispersa y menos sesgada a la derecha, o más acampanada, en la medida en que crecen los grados de libertad.

###### Figura 1 - Distribución chi cuadrado

![chi2](C:\Users\pjcar\Google Drive\201901 - Diseno y Analisis de la Investigacion Social\sol3000\Ayudantias\A4\img\chi2.png)

Volvamos al ejemplo de situación laboral y sexo. 

```
tab sexo rq30a, chi2 exp row
```

###### Tabla 4 - Situación laboral cuando un hijo estaba en edad preescolar según sexo, frecuencias observadas y esperadas, porcentajes de fila

<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;margin:0px auto;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
.tg .tg-oe15{background-color:#ffffff;border-color:#ffffff;text-align:left;vertical-align:top}
.tg .tg-fckz{color:#333333;border-color:#f9f9f9;text-align:center;vertical-align:top}
.tg .tg-oqs5{background-color:#f9f9f9;border-color:#ffffff;text-align:left;vertical-align:top}
.tg .tg-kaak{background-color:#ffffff;border-color:#ffffff;text-align:left;vertical-align:top}
.tg .tg-zv4m{border-color:#ffffff;text-align:left;vertical-align:top}
.tg .tg-8jgo{border-color:#ffffff;text-align:center;vertical-align:top}
.tg .tg-h0yh{background-color:#f9f9f9;color:#333333;border-color:#ffffff;text-align:left;vertical-align:top}
.tg .tg-cypf{background-color:#f0f0f0;color:#333333;border-color:#f0f0f0;text-align:left;vertical-align:top}
.tg .tg-igxt{background-color:#f0f0f0;color:#333333;border-color:#f0f0f0;text-align:center;vertical-align:top}
.tg .tg-idf9{background-color:#f9f9f9;color:#333333;border-color:#ffffff;text-align:center;vertical-align:top}
.tg .tg-cmbj{color:#333333;border-color:#f9f9f9;text-align:left;vertical-align:top}
.tg .tg-dvqx{background-color:#f9f9f9;border-color:#ffffff;text-align:center;vertical-align:top}
.tg .tg-hobq{color:#333333;border-color:#ffffff;text-align:left;vertical-align:top}
.tg .tg-juwk{color:#333333;border-color:#ffffff;text-align:center;vertical-align:top}
.tg .tg-c1kk{background-color:#ffffff;border-color:#ffffff;text-align:right;vertical-align:top}
.tg .tg-3dev{background-color:#ffffff;border-color:#ffffff;text-align:right;vertical-align:top}
@media screen and (max-width: 767px) {.tg {width: auto !important;}.tg col {width: auto !important;}.tg-wrap {overflow-x: auto;-webkit-overflow-scrolling: touch;margin: auto 0px;}}</style>
<div class="tg-wrap"><table class="tg">
  <tr>
    <th class="tg-cypf"></th>
    <th class="tg-igxt">Trabajó Jornada completa</th>
    <th class="tg-igxt">Trabajó jornada parcial</th>
    <th class="tg-igxt">No trabajó remuneradamente</th>
    <th class="tg-igxt">Total</th>
  </tr>
  <tr>
    <td class="tg-h0yh">Hombre</td>
    <td class="tg-idf9">377</td>
    <td class="tg-idf9">23</td>
    <td class="tg-idf9">7</td>
    <td class="tg-idf9">407</td>
  </tr>
  <tr>
    <td class="tg-cmbj"></td>
    <td class="tg-fckz">235.7</td>
    <td class="tg-fckz">65.7</td>
    <td class="tg-fckz">105.6</td>
    <td class="tg-fckz">407</td>
  </tr>
  <tr>
    <td class="tg-oqs5"></td>
    <td class="tg-dvqx">92.63</td>
    <td class="tg-dvqx">5.65</td>
    <td class="tg-dvqx">1.72</td>
    <td class="tg-dvqx">100</td>
  </tr>
  <tr>
    <td class="tg-hobq">Mujer</td>
    <td class="tg-juwk">279</td>
    <td class="tg-juwk">160</td>
    <td class="tg-juwk">287</td>
    <td class="tg-juwk">726</td>
  </tr>
  <tr>
    <td class="tg-h0yh"></td>
    <td class="tg-idf9">420.3</td>
    <td class="tg-idf9">117.3</td>
    <td class="tg-idf9">188.4</td>
    <td class="tg-idf9">726</td>
  </tr>
  <tr>
    <td class="tg-zv4m"></td>
    <td class="tg-8jgo">38.43</td>
    <td class="tg-8jgo">22.04</td>
    <td class="tg-8jgo">39.53</td>
    <td class="tg-8jgo">100</td>
  </tr>
  <tr>
    <td class="tg-h0yh">Total</td>
    <td class="tg-idf9">656</td>
    <td class="tg-idf9">183</td>
    <td class="tg-idf9">294</td>
    <td class="tg-idf9">1133</td>
  </tr>
  <tr>
    <td class="tg-hobq"></td>
    <td class="tg-juwk">656</td>
    <td class="tg-juwk">183</td>
    <td class="tg-juwk">294</td>
    <td class="tg-juwk">1133</td>
  </tr>
  <tr>
    <td class="tg-oqs5"></td>
    <td class="tg-dvqx">57.9</td>
    <td class="tg-dvqx">16.15</td>
    <td class="tg-dvqx">25.95</td>
    <td class="tg-dvqx">100</td>
  </tr>
  <tr>
    <td class="tg-c1kk">Pearson chi2(2) =</td>
    <td class="tg-oe15">319.3715</td>
    <td class="tg-oe15"></td>
    <td class="tg-oe15"></td>
    <td class="tg-oe15"></td>
  </tr>
  <tr>
    <td class="tg-3dev">Pr =</td>
    <td class="tg-kaak">0.000</td>
    <td class="tg-kaak"></td>
    <td class="tg-kaak"></td>
    <td class="tg-kaak"></td>
  </tr>
</table></div>

Stata reporta un $\chi^{2}(2,N=1133)=319.37$ y un $valor-p=0.000$ y con esta información ya podemos concluir respecto a la hipótesis de independencia estadística.

Vamos paso a paso. Para testear independencia en una tabla de contingencia con $r$ filas y $c$ columnas, necesitamos conocer los grados de libertad $df$:

$$
df=(r-1)*(c-1)
$$

En nuestro ejemplo:

$$
df=(2-1)*(3-1)=2
$$

Tenemos 2 grados de libertad, como indica el output. Obtuvimos un estadístico de prueba $\chi^{2}=319.37$. Podemos evaluarlo en una tabla para la distribución chi-cuadrado.

```
search probtabl	// Buscar e instalar probtabl, no está en SSC
chitable
```
La primera fila de la tabla de la distribución chi cuadrado muestra los niveles de significancia y la primera columna los grados de libertad. Por ejemplo, con $df=2$, $\chi^{2}=5.99$ tiene un $p=0.05$ y $\chi^{2}=9.21$ tiene un $p=0.01$. 

El $valor-p$ equivale a la probabilidad de la cola derecha sobre el valor observado de $\chi^{2}$. Mientras más grande sea $\chi^{2}$, menor es la probabilidad de encontrar, si $H_{0}$ es verdadera, un $\chi^{2}$ sea al menos tan grande como el observado, por lo tanto, mayor es la evidencia contra $H_{0}$. 

El $\chi^{2}=319.37$ que obtuvimos cae más hacia la cola derecha que un $\chi^{2}=13.82$, el valor que tiene una probabilidad de 0.001 de ocurrir si $H_{0}$ es verdadera. Podemos concluir que $p<0.001$. El output de Stata nos entrega un $p=0.000$. Esto entrega evidencia sumamente fuerte contra $H_{0}$ de independencia, permitiéndonos decir que, si las variables fueran independientes, los valores observados serían altamente inusuales para una muestra aleatoria.

Observando el $valor-p$, se puede concluir comparándolo con un $nivel \, \alpha$ determinado. Igual que en otros tests, si $P\leq\alpha$, $H_{0}$ es rechazada. En nuestro ejemplo, el $valor p$ obtenido es menor a todos los $niveles \, \alpha$ convencionales.

El test de chi-cuadrado tiene dos requerimientos para la muestra: supone que se la muestra ha sido obtenida aleatoriamente y que tiene un tamaño lo suficientemente grande como para que la distribución chi-cuadrado sea la distribución del estadístico $\chi^{2}$. Una regla informal es considerar que la frecuencia $f_{e}$ sea mayor a 5 observaciones por celda. 



## Análisis residual

El test de independencia de chi-cuadrado entrega información limitada. Si bien permite dar con evidencia de la asociación entre las variables, no señala nada respecto a la naturaleza o fuerza de dicha asociación. Una comparación celda por celda de las frecuencias esperadas y observadas puede revelar evidencia de patrones de asociación. A las diferencias $f_{o}-f_{e}$ les llamamos **residuos**.  

```
ssc install tab_chi			
tabchi sexo rq30a, raw
```
###### Tabla 5 - Situación laboral cuando un hijo estaba en edad preescolar según sexo, frecuencias observadas y esperadas, residuos

<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;margin:0px auto;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
.tg .tg-oe15{background-color:#ffffff;border-color:#ffffff;text-align:left;vertical-align:top}
.tg .tg-fckz{color:#333333;border-color:#f9f9f9;text-align:center;vertical-align:top}
.tg .tg-oqs5{background-color:#f9f9f9;border-color:#ffffff;text-align:left;vertical-align:top}
.tg .tg-kaak{background-color:#ffffff;border-color:#ffffff;text-align:left;vertical-align:top}
.tg .tg-zv4m{border-color:#ffffff;text-align:left;vertical-align:top}
.tg .tg-8jgo{border-color:#ffffff;text-align:center;vertical-align:top}
.tg .tg-h0yh{background-color:#f9f9f9;color:#333333;border-color:#ffffff;text-align:left;vertical-align:top}
.tg .tg-cypf{background-color:#f0f0f0;color:#333333;border-color:#f0f0f0;text-align:left;vertical-align:top}
.tg .tg-igxt{background-color:#f0f0f0;color:#333333;border-color:#f0f0f0;text-align:center;vertical-align:top}
.tg .tg-idf9{background-color:#f9f9f9;color:#333333;border-color:#ffffff;text-align:center;vertical-align:top}
.tg .tg-cmbj{color:#333333;border-color:#f9f9f9;text-align:left;vertical-align:top}
.tg .tg-dvqx{background-color:#f9f9f9;border-color:#ffffff;text-align:center;vertical-align:top}
.tg .tg-hobq{color:#333333;border-color:#ffffff;text-align:left;vertical-align:top}
.tg .tg-juwk{color:#333333;border-color:#ffffff;text-align:center;vertical-align:top}
.tg .tg-3dev{background-color:#ffffff;border-color:#ffffff;text-align:right;vertical-align:top}
.tg .tg-c1kk{background-color:#ffffff;border-color:#ffffff;text-align:right;vertical-align:top}
@media screen and (max-width: 767px) {.tg {width: auto !important;}.tg col {width: auto !important;}.tg-wrap {overflow-x: auto;-webkit-overflow-scrolling: touch;margin: auto 0px;}}</style>
<div class="tg-wrap"><table class="tg">
  <tr>
    <th class="tg-cypf"></th>
    <th class="tg-igxt">Trabajó Jornada completa</th>
    <th class="tg-igxt">Trabajó jornada parcial</th>
    <th class="tg-igxt">No trabajó remuneradamente</th>
    <th class="tg-igxt">Total</th>
  </tr>
  <tr>
    <td class="tg-h0yh">Hombre</td>
    <td class="tg-idf9">377</td>
    <td class="tg-idf9">23</td>
    <td class="tg-idf9">7</td>
    <td class="tg-idf9">407</td>
  </tr>
  <tr>
    <td class="tg-cmbj"></td>
    <td class="tg-fckz">235.7</td>
    <td class="tg-fckz">65.7</td>
    <td class="tg-fckz">105.6</td>
    <td class="tg-fckz">407</td>
  </tr>
  <tr>
    <td class="tg-oqs5"></td>
    <td class="tg-dvqx">141.4</td>
    <td class="tg-dvqx">-42.7</td>
    <td class="tg-dvqx">-98.6</td>
    <td class="tg-dvqx"></td>
  </tr>
  <tr>
    <td class="tg-hobq">Mujer</td>
    <td class="tg-juwk">279</td>
    <td class="tg-juwk">160</td>
    <td class="tg-juwk">287</td>
    <td class="tg-juwk">726</td>
  </tr>
  <tr>
    <td class="tg-h0yh"></td>
    <td class="tg-idf9">420.3</td>
    <td class="tg-idf9">117.3</td>
    <td class="tg-idf9">188.4</td>
    <td class="tg-idf9">726</td>
  </tr>
  <tr>
    <td class="tg-zv4m"></td>
    <td class="tg-8jgo">-141.4</td>
    <td class="tg-8jgo">42.7</td>
    <td class="tg-8jgo">98.6</td>
    <td class="tg-8jgo"></td>
  </tr>
  <tr>
    <td class="tg-h0yh">Total</td>
    <td class="tg-idf9">656</td>
    <td class="tg-idf9">183</td>
    <td class="tg-idf9">294</td>
    <td class="tg-idf9">1133</td>
  </tr>
  <tr>
    <td class="tg-hobq"></td>
    <td class="tg-juwk">656</td>
    <td class="tg-juwk">183</td>
    <td class="tg-juwk">294</td>
    <td class="tg-juwk">1133</td>
  </tr>
  <tr>
    <td class="tg-3dev">Pearson chi2(2) =</td>
    <td class="tg-kaak">319.3715</td>
    <td class="tg-kaak"></td>
    <td class="tg-kaak"></td>
    <td class="tg-kaak"></td>
  </tr>
  <tr>
    <td class="tg-c1kk">Pr =</td>
    <td class="tg-oe15">0.000</td>
    <td class="tg-oe15"></td>
    <td class="tg-oe15"></td>
    <td class="tg-oe15"></td>
  </tr>
</table></div>

Como se puede intuir, el residuo es positivo si $f_{o}$ es mayor al $f_{e}$ predicho por la independencia, y negativo si $f_{e}$ es mayor al $f_{e}$ predicho por la independencia. 

Para conocer si el residuo es lo suficientemente grande como para indicar una dependencia que no se debe al chance se utiliza una forma estandarizada del residuo que se comporta como un $puntaje-z$:
$$
z=\dfrac{f_{o}-f_{e}}{se}
$$

Donde $se$ denota el error estándar de $f_{o}-f_{e}$ asumiendo que $H_{0}$ es verdadera y equivale a:
$$
se=\sqrt{f_{e}(1-proporcion \, filas)(1-proporcion \, columnas)}
$$

El residuo estandarizado es el número de errores estándar de $f_{o}-f_{e}$ respecto al valor 0 que se espera cuando $H_{0}$ es verdadera. Cuando esto sucede, los residuos estandarizados tienen una distribución estándar normal. Es decir, fluctúan en torno a una media de 0 con una desviación estándar de 1. 

```
tabchi sexo rq30a, adjust
```
###### Tabla 6 - Situación laboral cuando un hijo estaba en edad preescolar según sexo, frecuencias observadas y esperadas, residuos estadarizados

<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;margin:0px auto;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
.tg .tg-oe15{background-color:#ffffff;border-color:#ffffff;text-align:left;vertical-align:top}
.tg .tg-fckz{color:#333333;border-color:#f9f9f9;text-align:center;vertical-align:top}
.tg .tg-oqs5{background-color:#f9f9f9;border-color:#ffffff;text-align:left;vertical-align:top}
.tg .tg-kaak{background-color:#ffffff;border-color:#ffffff;text-align:left;vertical-align:top}
.tg .tg-zv4m{border-color:#ffffff;text-align:left;vertical-align:top}
.tg .tg-8jgo{border-color:#ffffff;text-align:center;vertical-align:top}
.tg .tg-h0yh{background-color:#f9f9f9;color:#333333;border-color:#ffffff;text-align:left;vertical-align:top}
.tg .tg-cypf{background-color:#f0f0f0;color:#333333;border-color:#f0f0f0;text-align:left;vertical-align:top}
.tg .tg-igxt{background-color:#f0f0f0;color:#333333;border-color:#f0f0f0;text-align:center;vertical-align:top}
.tg .tg-idf9{background-color:#f9f9f9;color:#333333;border-color:#ffffff;text-align:center;vertical-align:top}
.tg .tg-cmbj{color:#333333;border-color:#f9f9f9;text-align:left;vertical-align:top}
.tg .tg-dvqx{background-color:#f9f9f9;border-color:#ffffff;text-align:center;vertical-align:top}
.tg .tg-hobq{color:#333333;border-color:#ffffff;text-align:left;vertical-align:top}
.tg .tg-juwk{color:#333333;border-color:#ffffff;text-align:center;vertical-align:top}
.tg .tg-3dev{background-color:#ffffff;border-color:#ffffff;text-align:right;vertical-align:top}
.tg .tg-c1kk{background-color:#ffffff;border-color:#ffffff;text-align:right;vertical-align:top}
@media screen and (max-width: 767px) {.tg {width: auto !important;}.tg col {width: auto !important;}.tg-wrap {overflow-x: auto;-webkit-overflow-scrolling: touch;margin: auto 0px;}}</style>
<div class="tg-wrap"><table class="tg">
  <tr>
    <th class="tg-cypf"></th>
    <th class="tg-igxt">Trabajó Jornada completa</th>
    <th class="tg-igxt">Trabajó jornada parcial</th>
    <th class="tg-igxt">No trabajó remuneradamente</th>
    <th class="tg-igxt">Total</th>
  </tr>
  <tr>
    <td class="tg-h0yh">Hombre</td>
    <td class="tg-idf9">377</td>
    <td class="tg-idf9">23</td>
    <td class="tg-idf9">7</td>
    <td class="tg-idf9">407</td>
  </tr>
  <tr>
    <td class="tg-cmbj"></td>
    <td class="tg-fckz">235.7</td>
    <td class="tg-fckz">65.7</td>
    <td class="tg-fckz">105.6</td>
    <td class="tg-fckz">407</td>
  </tr>
  <tr>
    <td class="tg-oqs5"></td>
    <td class="tg-dvqx">17.7</td>
    <td class="tg-dvqx">-7.2</td>
    <td class="tg-dvqx">-13.9</td>
    <td class="tg-dvqx"></td>
  </tr>
  <tr>
    <td class="tg-hobq">Mujer</td>
    <td class="tg-juwk">279</td>
    <td class="tg-juwk">160</td>
    <td class="tg-juwk">287</td>
    <td class="tg-juwk">726</td>
  </tr>
  <tr>
    <td class="tg-h0yh"></td>
    <td class="tg-idf9">420.3</td>
    <td class="tg-idf9">117.3</td>
    <td class="tg-idf9">188.4</td>
    <td class="tg-idf9">726</td>
  </tr>
  <tr>
    <td class="tg-zv4m"></td>
    <td class="tg-8jgo">-17.7</td>
    <td class="tg-8jgo">7.2</td>
    <td class="tg-8jgo">13.9</td>
    <td class="tg-8jgo"></td>
  </tr>
  <tr>
    <td class="tg-h0yh">Total</td>
    <td class="tg-idf9">656</td>
    <td class="tg-idf9">183</td>
    <td class="tg-idf9">294</td>
    <td class="tg-idf9">1133</td>
  </tr>
  <tr>
    <td class="tg-hobq"></td>
    <td class="tg-juwk">656</td>
    <td class="tg-juwk">183</td>
    <td class="tg-juwk">294</td>
    <td class="tg-juwk">1133</td>
  </tr>
  <tr>
    <td class="tg-3dev">Pearson chi2(2) =</td>
    <td class="tg-kaak">319.3715</td>
    <td class="tg-kaak"></td>
    <td class="tg-kaak"></td>
    <td class="tg-kaak"></td>
  </tr>
  <tr>
    <td class="tg-c1kk">Pr =</td>
    <td class="tg-oe15">0.000</td>
    <td class="tg-oe15"></td>
    <td class="tg-oe15"></td>
    <td class="tg-oe15"></td>
  </tr>
</table></div>

Podemos usar los residuos estandarizados para describir el patrón de asociación entre las celdas. Residuos estandarizados grandes entregan evidencia contra la independencia de dicha celda. Siguiendo la regla empírica, cuando $H_{0}$ es verdadera, hay 5\% de probabilidad de que un residuo estandarizado exceda 2 en valor absoluto. Asimismo, casi todos los valores de residuos estandarizados estarán a -3 o +3 desviaciones de 0, por lo que valores absolutos mayores a 3 constituyen evidencia convincente de que existe asociación en una celda. 

Consideremos en nuestro ejemplo la celda (hombre, trabajó jornada completa), que tiene un residuo estandarizado $z=17.7$. Éste indica que las observaciones en esta celda son mayores a las que esperaríamos si $H_{0}$ es verdadera, habiendo más hombres que trabajaron a jornada completa cuando tenían un hijo en edad preescolar que lo que esperaríamos de haber independencia. Como es de intuir, si consideramos la celda (mujeres, trabajó jornada completa), observamos la situación inversa. En la muestra existen menos mujeres que trabajaron a jornada completa cuando tenían un hijo en edad preescolar que lo que esperaríamos de haber independencia.

El test de chi-cuadrado de independencia es equivalente a un test de igualdad de proporciones entre dos poblaciones para las tablas de contingencia de 2x2 que comparan dos grupos en una variable de respuesta binaria. 

- El estadístico de prueba $z$ se relaciona con $\chi^{2}$ siendo:
$$
\chi^{2}=z^{2}
$$
- Con $df=1$, el $valor \, p$ de la distribución de chi-cuadrado es el mismo que el $valor \, p$ para un test de dos colas con el estadístico $z$
- Con $df=1$, cada residuo estandarizado equivale al estadístico $z$ o su negativo. El cuadrado de cada residuo estandarizado equivale a $\chi^{2}$.

Cuando la tabla a comparar es mayor que 2x2, y $df>1$, necesitamos más de una diferencia de proporciones para describir asociación. Se puede usar un estadístico $z$ para evaluar cada comparación, pero no un solo estadístico $z$ para evaluar un test de independencia general. Eso vuelve necesario al test de chi-cuadrado.

Chi-cuadrado no mide el nivel de asociación entre las variables. Un valor grande de $\chi^{2}$ indica que las variables están asociadas, pero no implica que las variables tengan una asociación fuerte. El valor de $\chi^{2}$ depende de dos cosas: por un lado, se vuelve mayor en la medida en que hay más asociación; pero, por otro, también crece en la medida en que aumenta el N. Para una relación dada, $\chi^{2}$ es una función del tamaño de la muestra. Si, para la misma asociación entre variables en el ejemplo, en vez de tener 1133 casos, hubiésemos tenido 11330 (10 veces más grande), $\chi^{2}$ no habría sido 319.371 sino 3193.71 (también 10 veces más grande). El $valor \, p$, consecuentemente sería incluso menor. Con una muestra grande, incluso la asociación más débil puede ser estadísticamente significativa. 



## Medidas de asociación
Las medidas de asociación son estadísticos o parámetros que describen la fuerza de la dependencia entre dos variables. 

### Diferencia de proporciones
Una medida de asociación fácilmente interpretable es la diferencia de proporciones para una determinada categoría de respuesta. La diferencia de proporciones es 0 cuando las distribuciones condicionales son idénticas, es decir, las variables son independientes. La diferencia es 1 o -1 cuando se da la asociación más fuerte posible. No se espera que los datos tomen estos valores extremos, pero se puede observar que mientras más grande sea el valor absoluto de la diferencia de proporciones, mayor será la asociación entre las variables.
Como ya sabemos, se pueden construir intervalos de confianza para la diferencia de proporciones. 

### Odds ratio
Los odds ratio son una de las medidas más importantes en el análisis de datos categóricos. Para una variable de respuesta binaria, en la que tenemos una probabilidad de éxito $\pi$ y una probabilidad de fracaso $1-\pi$, los odds de éxito son:

$$
Odds=\dfrac{\pi}{1-\pi}
$$

En otras palabras, los odds expresan qué tan frecuente es un evento relativo a cuán frecuentemente no sucede dicho evento. Resume las chances de que dicho evento ocurra versus a que no ocurra. 

Consideremos las variables *sexo* como explicativa y *q30a1*, trabajar a jornada completa cuando se tiene un hijo en edad preescolar, como variable de respuesta y tabulamos.

```
tab sexo rq30a1, row
```

###### Tabla 7 - Trabajo a jornada completa cuando un hijo estaba en edad preescolar según sexo, frecuencias observadas y porcentajes de fila

<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;border:none;border-color:#ccc;margin:0px auto;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:0px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:0px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
.tg .tg-buh4{background-color:#f9f9f9;text-align:left;vertical-align:top}
.tg .tg-0lax{text-align:left;vertical-align:top}
@media screen and (max-width: 767px) {.tg {width: auto !important;}.tg col {width: auto !important;}.tg-wrap {overflow-x: auto;-webkit-overflow-scrolling: touch;margin: auto 0px;}}</style>
<div class="tg-wrap"><table class="tg">
  <tr>
    <th class="tg-0lax"></th>
    <th class="tg-0lax">No</th>
    <th class="tg-0lax">Si</th>
    <th class="tg-0lax">Total</th>
  </tr>
  <tr>
    <td class="tg-buh4">Hombre</td>
    <td class="tg-buh4">30</td>
    <td class="tg-buh4">377</td>
    <td class="tg-buh4">407</td>
  </tr>
  <tr>
    <td class="tg-0lax"></td>
    <td class="tg-0lax">7.37</td>
    <td class="tg-0lax">92.63</td>
    <td class="tg-0lax">100</td>
  </tr>
  <tr>
    <td class="tg-buh4">Mujer</td>
    <td class="tg-buh4">447</td>
    <td class="tg-buh4">279</td>
    <td class="tg-buh4">726</td>
  </tr>
  <tr>
    <td class="tg-0lax"></td>
    <td class="tg-0lax">61.57</td>
    <td class="tg-0lax">38.43</td>
    <td class="tg-0lax">100</td>
  </tr>
  <tr>
    <td class="tg-buh4">Total</td>
    <td class="tg-buh4">477</td>
    <td class="tg-buh4">656</td>
    <td class="tg-buh4">1,133</td>
  </tr>
  <tr>
    <td class="tg-0lax"></td>
    <td class="tg-0lax">42.1</td>
    <td class="tg-0lax">57.9</td>
    <td class="tg-0lax">100</td>
  </tr>
</table></div>

Para los hombres, la proporción que trabajó a jornada completa equivale a $377/407=0.9263$ y la proporción que no trabajó a jornada completa $1-0.9263=0.0737$. Para las mujeres, la proporción que trabajó a jornada completa equivale a $279/726=0.3843$, y la proporción que no lo hizo a $1-0.3843=0.6157$. 

Los odds de trabajar a jornada completa para los hombres son: 

$$
Odds_{h}=\dfrac{\pi_{h}}{1-\pi_{h}}=\dfrac{0.9263}{0.0737}=12.57
$$

Podemos calcular los odds sin las proporciones, usando la razón entre las frecuencias en las celdas. Los odds de trabajar a jornada completa para las mujeres son:

$$
Odds_{m}=\dfrac{\pi_{m}}{1-\pi_{m}}=\dfrac{279}{447}=0.62
$$

La probabilidad de un determinado resultado y los odds de dicho resultado están relacionados así:

$$
\pi=\dfrac{Odds}{Odds+1}
$$

Para los hombres, la probabilidad de trabajar a jornada completa en la situación que especificamos es:
$$
\pi=\dfrac{12.57}{12.57+1}=0.9263
$$

Los odds no toman valores negativos y tienen valores mayores a 1 cuando la probabilidad de éxito es mayor a la de fracaso. Podemos observar que, para los hombres, existe una mayor probabilidad de trabajar a jornada completa que de no trabajar a jornada completa cuando tienen un hijo en edad preescolar, mientras que para las mujeres sus odds menores a 1 indican lo contrario. Podemos interpretar estos odds diciendo que por cada hombre que no trabaja a jornada completa en dicha situación, hay 12.57 hombres que sí lo hacen. Entre las mujeres, por cada mujer que no trabaja a jornada completa, hay 0.62 que sí lo hacen. También podemos presentar los odds de no trabajar a jornada completa.

$$
Odds_{m}=\dfrac{1-\pi_{h}}{\pi_{h}}=\dfrac{447}{279}=\dfrac{1}{0.62}=1.60
$$

Tenemos que por cada mujer que trabaja a jornada completa teniendo hijos en edad preescolar hay 1.60 mujeres que no lo hacen. 

La razón entre los odds de dos grupos se llama **odds ratio** o razón de momios, en español, y es denotada con $\Theta$. Equivale a:

$$
\Theta=\dfrac{odds_{1}}{odds_{2}}=\dfrac{\dfrac{\pi_{1}}{1-\pi_{1}}}{\dfrac{\pi_{2}}{1-\pi_{2}}}
$$

En nuestro caso, el odds ratio de trabajar a jornada completa cuando se tienen hijos en edad preescolar es:
$$
\Theta=\dfrac{odds_{h}}{odds_{m}}=\dfrac{12.5667}{0.6242}=20.13
$$

O viceversa:
$$
\Theta=\dfrac{odds_{m}}{odds_{h}}=\dfrac{0.6242}{12.5667}=0.05
$$

Cuando las variables son independientes, los odds son iguales y $\Theta=1$. El rango posible de los odds ratio va de 0 al infinito: Cuando $\Theta$ toma valores entre 0 y 1, $odds_{1}<odds_{2}$; cuando $\Theta$ toma valores mayores a 1, $odds_{1}>odds_{2}$. Los $\Theta$ que se alejan de 1, ambas direcciones, representan asociaciones más fuertes. 

Como se puede intuir, los odds ratio son una medida de asociación simétrica, pero esta vez considerando valores distintos de $\Theta$. $\Theta=20.13$ y $\Theta=0.05$ representan la misma fuerza de asociación, son recíprocos: Los $odds_{1}$ son 0.05 veces los $odds_{2}$; $odds_{2}$ son 20 veces los $odds_{1}$. 

En nuestro ejemplo, $\Theta=20.13$ es mayor a 1, lo que indica que las chances de trabajar a jornada completa teniendo hijos en edad preescolar de los hombres son cerca de 20 veces más altas que las chances de las mujeres de trabajar a jornada completa en esa situación. 

Se pueden construir intervalos de confianza para los odds ratio, específicamente, para el logaritmo de los odds ratio, dado que su distribución muestral tiende a estar muy sesgada. La distribución asintótica  del logaritmo de los odds ratio es más cercana a la distribución normal.

Los intervalos de confianza equivalen a:
$$
log\Theta \pm z_{1-\alpha}*SE_{log\Theta}
$$

Donde el error estándar asintótico $SE$ de $log\Theta$ es:
$$
SE_{log\Theta}=\sqrt{\dfrac{1}{n_{r1c1}}+\dfrac{1}{n_{r1c2}}+\dfrac{1}{n_{r2c1}}+\dfrac{1}{n_{r2c2}}}
$$

Los valores del intervalo deben ser devueltos a la escala de odds ratio para ser interpretados.

Una forma de obtener los odds ratio y sus intervalos de confianza en Stata es utilizar tablas de epidemiología, específicamente la calculadora de odds ratio para estudios de casos-control. No ahondaremos en este tipo de estudio en sí, más allá de señalar que son estudios retrospectivos que sirven para comparar dos grupos de pacientes, lo que tienen un outcome de interés (casos) y los que no lo tienen (control). En el ejemplo, nuestro outcome de interés es trabajar jornada completa y nuestra variable de exposición es ser hombre o mujer. Si queremos calcular:

$$
\Theta=\dfrac{odds_{m}}{odds_{h}}=0.05
$$

Usamos la calculadora de odds ratio ingresando las frecuencias para los casos (mujeres, trabajan), (hombres,trabajan) y luego los controles (mujeres, no trabajan), (hombres, no trabajan), especificando el nivel de confianza: 

```
cci 279 377 447 30, level(95)
```

El output presenta un $\Theta=0.0497$ y un intervalo de 95% de confianza [0.032,0.075].

Si queremos obtener:
$$
\Theta=\dfrac{odds_{h}}{odds_{m}}=20.13
$$

Ingresamos a la calculadora de odds ratio las frecuencias para los casos (hombres,trabajan), (mujeres, trabajan), luego los controles (hombres, no trabajan), (mujeres, no trabajan), y el nivel de confianza: 

```
cci 377 279 30 447, level(95)
```

Stata presenta un $\Theta=20.133$ y un intervalo de 95% de confianza [13.373, 31.080]. 

### Otras medidas de asociación para variables nominales
Existen otras medidas de asociación para variables nominales, que describen una tendencia general en los datos. No son especialmente útiles cuando las tablas exceden 2x2, porque implican una sobresimplificación. A continuación se presentan algunas de ellas:

#### Coeficiente de contingencia de Pearson
Es una medida de asociación basada en $\chi^{2}$:

$$
C=\sqrt{\dfrac{\chi^{2}}{\chi^{2}+n}}
$$

Sus valores van de 0 a alrededor de 1, donde 0 indica que no hay asociación entre las variables y 1 indica que hay un alto grado de asociación. No obstante, el límite superior del coeficiente de contingencia depende del número de las dimensiones observadas. Para tablas que tienen el mismo número de filas $r$ y columnas $c$:

$$
C_{max}=\sqrt{\dfrac{r-1}{r}}
$$

Para tablas con diferente número de filas $r$ y columnas $c$.

$$
C_{max}=\sqrt[4]{\dfrac{r-1}{r}*\dfrac{c-1}{c}}
$$

Se sugiere que $C$ sea usado sólo si se trabaja con tablas de contingencia de 5x5 o mayores.

#### Coeficiente Phi
Es una medida de asociación basada en $\chi^{2}$ para estudiar la relación entre variables dicotómicas (tablas de 2x2):

$$
\phi=\sqrt{\dfrac{\chi^{2}}{n}}
$$

Sus valores absolutos fluctúan entre 0 y 1. Como prueba de significación estadística, bajo el supuesto de que $\phi=0$, $n*\phi^{2}$ tiene una distribución chi-cuadrado con $df=1$.

#### V de Cramer
También es una medida de asociación basada en $\chi^{2}$:

$$
V=\sqrt{\dfrac{\chi^{2}}{n(min[r,c]-1)}}
$$

Donde $min[r,c]$ es el menor entre el número de filas $r$ y número de columnas $c$. En tablas de 2x2, V de Cramer es igual al Coeficiente Phi. V de Cramer toma valores entre 0 y 1, siendo considerado un valor mayos a 0.3 como asociación significativa. Dado que siempre es un número positivo, V de Cramer no informa acerca de la dirección de la relación.

#### Lambda
Lambda de Goodman y Kruskal es una medida de asociación asimétrica que indica la reducción proporcional del error en la predicción de la frecuencia modal, es decir, el número de aciertos que proporciona el conocer la distribución dividido por el número de errores que se tienen sin conocerla. Para dos variables nominales, una explicativa y otra de resultado, la pregunta detrás de lambda es cuántos errores de predicción habría respecto a los valores de la variable de resultado si los valores de la variable explicativa no son conocidos. Lambda indica el grado en el cual las categorías y frecuencias modales para cada valor de la variable explicativa difieren en general de las categorías y frecuencias modales de la variable de resultado. Lambda es calculada como:

$$
\lambda=\dfrac{(N-M_{y})-(N-\sum m_{y})}{(N-M_{y})}=\dfrac{\sum m_{y}-M_{y}}{(N-M_{y})}
$$

Donde $M_{y}$ es la frecuencia modal global, $\sum m_{y}$ es la suma de las frecuencias modales y $N$ es el total de casos. El numerador es el número de aciertos bajo la predicción conociendo la distribución de la segunda variable, $\sum m_{y}$, menos los aciertos de la predicción sin conocer la segunda variable, $M_{y}$. El denominador son los errores de la predicción sin conocerla, razón por la que lambda toma valores de 0 a 1. 0 indica ninguna reducción de error, por lo tanto, que no existe asociación, mientras que 1 indica perfecta asociación. Una de sus debilidades es que lambda entrega un valor de 0 cuando las categorías modales son iguales para todos los valores de la variable explicativa, incluso si sus frecuencias modales o porcentajes varían. 





En Stata, el comando *tabulate* provee de opciones para calcular algunas de estas medidas de asociación. Volvamos al ejemplo y reportemos $\phi$ para la asociación entre sexo y trabajar jornada completa teniendo hijos en edad preescolar:

```
tab sexo rq30a1, V
```

Como $\phi$ es un caso especial de V de Cramer para tablas de 2x2, usamos la opción V. El output de Stata, nos entrega $\phi=-0.527$. Es negativo, porque Stata usa una fórmula que depende de cómo está ordenada la tabla de contingencia. Para la mayoría de las tablas de 2x2, no importa el orden de las filas y columnas, por lo que sólo usamos el valor positivo de $\phi$. Como regla general, si el valor absoluto de $\phi$ va de 0.0 a 0.19 se considera que la asociación es débil; si $\phi$ va de 0.2 a 0.49, la asociación es moderada, y con $\phi$ desde 0.50, la asociación es fuerte. En nuestro caso, la asociación es fuerte, independiente de que sea estadísticamente significante. Si tuviéramos un N distinto, $\phi$ tendría el mismo valor. 

Para tablas más grandes, usamos el mismo comando, considerando que usamos el estadístico V de Cramer.

```
tab sexo rq30a, V
```
Stata reporta $V=0.531$.



## Asociación entre variables ordinales
Los análisis estadísticos para variables ordinales tienen en consideración que las categorías de estas variables están ordenadas. Los datos ordinales tienen dos tipos de asociación, positivo y negativo: La asociación positiva resulta cuando los sujetos en el sector alto de la escala de una variable tienden a estar en el sector alto de la otra; la asociación negativa ocurre cuando los sujetos que están en el sector alto de una variable están clasificados en el sector bajo en la otra y viceversa. 

### Concordancia y discordancia
Muchas medidas de asociación ordinal se basan en la asociación entregada para todos los pares de observaciones. Un par de observaciones es concordante si el sujeto que está en el nivel alto de una variable también está en un nivel alto en la otra variable. Un par de observaciones es discordante si el sujeto que está en el nivel alto de una variable está en un nivel bajo en la otra variable. 

Los pares de observaciones concordantes entregan evidencia de asociación positiva. Al contrario, mientras más prevalecen los pares discordantes, hay más evidencia de asociación negativa. Por convención, se construyen las tablas de contingencia para variables ordinales de manera que los niveles sean ascendentes o descendentes para ambas variables. Denotamos $C$ como el número de pares de observaciones concordantes y $D$ el número de pares de observaciones discordantes. Para calcular $C$, empezando por la celda que representa un nivel bajo para ambas variables, se multiplica el conteo de una celda por el conteo de cada celda que sea a la vez más alto que aquel en ambas variables. La suma de todos esos productos es $C$. Para calcular $D$, empezando por la celda que representa el nivel más bajo en una variable y el más alto en la otra, se multiplica el conteo de una celda por el conteo de cada celda que sea más alto que aquel en la primera variable y a la vez más bajo que aquel en la segunda. La suma de dichos productos es $D$. 

### Gamma
Cuando $C>D$, la diferencia $C-D$ es positiva e indica una asociación positiva. Cuando $C<D$, la diferencia $C-D$ es negativa y refleja una asociación negativa. Las muestras grandes, con un gran número de pares, tienen diferencias $C-D$ mayores, por lo que estas diferencias son estandarizadas para facilitar la interpretación. Esta estandarización resulta en la medida de asociación llamada gamma ($\gamma$):

$$
\hat{\gamma}=\dfrac{C-D}{C+D}
$$

Los valores de gamma van de -1 a 1, indicando el signo de gamma si la asociación es positiva o negativa y su valor absoluto, la fuerza de la asociación. Otra interpretación de gamma se sigue de la siguiente expresión:

$$
\hat{\gamma}=\dfrac{C-D}{C+D}=\dfrac{C}{C+D}-\dfrac{D}{C+D}
$$

$\hat{\gamma}$ es la diferencia entre $\dfrac{C}{C+D}$ la proporción de pares concordantes y $\dfrac{D}{C+D}$ la proporción de pares discordantes. 

Se puede construir intervalos de confianza para gamma. La distribución muestral de $\hat{\gamma}$ de las muestras es aproximadamente normal en torno a $\gamma$ poblacional. Su error estándar $se$ describe la variación de $\hat{\gamma}$ en torno a $\gamma$ para muestras de un determinado tamaño. El intervalo de confianza tiene la forma:

$$
\hat{\gamma} \pm z_{1-\alpha}*SE_{\hat{\gamma}}
$$

La inferencia se aplica de mejor forma en las muestras aleatorias grandes. Como regla general, cada $C$ y $D$ debe ser mayor a 50.

También se puede testear la independencia de las variables usando gamma. La hipótesis nula predice que las variables son estadísticamente independientes. Las hipótesis alternativas indican que las variables son estadísticamente dependientes, y pueden tomar una forma de dos colas o de una cola que prediga la dirección de la asociación:

$$
H_{a} : \gamma \neq 0
$$

$$
H_{a} : \gamma > 0
$$

$$
H_{a} : \gamma < 0
$$

El estadístico de prueba es $z$ y expresa la diferencia entre $\hat{\gamma}$ y el valor 0 que tomaría cuando $H_{0}$ es verdadera, dividido por el error estándar:

$$
z=\dfrac{\hat{\gamma}-0}{se}
$$

Como ejemplo, generamos una tabla de contingencia entre dos variables ordinales, *srelig* y *fhomo*. *srelig* describe la frecuencia con la cuál se asiste a servicios religiosos y *fhomo*, el nivel de acuerdo respecto a la afirmación "Una pareja de homosexuales (gays) pueden criar a un niño/a tan bien como una pareja heterosexual''. Especificamos la opción gamma. 

```
tab srelig fhomo, row gamma
```

###### Tabla 8 - Percepción familia homoparental según frecuencia de asistencia a servicios religiosos, frecuencias observadas y porcentajes de fila

<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;border:none;border-color:#ccc;margin:0px auto;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:0px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:0px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
.tg .tg-oe15{background-color:#ffffff;border-color:#ffffff;text-align:left;vertical-align:top}
.tg .tg-kaak{background-color:#ffffff;border-color:#ffffff;text-align:left;vertical-align:top}
.tg .tg-baqh{text-align:center;vertical-align:top}
.tg .tg-buh4{background-color:#f9f9f9;text-align:left;vertical-align:top}
.tg .tg-0lax{text-align:left;vertical-align:top}
.tg .tg-dzk6{background-color:#f9f9f9;text-align:center;vertical-align:top}
.tg .tg-3dev{background-color:#ffffff;border-color:#ffffff;text-align:right;vertical-align:top}
.tg .tg-c1kk{background-color:#ffffff;border-color:#ffffff;text-align:right;vertical-align:top}
@media screen and (max-width: 767px) {.tg {width: auto !important;}.tg col {width: auto !important;}.tg-wrap {overflow-x: auto;-webkit-overflow-scrolling: touch;margin: auto 0px;}}</style>
<div class="tg-wrap"><table class="tg">
  <tr>
    <th class="tg-0lax"></th>
    <th class="tg-baqh">Muy en desacuerdo</th>
    <th class="tg-baqh">En desacuerdo</th>
    <th class="tg-baqh">Ni de acuerdo ni en desacuerdo</th>
    <th class="tg-baqh">De acuerdo</th>
    <th class="tg-baqh">Muy de acuerdo</th>
    <th class="tg-baqh">Total</th>
  </tr>
  <tr>
    <td class="tg-buh4">Menos de 1 vez p/a</td>
    <td class="tg-dzk6">88</td>
    <td class="tg-dzk6">210</td>
    <td class="tg-dzk6">60</td>
    <td class="tg-dzk6">173</td>
    <td class="tg-dzk6">39</td>
    <td class="tg-dzk6">570</td>
  </tr>
  <tr>
    <td class="tg-0lax"></td>
    <td class="tg-baqh">15.44</td>
    <td class="tg-baqh">36.84</td>
    <td class="tg-baqh">10.53</td>
    <td class="tg-baqh">30.35</td>
    <td class="tg-baqh">6.84</td>
    <td class="tg-baqh">100</td>
  </tr>
  <tr>
    <td class="tg-buh4">1 o más veces p/a</td>
    <td class="tg-dzk6">66</td>
    <td class="tg-dzk6">139</td>
    <td class="tg-dzk6">63</td>
    <td class="tg-dzk6">86</td>
    <td class="tg-dzk6">11</td>
    <td class="tg-dzk6">365</td>
  </tr>
  <tr>
    <td class="tg-0lax"></td>
    <td class="tg-baqh">18.08</td>
    <td class="tg-baqh">38.08</td>
    <td class="tg-baqh">17.26</td>
    <td class="tg-baqh">23.56</td>
    <td class="tg-baqh">3.01</td>
    <td class="tg-baqh">100</td>
  </tr>
  <tr>
    <td class="tg-buh4">1-3 veces p/m</td>
    <td class="tg-dzk6">38</td>
    <td class="tg-dzk6">93</td>
    <td class="tg-dzk6">37</td>
    <td class="tg-dzk6">62</td>
    <td class="tg-dzk6">11</td>
    <td class="tg-dzk6">241</td>
  </tr>
  <tr>
    <td class="tg-0lax"></td>
    <td class="tg-baqh">15.77</td>
    <td class="tg-baqh">38.59</td>
    <td class="tg-baqh">15.35</td>
    <td class="tg-baqh">25.73</td>
    <td class="tg-baqh">4.56</td>
    <td class="tg-baqh">100</td>
  </tr>
  <tr>
    <td class="tg-buh4">1 o más veces p/s</td>
    <td class="tg-dzk6">90</td>
    <td class="tg-dzk6">130</td>
    <td class="tg-dzk6">14</td>
    <td class="tg-dzk6">25</td>
    <td class="tg-dzk6">4</td>
    <td class="tg-dzk6">263</td>
  </tr>
  <tr>
    <td class="tg-0lax"></td>
    <td class="tg-baqh">34.22</td>
    <td class="tg-baqh">49.43</td>
    <td class="tg-baqh">5.32</td>
    <td class="tg-baqh">9.51</td>
    <td class="tg-baqh">1.52</td>
    <td class="tg-baqh">100</td>
  </tr>
  <tr>
    <td class="tg-buh4">Total</td>
    <td class="tg-dzk6">282</td>
    <td class="tg-dzk6">572</td>
    <td class="tg-dzk6">174</td>
    <td class="tg-dzk6">346</td>
    <td class="tg-dzk6">65</td>
    <td class="tg-dzk6">1439</td>
  </tr>
  <tr>
    <td class="tg-0lax"></td>
    <td class="tg-baqh">19.6</td>
    <td class="tg-baqh">39.75</td>
    <td class="tg-baqh">12.09</td>
    <td class="tg-baqh">24.04</td>
    <td class="tg-baqh">4.52</td>
    <td class="tg-baqh">100</td>
  </tr>
  <tr>
    <td class="tg-3dev">gamma =</td>
    <td class="tg-kaak">-0.2378</td>
    <td class="tg-kaak"></td>
    <td class="tg-kaak"></td>
    <td class="tg-kaak"></td>
    <td class="tg-kaak"></td>
    <td class="tg-kaak"></td>
  </tr>
  <tr>
    <td class="tg-c1kk">ASE =</td>
    <td class="tg-oe15">0.030</td>
    <td class="tg-oe15"></td>
    <td class="tg-oe15"></td>
    <td class="tg-oe15"></td>
    <td class="tg-oe15"></td>
    <td class="tg-oe15"></td>
  </tr>
</table></div>

Stata reporta $\gamma=-0.238$ y un error estándar asimptótico de $ASE=0.030$. Gamma es menor que 0, lo que indica que las variables están negativamente asociadas: al aumentar la frecuencia de asistencia a servicios religiosos, disminuye el grado de acuerdo con que una pareja de homosexuales pueda criar a un niño/a tan bien como una pareja heterosexual.

Si bien el output no entrega un intervalo de confianza ni tampoco un $valor \, p$, podemos calcularlos usando $ASE$. 

$$
\hat{\gamma} \pm z_{1-\alpha}*SE_{\hat{\gamma}}
$$
$$
-0.238 \pm 1.96*0.030
$$
$$
[-0.2968,-0.1792]
$$

Para testear independencia, formulemos $H_{0}: Independencia$ y $H_{a}: \gamma \neq 0$. El estadístico de prueba es $z$ y equivale a:
$$
z=\dfrac{\hat{\gamma}-0}{ase}
$$
$$
z= \dfrac{-0.238}{0.030}=-7.933
$$

Miramos en la tabla z, aunque no lo necesitamos porque el valor del estadístico es grande.

```
ztable
* o
ztable, cum
```
El $valor \, p < 0.00001$, por lo que rechazamos la hipótesis nula de independencia. Concluimos que hay una asociación ordenada entre frecuencia de asistencia a servicios religiosos y el nivel de acuerdo respecto a la afirmación "Una pareja de homosexuales (gays) pueden criar a un niño/a tan bien como una pareja heterosexual''. 

Usualmente se prefiere un test de independencia basado en una medida de asociación ordinal como gamma por sobre un test de chi-cuadrado cuando ambas variables son ordinales. El estadístico $\chi^{2}$ ignora el orden de las categorías, tomando el mismo valor bajo ordenaciones distintas. Si existe una tendencia positiva o negativa, las medidas ordinales son usualmente más poderosas en su detección. 

No obstante, existen casos en los que el test de chi-cuadrado podría ser más poderoso. La razón de esto es que la hipótesis nula de independencia no equivale necesariamente a $H_{0} : \gamma = 0$. Si bien la independencia implica $\gamma = 0$, puede existir casos en los que haya dependencia y $\gamma = 0$. Esto sucede cuando hay más de una única tendencia de asociación y las proporciones de $C$ y $D$ son iguales. En ese caso, el test de chi-cuadrado se comporta mejor que un test de medida ordinal. En la práctica, sin embargo, la mayoría de las relaciones tiene una única tendencia primaria, por lo que se prefieren los test ordinales. 

Para análisis entre variables ordinales y nominales dicotómicas, las medidas de asociación ordinales mantienen su validez. En ese caso, el signo de la medida indica qué nivel de la variable nominal está asociada con las respuestas de nivel alto de la variable ordinal. Cuando las variables nominales tienen más de una categoría, no es apropiado usar medidas de asociación ordinales. 

###  Otras medidas de asociación para variables ordinales
Otras medidas de asociación son **Tau-b** y **Tau-c de Kendall**, **Rho-b** y **Rho-c de Spearman** y **D de Somers**. Todas estas medidas tienen características similares:

- Toman valores entre -1 a +1, su signo indica la dirección de la asociación.
- Su valor absoluto indica la fuerza de la asociación.
- Cuando las variables son estadísticamente independientes, sus valores poblacionales son 0.
- Con excepción de D de Somers, las medidas ordinales de asociación no distinguen entre variables de respuesta y explicativas. 

###  Tablas interactivas
Stata nos permite generar análisis para tablas de contingencia incluso si no tenemos una base de datos para generarlas, a partir de las frecuencias condicionales. Por ejemplo, supongamos que nos encontramos con el fragmento de un reporte, basado en una muestra de datos de la GSS del 2002 para Estados Unidos. El fragmento señala que, de los 484 hombres de la muestra, 215 están de acuerdo con el aborto si la mujer lo desea, bajo cualquier situación, mientras que, entre las 416 mujeres de la muestra, 176 están de acuerdo con el aborto bajo dichas condiciones. 

Calculamos las frecuencias condicionales. Entre los hombres, 215 están de acuerdo y $484-215=269$ no están de acuerdo. Entre las mujeres, 172 están de acuerdo y $416-172=244$ no están de acuerdo. Utilizamos *tabi* ingresando estas frecuencias. Podemos especificar las opciones de porcentajes fila, columna o celda y los estadísticos *chi2*, *V*, *gamma* entre otros. 

```
tabi 215 269 \ 172 244, row chi2 V
```

###### Tabla 9 - Aprobación aborto si la mujer lo desea, bajo cualquier situación, según sexo

<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;border:none;border-color:#ccc;margin:0px auto;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:0px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:0px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
.tg .tg-oe15{background-color:#ffffff;border-color:#ffffff;text-align:left;vertical-align:top}
.tg .tg-kaak{background-color:#ffffff;border-color:#ffffff;text-align:left;vertical-align:top}
.tg .tg-buh4{background-color:#f9f9f9;text-align:left;vertical-align:top}
.tg .tg-0lax{text-align:left;vertical-align:top}
@media screen and (max-width: 767px) {.tg {width: auto !important;}.tg col {width: auto !important;}.tg-wrap {overflow-x: auto;-webkit-overflow-scrolling: touch;margin: auto 0px;}}</style>
<div class="tg-wrap"><table class="tg">
  <tr>
    <th class="tg-0lax"></th>
    <th class="tg-0lax">1</th>
    <th class="tg-0lax">2</th>
    <th class="tg-0lax">Total</th>
  </tr>
  <tr>
    <td class="tg-buh4">1</td>
    <td class="tg-buh4">215</td>
    <td class="tg-buh4">269</td>
    <td class="tg-buh4">484</td>
  </tr>
  <tr>
    <td class="tg-0lax"></td>
    <td class="tg-0lax">44.42</td>
    <td class="tg-0lax">55.58</td>
    <td class="tg-0lax">100</td>
  </tr>
  <tr>
    <td class="tg-buh4">2</td>
    <td class="tg-buh4">172</td>
    <td class="tg-buh4">244</td>
    <td class="tg-buh4">416</td>
  </tr>
  <tr>
    <td class="tg-0lax"></td>
    <td class="tg-0lax">41.35</td>
    <td class="tg-0lax">58.65</td>
    <td class="tg-0lax">100</td>
  </tr>
  <tr>
    <td class="tg-buh4">Total</td>
    <td class="tg-buh4">387</td>
    <td class="tg-buh4">513</td>
    <td class="tg-buh4">900</td>
  </tr>
  <tr>
    <td class="tg-0lax"></td>
    <td class="tg-0lax">43.00</td>
    <td class="tg-0lax">57.00</td>
    <td class="tg-0lax">100</td>
  </tr>
  <tr>
    <td class="tg-kaak">Pearson chi2(1) =</td>
    <td class="tg-kaak">0.8633</td>
    <td class="tg-kaak"></td>
    <td class="tg-kaak"></td>
  </tr>
  <tr>
    <td class="tg-oe15">Pr =</td>
    <td class="tg-oe15">0.353</td>
    <td class="tg-oe15"></td>
    <td class="tg-oe15"></td>
  </tr>
  <tr>
    <td class="tg-kaak">Cramér's V =</td>
    <td class="tg-kaak">0.0310</td>
    <td class="tg-kaak"></td>
    <td class="tg-kaak"></td>
  </tr>
</table></div>

[dropbox]: http://example.com/  "Dropbox SOL3000"
[datos1]: http://example.com/  "Datos 1"
[source1]: http://observatorio.ministeriodesarrollosocial.gob.cl/casen-multidimensional/casen/casen_2017.php  "Fuente"

