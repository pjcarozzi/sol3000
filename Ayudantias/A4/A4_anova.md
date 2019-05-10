Ayudantia 4 - ANOVA
==================

Pia Carozzi

PUC

*pjcarozzi\@uc.cl*

------

El método inferencial que permite comparar las medias de varios grupos, o indagar en la asociación entre una variable de respuesta cuantitativa y una variable explicativa categórica, se llama **Análisis de Varianza** o **ANOVA**. 

En esta segunda parte de la ayudantía, se presenta ANOVA para muestras independientes.

Usaremos la base de datos [issp2012cl][datos1], que pueden descargar desde el [Dropbox][dropbox] del curso. La base contiene variables seleccionadas de la encuesta [ISSP 2012][source1] Family and Changing Gender Roles IV para Chile.



## Test F
ANOVA se desarrolla a partir de un test de significancia que usa la distribución F para detectar diferencias entre un set de medias poblacionales.

Establezcamos que $G$ es el número de grupos a comparar. Las medias de la variable de respuesta para las respectivas poblaciones serán $\mu_{1},\mu_{2},\mu_{3},...,\mu_{g}$. Las medias de la variable de respuesta para las muestras serán $\bar{y}_{1},\bar{y}_{2},\bar{y}_{3},...,\bar{y}_{g}$. ANOVA es un test F para:

$$
H_{0}:mu_{1}=\mu_{2}=\mu_{3}=...=\mu_{g}
$$

$$
H_{a}:Al \, menos \, dos \, de \, las \, medias \, poblacionales \, son \, distintas
$$

Si $H_{0}$ es falsa, 1, 2, 3 o $G$ medias poblacionales pueden ser distintas. El test analiza si estas diferencias observadas podrían haber ocurrido por azar, si $H_{0}$ es verdadera.

El test supone que: 
- Para cada grupo, las distribuciones poblacionales de la variable $Y$ son normales.
- La desviación estándar $\sigma$ de la distribución poblacional es la misma para cada grupo.
- Las muestras de las poblaciones son aleatorias e independientes.

ANOVA usa dos estimaciones de varianza $\sigma^{2}$ para cada grupo. Una es la variabilidad *entre* grupos, de las medias de las muestras $\bar{y}_{i}$ respecto a la media total $\bar{y}$, llamada estimación **between-groups**. La otra, llamada estimación **within-groups**, es la variabilidad, dentro de cada grupo, de las observaciones respecto a la media de la muestra $\bar{y}_{i}$. 

Usando la base de datos [issp2012cl][datos1] ejecutemos un test de ANOVA para la media de *htrab* según grupos de *remp*. *htrab* contiene las horas trabajados por los encuestados a la semana y *remp* describe su relación laboral, según los grupos: "Empleado'', "Independiente sin empleados'', "Independiente con empleados'' y "Trabaja ayudando negocio familiar''.

El comando *oneway* ejecuta un ANOVA, especificando primero la variable de respuesta y luego la variable de grupo o variable explicativa. La opción *tab* entrega descriptivos de *htrab* para los grupos estudiados y nos servirá para interpretar los resultados.

```
oneway htrab remp, tab
```
###### Tabla 1 - Descriptivos para Horas de Trabajo a la Semana por Relación de Empleo

<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;margin:0px auto;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
.tg .tg-fckz{color:#333333;border-color:#f9f9f9;text-align:center;vertical-align:top}
.tg .tg-oqs5{background-color:#f9f9f9;border-color:#ffffff;text-align:left;vertical-align:top}
.tg .tg-h0yh{background-color:#f9f9f9;color:#333333;border-color:#ffffff;text-align:left;vertical-align:top}
.tg .tg-cypf{background-color:#f0f0f0;color:#333333;border-color:#f0f0f0;text-align:left;vertical-align:top}
.tg .tg-igxt{background-color:#f0f0f0;color:#333333;border-color:#f0f0f0;text-align:center;vertical-align:top}
.tg .tg-idf9{background-color:#f9f9f9;color:#333333;border-color:#ffffff;text-align:center;vertical-align:top}
.tg .tg-cmbj{color:#333333;border-color:#f9f9f9;text-align:left;vertical-align:top}
.tg .tg-dvqx{background-color:#f9f9f9;border-color:#ffffff;text-align:center;vertical-align:top}
.tg .tg-hobq{color:#333333;border-color:#ffffff;text-align:left;vertical-align:top}
.tg .tg-juwk{color:#333333;border-color:#ffffff;text-align:center;vertical-align:top}
@media screen and (max-width: 767px) {.tg {width: auto !important;}.tg col {width: auto !important;}.tg-wrap {overflow-x: auto;-webkit-overflow-scrolling: touch;margin: auto 0px;}}</style>
<div class="tg-wrap"><table class="tg">
  <tr>
    <th class="tg-cypf">Relación de Empleo</th>
    <th class="tg-igxt">Media</th>
    <th class="tg-igxt">SD</th>
    <th class="tg-igxt">Frecuencia</th>
  </tr>
  <tr>
    <td class="tg-h0yh">Empleado</td>
    <td class="tg-idf9">44.4496</td>
    <td class="tg-idf9">12.8875</td>
    <td class="tg-idf9">536</td>
  </tr>
  <tr>
    <td class="tg-cmbj">Independiente sin empleados</td>
    <td class="tg-fckz">43.5631</td>
    <td class="tg-fckz">18.8657</td>
    <td class="tg-fckz">103</td>
  </tr>
  <tr>
    <td class="tg-oqs5">Independiente con empleados</td>
    <td class="tg-dvqx">54.3704</td>
    <td class="tg-dvqx">20.0176</td>
    <td class="tg-dvqx">27</td>
  </tr>
  <tr>
    <td class="tg-hobq">Trabaja ayudando negocio familiar</td>
    <td class="tg-juwk">38.7500</td>
    <td class="tg-juwk">31.2557</td>
    <td class="tg-juwk">4</td>
  </tr>
  <tr>
    <td class="tg-h0yh">Total</td>
    <td class="tg-idf9">44.6791</td>
    <td class="tg-idf9">14.5353</td>
    <td class="tg-idf9">670</td>
  </tr>
</table></div>

###### Tabla 2 - ANOVA para Horas de Trabajo a la Semana por Relación de Empleo
<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;border:none;border-color:#ccc;margin:0px auto;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:0px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:0px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
.tg .tg-oe15{background-color:#ffffff;border-color:#ffffff;text-align:left;vertical-align:top}
.tg .tg-kaak{background-color:#ffffff;border-color:#ffffff;text-align:left;vertical-align:top}
.tg .tg-c3ow{border-color:inherit;text-align:center;vertical-align:top}
.tg .tg-l6ga{border-color:#f0f0f0;text-align:center;vertical-align:top}
.tg .tg-mv9k{border-color:#f0f0f0;text-align:left;vertical-align:top}
.tg .tg-btxf{background-color:#f9f9f9;border-color:inherit;text-align:left;vertical-align:top}
.tg .tg-abip{background-color:#f9f9f9;border-color:inherit;text-align:center;vertical-align:top}
.tg .tg-0pky{border-color:inherit;text-align:left;vertical-align:top}
.tg .tg-c1kk{background-color:#ffffff;border-color:#ffffff;text-align:right;vertical-align:top}
.tg .tg-3dev{background-color:#ffffff;border-color:#ffffff;text-align:right;vertical-align:top}
@media screen and (max-width: 767px) {.tg {width: auto !important;}.tg col {width: auto !important;}.tg-wrap {overflow-x: auto;-webkit-overflow-scrolling: touch;margin: auto 0px;}}</style>
<div class="tg-wrap"><table class="tg">
  <tr>
    <th class="tg-mv9k">Fuente</th>
    <th class="tg-l6ga">SS</th>
    <th class="tg-l6ga">df</th>
    <th class="tg-l6ga">MS</th>
    <th class="tg-l6ga">F</th>
    <th class="tg-l6ga">Prob &gt; F</th>
  </tr>
  <tr>
    <td class="tg-btxf">Entre grupos</td>
    <td class="tg-abip">2832.98144</td>
    <td class="tg-abip">3</td>
    <td class="tg-abip">944.327145</td>
    <td class="tg-abip">4.54</td>
    <td class="tg-abip">0.0037</td>
  </tr>
  <tr>
    <td class="tg-0pky">Intra grupos</td>
    <td class="tg-c3ow">138509.026</td>
    <td class="tg-c3ow">666</td>
    <td class="tg-c3ow">207971511</td>
    <td class="tg-c3ow"></td>
    <td class="tg-c3ow"></td>
  </tr>
  <tr>
    <td class="tg-btxf">Total</td>
    <td class="tg-abip">141342.007</td>
    <td class="tg-abip">669</td>
    <td class="tg-abip">211.273554</td>
    <td class="tg-abip"></td>
    <td class="tg-abip"></td>
  </tr>
  <tr>
    <td class="tg-c1kk">Test de Barlett para igualdad de varianzas:</td>
    <td class="tg-c1kk"></td>
    <td class="tg-oe15"></td>
    <td class="tg-c1kk"></td>
    <td class="tg-c1kk"></td>
    <td class="tg-oe15"></td>
  </tr>
  <tr>
    <td class="tg-3dev">chi2(3) =</td>
    <td class="tg-kaak">42.0352</td>
    <td class="tg-kaak"></td>
    <td class="tg-kaak">Prob&gt;chi2 =</td>      
    <td class="tg-kaak">0.000</td>
    <td class="tg-kaak"></td>      
  </tr>
</table></div>

Detengámonos en los siguientes elementos constituyentes de ANOVA: 
- SS, o la suma de cuadrados, para las fuentes de variación between-groups y within-groups.
- MS, o media de cuadrados. Son la estimación between-groups y within-groups de la varianza de la población $\sigma^{2}$.
- El estadístico $F$, que es la razón entre los dos cuadrados medios.

A continuación, se presentará la manera en la que estos elementos son estimados.

### Estimación de varianza within-groups
La estimación within-groups está compuesta, por un lado, por la **suma de cuadrados within**, que es la suma las sumas de cuadrado de las observaciones respecto a la media de cada grupo: 

$$
WSS=\sum_{g}^{G}\sum_{i}^{n}(y_{ig}-\bar{y}_{g})^{2}
$$

La suma de cuadrados within tiene grados de libertad que equivalen a la suma de los grados de libertad de sus partes componentes.

$$
df_{W}=(n_{1}-1)+(n_{2}-1)+...+(n_{g}-1)=(n_{1}+n_{2}+...+n_{g})-g=N-G
$$

Donde $N$ es el tamaño total de la muestra y $G$ el número de grupos. En nuestro ejemplo $WSS=138509.026$.

La estimación de la varianza within-groups para los $G$ grupos es la razón llamada **media de cuadrados within** o **media de cuadrados de los errores**:

$$
s^{2}=MSE=\dfrac{WSS}{df_{W}}=\dfrac{\sum_{g}^{G}\sum_{i}^{n}(y_{ig}-\bar{y}_{g})^{2}}{N-G}
$$

La estimación equivale al promedio ponderado de las varianzas $s_{g}^{2}$ de las muestras, dando mayor ponderación a las muestras más grandes. En nuestro ejemplo, $df_{W}=666$ y $WSS=138509.026$ 

$$
MSE=\dfrac{WSS}{df_{W}}=\dfrac{138509.026}{666}=207.97151
$$

Suma de cuadrados que equivale a lo entregado por el output de Stata, bajo MS Within groups, $207.971511$.

### Estimación de varianza between-groups
La estimación between-groups se basa en la variabilidad entre cada media de muestra y la media general, y es descrita por la **suma de cuadrados between**:
$$
BSS=\sum_{g}^{G}\sum_{i}^{n} n_{g}(\bar{y}_{g}-\bar{y})^{2}
$$

En nuestro ejemplo, Stata nos entrega $BSS=2832.98144$.

La suma de cuadrados between es la suma de las diferencias entre la media de cada muestra y la media general, ponderada por el tamaño de la muestra. Los grados de libertad para describir la variabilidad entre los grupos son:
$$
df_{B}=G-1
$$

La estimación de la varianza between-groups equivale a la **media de cuadrados between** estimada por la razón:
$$
MSB=\dfrac{BSS}{df_{B}}=\dfrac{\sum_{g}^{G}\sum_{i}^{n} n_{g}(\bar{y}_{g}-\bar{y})^{2}}{G-1}
$$

En nuestro ejemplo, Stata nos entrega $df_{B}=3$ y $BSS=2832.98144$.
$$
MSB=\dfrac{BSS}{df_{B}}=\dfrac{2832.98144}{3}=944.32715
$$

Lo que equivale al resultado entregado en el output de Stata, Bajo MS between groups, $944.327145$. 

Cuando las medias poblacionales son más desiguales, la suma de cuadrados between es mayor, la estimación between-groups es mayor y el estadístico $F$ es mayor.

La suma de la suma de cuadrados within y between-groups es llamada **suma total de cuadrados**, y equivale a:

$$
TSS=WSS+BSS=\sum_{g}^{G}\sum_{i}^{n} (y_{ig}-\bar{y})^{2}
$$

En otras palabras, ANOVA divide la variabilidad total en torno a la media general, TSS, en dos partes independientes. Mientras que BSS es la porción del total explicado por la diferencia de cada media respecto a la media general, WSS es la porción de la variabilidad total que no puede ser explicado por las diferencias entre muestras y persiste después de haber clasificado las observaciones en grupos.

El output de Stata también entrega la suma de cuadrados total y media de cuadrados total, podemos observar $TSS=141342.007$ y $MST=211.273554$ 

### Estadístico F
Finalmente, el estadístico F equivale a la razón:
$$
F=\dfrac{MSB}{MSE}
$$

La estimación within-groups es una estimación insesgada de $\sigma^{2}$, sea o no verdadera $H_{0}$. La estimación between-groups es insesgada sólo cuando $H_{0}$ es verdadera. En el escenario en que $H_{0}$ es verdadera, $F$ toma valores cercanos a 1.0. Si $H_{0}$ es falsa, en cambio, la estimación between-groups tiende a sobreestimar $\sigma^{2}$ y a ser más grande que la estimación within-groups, por lo que $F$ es mayor que 1.0.

Cuando $H_{0}$ es verdadera $F$ tiene una distribución muestral $F$. El $valor \, p$ es la probabilidad de cola derecha de que $F$ exceda el valor $F$ observado. A mayor $F$, menor $valor \, p$.

Si aplicamos un test F de ANOVA a datos que provienen de 2 grupos, el estadístico de prueba $F$ equivaldría al cuadrado del estadístico $t$. El $valor \, p$ de $F$ es el mismo que el $valor \, p$ de dos colas para el test $t$. 

Volvamos a nuestro ejemplo y planteemos el problema de investigación. Queremos testear si hay diferencias en las horas trabajadas por semana entre trabajadores que tienen distintos tipos de relación laboral, constituyendo los grupos: "Empleado'', "Independiente sin empleados'', "Independiente con empleados'' y "Trabaja ayudando negocio familiar''.

Volvamos al output de Stata. 

```
oneway htrab remp, tab
```
###### Tabla 1 - Descriptivos para Horas de Trabajo a la Semana por Relación de Empleo

<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;margin:0px auto;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
.tg .tg-fckz{color:#333333;border-color:#f9f9f9;text-align:center;vertical-align:top}
.tg .tg-oqs5{background-color:#f9f9f9;border-color:#ffffff;text-align:left;vertical-align:top}
.tg .tg-h0yh{background-color:#f9f9f9;color:#333333;border-color:#ffffff;text-align:left;vertical-align:top}
.tg .tg-cypf{background-color:#f0f0f0;color:#333333;border-color:#f0f0f0;text-align:left;vertical-align:top}
.tg .tg-igxt{background-color:#f0f0f0;color:#333333;border-color:#f0f0f0;text-align:center;vertical-align:top}
.tg .tg-idf9{background-color:#f9f9f9;color:#333333;border-color:#ffffff;text-align:center;vertical-align:top}
.tg .tg-cmbj{color:#333333;border-color:#f9f9f9;text-align:left;vertical-align:top}
.tg .tg-dvqx{background-color:#f9f9f9;border-color:#ffffff;text-align:center;vertical-align:top}
.tg .tg-hobq{color:#333333;border-color:#ffffff;text-align:left;vertical-align:top}
.tg .tg-juwk{color:#333333;border-color:#ffffff;text-align:center;vertical-align:top}
@media screen and (max-width: 767px) {.tg {width: auto !important;}.tg col {width: auto !important;}.tg-wrap {overflow-x: auto;-webkit-overflow-scrolling: touch;margin: auto 0px;}}</style>
<div class="tg-wrap"><table class="tg">
  <tr>
    <th class="tg-cypf">Relación de Empleo</th>
    <th class="tg-igxt">Media</th>
    <th class="tg-igxt">SD</th>
    <th class="tg-igxt">Frecuencia</th>
  </tr>
  <tr>
    <td class="tg-h0yh">Empleado</td>
    <td class="tg-idf9">44.4496</td>
    <td class="tg-idf9">12.8875</td>
    <td class="tg-idf9">536</td>
  </tr>
  <tr>
    <td class="tg-cmbj">Independiente sin empleados</td>
    <td class="tg-fckz">43.5631</td>
    <td class="tg-fckz">18.8657</td>
    <td class="tg-fckz">103</td>
  </tr>
  <tr>
    <td class="tg-oqs5">Independiente con empleados</td>
    <td class="tg-dvqx">54.3704</td>
    <td class="tg-dvqx">20.0176</td>
    <td class="tg-dvqx">27</td>
  </tr>
  <tr>
    <td class="tg-hobq">Trabaja ayudando negocio familiar</td>
    <td class="tg-juwk">38.7500</td>
    <td class="tg-juwk">31.2557</td>
    <td class="tg-juwk">4</td>
  </tr>
  <tr>
    <td class="tg-h0yh">Total</td>
    <td class="tg-idf9">44.6791</td>
    <td class="tg-idf9">14.5353</td>
    <td class="tg-idf9">670</td>
  </tr>
</table></div>

###### Tabla 2 - ANOVA para Horas de Trabajo a la Semana por Relación de Empleo
<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;border:none;border-color:#ccc;margin:0px auto;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:0px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:0px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
.tg .tg-oe15{background-color:#ffffff;border-color:#ffffff;text-align:left;vertical-align:top}
.tg .tg-kaak{background-color:#ffffff;border-color:#ffffff;text-align:left;vertical-align:top}
.tg .tg-c3ow{border-color:inherit;text-align:center;vertical-align:top}
.tg .tg-l6ga{border-color:#f0f0f0;text-align:center;vertical-align:top}
.tg .tg-mv9k{border-color:#f0f0f0;text-align:left;vertical-align:top}
.tg .tg-btxf{background-color:#f9f9f9;border-color:inherit;text-align:left;vertical-align:top}
.tg .tg-abip{background-color:#f9f9f9;border-color:inherit;text-align:center;vertical-align:top}
.tg .tg-0pky{border-color:inherit;text-align:left;vertical-align:top}
.tg .tg-c1kk{background-color:#ffffff;border-color:#ffffff;text-align:right;vertical-align:top}
.tg .tg-3dev{background-color:#ffffff;border-color:#ffffff;text-align:right;vertical-align:top}
@media screen and (max-width: 767px) {.tg {width: auto !important;}.tg col {width: auto !important;}.tg-wrap {overflow-x: auto;-webkit-overflow-scrolling: touch;margin: auto 0px;}}</style>
<div class="tg-wrap"><table class="tg">
  <tr>
    <th class="tg-mv9k">Fuente</th>
    <th class="tg-l6ga">SS</th>
    <th class="tg-l6ga">df</th>
    <th class="tg-l6ga">MS</th>
    <th class="tg-l6ga">F</th>
    <th class="tg-l6ga">Prob &gt; F</th>
  </tr>
  <tr>
    <td class="tg-btxf">Entre grupos</td>
    <td class="tg-abip">2832.98144</td>
    <td class="tg-abip">3</td>
    <td class="tg-abip">944.327145</td>
    <td class="tg-abip">4.54</td>
    <td class="tg-abip">0.0037</td>
  </tr>
  <tr>
    <td class="tg-0pky">Intra grupos</td>
    <td class="tg-c3ow">138509.026</td>
    <td class="tg-c3ow">666</td>
    <td class="tg-c3ow">207971511</td>
    <td class="tg-c3ow"></td>
    <td class="tg-c3ow"></td>
  </tr>
  <tr>
    <td class="tg-btxf">Total</td>
    <td class="tg-abip">141342.007</td>
    <td class="tg-abip">669</td>
    <td class="tg-abip">211.273554</td>
    <td class="tg-abip"></td>
    <td class="tg-abip"></td>
  </tr>
  <tr>
    <td class="tg-c1kk">Test de Barlett para igualdad de varianzas:</td>
    <td class="tg-c1kk"></td>
    <td class="tg-oe15"></td>
    <td class="tg-c1kk"></td>
    <td class="tg-c1kk"></td>
    <td class="tg-oe15"></td>
  </tr>
  <tr>
    <td class="tg-3dev">chi2(3) =</td>
    <td class="tg-kaak">42.0352</td>
    <td class="tg-kaak"></td>
    <td class="tg-kaak">Prob&gt;chi2 =</td>      
    <td class="tg-kaak">0.000</td>
    <td class="tg-kaak"></td>      
  </tr>
</table></div>

Podemos observar, en la tabla de descriptivos, que la media de horas trabajadas por estos grupos difieren en sus valores. Los empleados trabajan en promedio 44.45 horas a la semana; los independiente sin empleados, 43.56 horas a la semana; los independiente con empleados, 54.37 horas a la semana y quienes trabajan ayudando en su negocio familiar, 38.75 horas a la semana. ANOVA nos permitirá detectar si estas diferencias son estadísticamente significativas, es decir, si las categorías de grupos pueden explicar la variación en las horas trabajadas a la semana.

Formulamos las hipótesis correspondientes. Nuestra hipótesis nula plantea la no diferencia entre las medias poblacionales. La hipótesis alternativa sostiene que existen diferencias al menos entre un par de medias poblacionales.

$$
H_{0}:mu_{emple}=\mu_{indse}=\mu_{indce}=\mu_{ayudf}
$$
$$
H_{a}:Al \, menos \, dos \, de \, las \, medias \, poblacionales \, son \, distintas
$$

El test de ANOVA entrega un estadístico $F=4.54$ al cual le corresponde un $valor\,p=0.0037$. Podemos señalar que obtener un estadístico $F$ al menos tan grande como el observado es poco probable es un escenario en el cual $H_{0}$ es verdadera, lo que nos entrega evidencia en contra de $H_{0}$. Si determinamos un nivel $\alpha=0.05$, tenemos que $p<\alpha$ y rechazamos la $H_{0}$ lo que nos permite decir que existen diferencias estadísticamente significativas entre la media de horas trabajadas entre los distintos grupos de relación laboral.

Stata computa el test de Bartlett, un test de significancia que evalúa la igualdad de varianzas entre grupos, uno de los supuestos de ANOVA. El test de Bartlett está basado en chi-cuadrado. En nuestro ejemplo entrega un $\chi^{2}$ con 3 grados de libertad igual a 42.0352, con $p<0.000$. Nuestros datos no cumplen con el supuesto de igualdad de varianzas entre grupos. Algunos investigadores dejan de lado este test, porque, al basarse en $\chi^{2}$, suele no ser significativo si la muestra es pequeña, incluso cuando hay diferencias sustanciales. Al contrario, el test tiende a ser significativo cuando hay diferencias pequeñas, cuando la muestra es grande. Porque la desigualdad de varianzas es usualmente más problemática en muestras pequeñas, cuando se carece de poder, y menos importante en las muestras grandes, cuando el test puede tener mucho poder, el test de Bartlett es ignorado. En el caso de nuestro ejemplo no podemos simplemente ignorarlo, porque probablemente se deba a la diferencias sustantivas en los N entre grupos. Una práctica general es continuar con el análisis, pero reportar a los lectores que el test de Bartlett de igualdad de varianzas fue estadísticamente significativo. 

## Comparaciones multiples
Con varios grupos, podríamos usar un test $t$ para comparar cada par de medias. Lo que nos previene de hacerlo es la tasa de family-wise error (FWER), la probabilidad, al realizar múltiples tests, de tropezar con uno o más falsos positivos o error tipo I: inferir falsamente la existencia de algo donde no hay, un efecto, relación, diferencia, etc. 

<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;border:none;border-color:#ccc;margin:0px auto;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:0px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:0px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
.tg .tg-buh4{background-color:#f9f9f9;text-align:left;vertical-align:top}
.tg .tg-0lax{text-align:left;vertical-align:top}
@media screen and (max-width: 767px) {.tg {width: auto !important;}.tg col {width: auto !important;}.tg-wrap {overflow-x: auto;-webkit-overflow-scrolling: touch;margin: auto 0px;}}</style>
<div class="tg-wrap"><table class="tg">
  <tr>
    <th class="tg-0lax">H<sub>0</sub> es verdadera</th>
    <th class="tg-0lax">H<sub>0</sub> no es verdadera</th>
    <th class="tg-0lax">Total</th>
    <th class="tg-0lax">Total</th>
  </tr>
  <tr>
    <td class="tg-buh4">Test declarado sig.</td>
    <td class="tg-buh4">V</td>
    <td class="tg-buh4">S</td>
    <td class="tg-buh4">R</td>
  </tr>
  <tr>
    <td class="tg-0lax">Test declarado no sig.</td>
    <td class="tg-0lax">U</td>
    <td class="tg-0lax">T</td>
    <td class="tg-0lax">m-R</td>
  </tr>
  <tr>
    <td class="tg-buh4">Total</td>
    <td class="tg-buh4">m<sub>0</sub></td>
    <td class="tg-buh4">m-m<sub>0</sub></td>
    <td class="tg-buh4">m</td>
  </tr>
</table></div>

Observemos los posibles resultados al efectuar repetidos test de hipótesis. $m$ es el número total de hipótesis testeadas, número conocido. Tenemos dos parámetros desconocidos, el número de $H_{0}$ verdaderas, o $m_{0}$, y el número de $H_{0}$ no verdaderas, $m-m_{0}$. Además, tenemos cuatro variables aleatorias no observables: $V$, el número de falsos positivos (Error Tipo 1); $S$ el número de verdaderos positivos (acierto); $T$ el número de falsos negativos (Error Tipo 2); y $U$, el número de verdaderos negativos (acierto). Finalmente, observamos la variable aleatoria número de $H_{0}$ rechazadas, $V+S$.  


La probabilidad de hacer al menos un Error Tipo I en la familia de tests es:
$$
FWER=Pr(V \geq 1)
$$
$$
FWER= 1-Pr(V=0)
$$

Si aseguramos que:
$$
FWER \leq \alpha
$$

La probabilidad de hacer uno o más Errores Tipo 1 está controlada a nivel $\alpha$. Con un $nivel \, alpha$ de 0.05, por ejemplo, la probabilidad de rechazar una hipótesis nula verdadera está fija en 0.05. 

Esto es válido cuando corremos un test. Cuando se testea sucesivamente una familia de hipótesis, se incrementa la probabilidad de que ocurra un evento extraordinario y, con ello, aumenta la probabilidad de error tipo I, que en este caso aplica para cada test. Supongamos que realizamos 45 comparaciones de medias o intervalos de confianza para la diferencia de medias. Al 0.05, 2.25 de los intervalos no contienen la verdadera diferencia de medias o 2.25 de los test de medias indicarán diferencias significativas donde no las hay. 


Existen distintas maneras de corregir esto. Una de las más conocidas es la **corrección de Bonferroni**, que compensa el FWER al ajustar el nivel de significancia frente al cual se compara el $valor \, p$. Siendo $m$ el número total de hipótesis a evaluar, y $p_{i}$ el $valor \, p$ para testear las hipótesis. La corrección de Bonferroni indica rechazar la hipótesis si:

$$
p_{i}\leq\dfrac{\alpha}{m}
$$

Por ejemplo, con 45 hipótesis, la corrección rechaza a un $valor \, p$ menor a 0.001. A la corrección de Bonferroni se le suele criticar por ser muy conservadora, corrigiendo en donde no hay error de tipo I lo que produce falsos negativos. Esta crítica se aplica en general a todos los tipos de corrección de FWER. 

Retomemos el ejemplo. Existen diversas maneras de realizar comparaciones múltiples corregidas y no corregidas. Una de ellas es usar la opción en ANOVA. Podemos usar diferentes correcciones, especificando *bonferroni*, *scheffe* o *sidak*.

```
oneway htrab remp, bonferroni
```
###### Tabla 3 - Comparación de horas de trabajo a la semana por relación de empleo (Bonferroni)

<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;margin:0px auto;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
.tg .tg-oqs5{background-color:#f9f9f9;border-color:#ffffff;text-align:left;vertical-align:top}
.tg .tg-zv4m{border-color:#ffffff;text-align:left;vertical-align:top}
.tg .tg-8jgo{border-color:#ffffff;text-align:center;vertical-align:top}
.tg .tg-m2yo{background-color:#f9f9f9;color:#333333;border-color:#f9f9f9;text-align:left;vertical-align:top}
.tg .tg-h0yh{background-color:#f9f9f9;color:#333333;border-color:#ffffff;text-align:left;vertical-align:top}
.tg .tg-cypf{background-color:#f0f0f0;color:#333333;border-color:#f0f0f0;text-align:left;vertical-align:top}
.tg .tg-igxt{background-color:#f0f0f0;color:#333333;border-color:#f0f0f0;text-align:center;vertical-align:top}
.tg .tg-j5xq{background-color:#f9f9f9;color:#333333;border-color:#f9f9f9;text-align:center;vertical-align:top}
.tg .tg-dvqx{background-color:#f9f9f9;border-color:#ffffff;text-align:center;vertical-align:top}
.tg .tg-idf9{background-color:#f9f9f9;color:#333333;border-color:#ffffff;text-align:center;vertical-align:top}
.tg .tg-hobq{color:#333333;border-color:#ffffff;text-align:left;vertical-align:top}
.tg .tg-juwk{color:#333333;border-color:#ffffff;text-align:center;vertical-align:top}
@media screen and (max-width: 767px) {.tg {width: auto !important;}.tg col {width: auto !important;}.tg-wrap {overflow-x: auto;-webkit-overflow-scrolling: touch;margin: auto 0px;}}</style>
<div class="tg-wrap"><table class="tg">
  <tr>
    <th class="tg-cypf">Media fila - media columna</th>
    <th class="tg-igxt">Empleado</th>
    <th class="tg-igxt">Independiente sin empleados</th>
    <th class="tg-igxt">Independiente con empleados</th>
  </tr>
  <tr>
    <td class="tg-m2yo">Independiente sin empleados</td>
    <td class="tg-j5xq">-0.88652</td>
    <td class="tg-j5xq"></td>
    <td class="tg-j5xq"></td>
  </tr>
  <tr>
    <td class="tg-zv4m"></td>
    <td class="tg-8jgo">1.000</td>
    <td class="tg-8jgo"></td>
    <td class="tg-8jgo"></td>
  </tr>
  <tr>
    <td class="tg-oqs5">Independiente con empleados</td>
    <td class="tg-dvqx">9.92074</td>
    <td class="tg-dvqx">10.8073</td>
    <td class="tg-dvqx"></td>
  </tr>
  <tr>
    <td class="tg-zv4m"></td>
    <td class="tg-8jgo">0.003</td>
    <td class="tg-8jgo">0.003</td>
    <td class="tg-8jgo"></td>
  </tr>
  <tr>
    <td class="tg-h0yh">Trabaja ayudando negocio familiar</td>
    <td class="tg-idf9">-5.69963</td>
    <td class="tg-idf9">-4.81311</td>
    <td class="tg-idf9">-15.6204</td>
  </tr>
  <tr>
    <td class="tg-hobq">Total</td>
    <td class="tg-juwk">1.000</td>
    <td class="tg-juwk">1.000</td>
    <td class="tg-juwk">0.262</td>
  </tr>
</table></div>

Al output de ANOVA se suman las tablas que muestra la Tabla 3, las que muestran todas las combinaciones pareadas entre los niveles de ambas variables. En la primera fila aparece la diferencia de medias entre los grupos, y, en la segunda, el $valor \, p$ para la diferencia, corregido por Bonferroni (o Scheffe o Sidak).

Una segunda opción para obtener todas las diferencias de medias pareadas, corregidas o no, es usar el comando *pwmean*. Obtengamos las diferencias, corregidas por Bonferroni.

```
pwmean htrab, over(remp) mcompare(bonferroni) effects
```
###### Tabla 4 - Comparaciones pareadas de medias con igual varianza por relación de empleo (Bonferroni)

<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;margin:0px auto;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
.tg .tg-byz0{background-color:#f0f0f0;border-color:#f0f0f0;text-align:right;vertical-align:top}
.tg .tg-pba4{background-color:#f0f0f0;border-color:#f0f0f0;text-align:left;vertical-align:top}
.tg .tg-oe15{background-color:#ffffff;border-color:#ffffff;text-align:left;vertical-align:top}
.tg .tg-lbqm{background-color:#f9f9f9;border-color:#f9f9f9;text-align:center;vertical-align:top}
.tg .tg-i1vy{background-color:#f0f0f0;border-color:#f0f0f0;text-align:center;vertical-align:top}
.tg .tg-m2yo{background-color:#f9f9f9;color:#333333;border-color:#f9f9f9;text-align:left;vertical-align:top}
.tg .tg-wk8r{background-color:#ffffff;border-color:#ffffff;text-align:center;vertical-align:top}
.tg .tg-d5a7{background-color:#ffffff;color:#333333;border-color:#ffffff;text-align:center;vertical-align:top}
.tg .tg-cypf{background-color:#f0f0f0;color:#333333;border-color:#f0f0f0;text-align:left;vertical-align:top}
.tg .tg-igxt{background-color:#f0f0f0;color:#333333;border-color:#f0f0f0;text-align:center;vertical-align:top}
.tg .tg-r4ud{background-color:#f0f0f0;border-color:#f0f0f0;text-align:center;vertical-align:top}
.tg .tg-j5xq{background-color:#f9f9f9;color:#333333;border-color:#f9f9f9;text-align:center;vertical-align:top}
.tg .tg-677o{background-color:#f9f9f9;border-color:#f9f9f9;text-align:left;vertical-align:top}
.tg .tg-fbeb{background-color:#ffffff;color:#333333;border-color:#ffffff;text-align:left;vertical-align:top}
@media screen and (max-width: 767px) {.tg {width: auto !important;}.tg col {width: auto !important;}.tg-wrap {overflow-x: auto;-webkit-overflow-scrolling: touch;margin: auto 0px;}}</style>
<div class="tg-wrap"><table class="tg">
  <tr>
    <th class="tg-oe15">Numero de comparaciones:</th>
    <th class="tg-oe15">6</th>
    <th class="tg-oe15"></th>
    <th class="tg-oe15"></th>
    <th class="tg-oe15"></th>
    <th class="tg-oe15"></th>
    <th class="tg-oe15"></th>
  </tr>
  <tr>
    <td class="tg-pba4"></td>
    <td class="tg-pba4"></td>
    <td class="tg-pba4"></td>
    <td class="tg-i1vy" colspan="4">Bonferroni</td>
  </tr>
  <tr>
    <td class="tg-cypf"></td>
    <td class="tg-igxt">Contraste</td>
    <td class="tg-igxt">SE</td>
    <td class="tg-igxt">t</td>
    <td class="tg-r4ud">P&gt;|t|</td>
    <td class="tg-byz0" colspan="2">[Intervalo de Confianza 95%]</td>
  </tr>
  <tr>
    <td class="tg-m2yo">Independiente sin empleados vs Empleado</td>
    <td class="tg-j5xq">-0.8865201</td>
    <td class="tg-j5xq">1.551498</td>
    <td class="tg-j5xq">-0.57</td>
    <td class="tg-lbqm">1.0000</td>
    <td class="tg-lbqm">-4.992038</td>
    <td class="tg-lbqm">3.218998</td>
  </tr>
  <tr>
    <td class="tg-oe15">Independiente con empleados vs Empleado</td>
    <td class="tg-wk8r">9.920744</td>
    <td class="tg-wk8r">2.844408</td>
    <td class="tg-wk8r">3.49</td>
    <td class="tg-wk8r">0.0031</td>
    <td class="tg-wk8r">2.393977</td>
    <td class="tg-wk8r">17.44751</td>
  </tr>
  <tr>
    <td class="tg-677o">Trabaja ayudando negocio familiar vs Empleado</td>
    <td class="tg-lbqm">-5.699627</td>
    <td class="tg-lbqm">7.237464</td>
    <td class="tg-lbqm">-0.79</td>
    <td class="tg-lbqm">1.0000</td>
    <td class="tg-lbqm">-24.85114</td>
    <td class="tg-lbqm">13.45188</td>
  </tr>
  <tr>
    <td class="tg-oe15">Independiente con empleados vs Independiente sin empleados</td>
    <td class="tg-wk8r">10.80726</td>
    <td class="tg-wk8r">3.117978</td>
    <td class="tg-wk8r">3.47</td>
    <td class="tg-wk8r">0.0034</td>
    <td class="tg-wk8r">2.556585</td>
    <td class="tg-wk8r">19.05794</td>
  </tr>
  <tr>
    <td class="tg-m2yo">Trabaja ayudando negocio familiar vs Independiente sin empleados</td>
    <td class="tg-j5xq">-4.813107</td>
    <td class="tg-j5xq">7.349287</td>
    <td class="tg-j5xq">-0.65</td>
    <td class="tg-lbqm">1.0000</td>
    <td class="tg-lbqm">-24.26052</td>
    <td class="tg-lbqm">14.6343</td>
  </tr>
  <tr>
    <td class="tg-fbeb">Trabaja ayudando negocio familiar vs Independiente con empleados</td>
    <td class="tg-d5a7">-15.62037</td>
    <td class="tg-d5a7">7.726288</td>
    <td class="tg-d5a7">-2.02</td>
    <td class="tg-wk8r">0.2616</td>
    <td class="tg-wk8r">-36.06539</td>
    <td class="tg-wk8r">4.824646</td>
  </tr>
</table></div>


Stata entrega las comparaciones pareadas para todas las combinaciones entre los niveles de las variables estipuladas, el estadístico de prueba, su $valor \, p$ y los intervalos de confianza al nivel especificado (por default, 95\% de confianza). La opción *mcompare* permite obtener valores $p$ e intervalos de confianza sin ajustar y ajustados por los métodos de Bonferroni, Sidak, Scheffe, Tukey y otros.

[dropbox]: http://example.com/  "Dropbox SOL3000"
[datos1]: http://example.com/  "Datos 1"
[source1]: http://observatorio.ministeriodesarrollosocial.gob.cl/casen-multidimensional/casen/casen_2017.php  "Fuente"

