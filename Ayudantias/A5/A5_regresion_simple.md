Ayudantia 5 - Regresión simple
==================

Pia Carozzi

PUC

*[pjcarozzi@uc.cl](mailto:pjcarozzi@uc.cl)*

------

En general, un modelo de regresión representa la relación entre una variable de resultado (o variable dependiente) y una o más variables explicativas (o variables independientes). Los análisis de regresión son utilizados para:

- Estimar el impacto causal de una variable explicativa en una variable de
resultado.
- Describir la fuerza y la dirección de la relación entre una variable de resultado y una variable explicativa, controlando por variables adicionales.
- Predecir los valores de la variable de resultado a partir de una determinada
combinación de valores de las variables explicativas.

Para introducir el análisis de modelos de regresión, en esta ayudantía se revisará el concepto de regresión simple, punto de partida necesario antes de estudiar formulaciones más complejas.

Usaremos la base de datos [GSS2006][datos1], que pueden descargar desde el [Dropbox][dropbox] del curso. La base contiene una submuestra y variables seleccionadas de la [General Social Survey][source1] 2006 de Estados Unidos.

## Relaciones lineales
Establezcamos la siguiente premisa de investigación. Tenemos dos variables $Y$, y $X$. Se desea explicar $Y$ en términos de $X$. 

### Valor esperado condicional
Recordemos algunos conceptos de teoría de probabilidad. $X$ es una variable aleatoria. La distribución de probabilidad de una variable aleatoria nos muestra las probabilidades $p(x_{i})$ para los valores de $X$. 

La **esperanza matemática**, o **valor esperado**, de una variable aleatoria $X$ formaliza el valor medio de un fenómeno aleatorio. Sabemos que para las variables aleatorias discretas con una función de probabilidad $p(x_{i})$ la esperanza es:

$$
\mathbb{E}(X)=\mu=\sum_{i=1}^{n}x_{i}p(x_{i})
$$

Y que para las variables aleatorias continuas con función de densidad $f(x)$ es:

$$
\mathbb{E}(X)=\mu=\int_{-\infty}^{\infty}x f(x)dx
$$

La función de probabilidad condicional permite describir cómo se relacionan $X$ e $Y$. Para variables discretas tenemos:

$$
f_{Y|X}(y|x)=P(Y=y|X=x)=\dfrac{P_{YX}(y,x)}{P_{X}(x)}
$$

Para variables continuas:

$$
f_{Y|X}(y|x)=\dfrac{f_{YX}(y,x)}{f_{X}(x)}
$$

$f_{x|y}(x|y)$ nos indica la probabilidad de que $Y=y$ dado $X=x$. Por ejemplo, si $Y=salario$ y $X=educación$, da cuenta de la probabilidad de tener cierto salario para una determinada cantidad de años de educación. 

Como ya señalamos la ayudantía pasada, cuando revisamos la asociación entre variables categóricas, analizamos cómo tienden a variar los valores de $Y$ de acuerdo con los valores de $X$ comparando las distribuciones condicionales de $Y$ de acuerdo con los valores de $X$. Podemos resumir estas distribuciones usando el **valor esperado condicional**, o media condicional.

$$
\mathbb{E}(Y|X)=\mu_{Y|X}=\sum_{y \in Y} y P_{Y|X}(y|x)
$$

$$
\mathbb{E}(Y|X)=\mu_{Y|X}=\int_{Y} y f_{Y|X}(y|x)dy
$$

$\mathbb{E}(Y|X)$ nos dice como $Y$ varía dado determinados valores de $X$. En principio, podemos calcular todos los valores esperados de $Y$ para cada valor de $X$. Sin embargo, la relación entre $Y$ y $X$ queda capturada por una función que simplifica esta operación. Por ejemplo, la siguiente:

$$
\mathbb{E}(Y|X)=\alpha+\beta X
$$

Una primera forma de aproximarse a la asociación entre ambas variables es reconocer matemáticamente su relación funcional.

### Función lineal
Una función es una relación entre dos magnitudes o variables numéricas, $X$ e $Y$, tal que a cada valor $x$ le corresponde un único valor $y$. La función describe cómo los valores de $Y$ dependen de los valores de $X$. Las funciones suelen representarse mediante una expresión matemática (una ecuación), como tablas o pares ordenados y como gráficos. 

Cualquier fórmula particular puede entregar una buena o una mala descripción de la relación entre $X$ e $Y$. La fórmula más simple, definida gráficamente como una línea recta, en la cuál $Y$ es una función lineal de $X$, es la ecuación que define el modelo de regresión lineal simple:

$$
y=\alpha+\beta x
$$

$\beta$ es la **pendiente** en la relación entre $X$ e $Y$. $\alpha$ es el **intercepto** o **término constante**, el valor de $Y$ cuando $x=0$. 

Tomemos como ejemplo la función lineal $Y=2+0.5X$. Al sustituir en la fórmula, cada valor de $X$ nos entrega un valor de $Y$. 



###### Tabla 1 - Valores $y$ para $y=2+0.5x$
<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;border:none;border-color:#ccc;margin:0px auto;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:0px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:0px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
.tg .tg-lbqm{background-color:#f9f9f9;border-color:#f9f9f9;text-align:center;vertical-align:top}
.tg .tg-8jgo{border-color:#ffffff;text-align:center;vertical-align:top}
.tg .tg-l6ga{border-color:#f0f0f0;text-align:center;vertical-align:top}
@media screen and (max-width: 767px) {.tg {width: auto !important;}.tg col {width: auto !important;}.tg-wrap {overflow-x: auto;-webkit-overflow-scrolling: touch;margin: auto 0px;}}</style>
<div class="tg-wrap"><table class="tg">
  <tr>
    <th class="tg-l6ga">x</th>
    <th class="tg-l6ga">y</th>
  </tr>
  <tr>
    <td class="tg-lbqm">-2</td>
    <td class="tg-lbqm">1</td>
  </tr>
  <tr>
    <td class="tg-8jgo">-1</td>
    <td class="tg-8jgo">1.5</td>
  </tr>
  <tr>
    <td class="tg-lbqm">0</td>
    <td class="tg-lbqm">2</td>
  </tr>
  <tr>
    <td class="tg-8jgo">1</td>
    <td class="tg-8jgo">2.5</td>
  </tr>
  <tr>
    <td class="tg-lbqm">2</td>
    <td class="tg-lbqm">3</td>
  </tr>
  <tr>
    <td class="tg-8jgo">3</td>
    <td class="tg-8jgo">3.5</td>
  </tr>
  <tr>
    <td class="tg-lbqm" colspan="2">...</td>
  </tr>
  <tr>
    <td class="tg-8jgo">20</td>
    <td class="tg-8jgo">12</td>
  </tr>
  <tr>
    <td class="tg-lbqm" colspan="2">...</td>
  </tr>
  <tr>
    <td class="tg-8jgo">n</td>
    <td class="tg-8jgo">2+0.5*n</td>
  </tr>
</table></div>
Si graficamos cada valor pareado obtenemos una línea recta, graficada en la Figura 1.

###### Figura 1 - Función lineal $y=2+0.5x$

![](C:\Users\pjcar\Google Drive\201901 - Diseno y Analisis de la Investigacion Social\sol3000\Ayudantias\A5\img\eq1.png)

El eje de las $x$ representa los posibles valores de $X$, el eje de las $y$, los valores posibles de $Y$. Ambos ejes intersecan en el origen, donde $x=0$ e $y=0$. El intercepto $\alpha$ es igual a 2. Cuando $x=0$, $y=2$. La pendiente $\beta$ es igual a 0.5 y equivale al cambio en $Y$ por el cambio en una unidad de $X$. Para dos valores $x$ que difieren en 1 unidad, obtenemos valores $y$ que difieren en $\beta$. La linealidad de la relación implica que todo cambio en $X$ en una unidad tiene siempre el mismo efecto sobre $Y$. 

###### Figura 2 - Diversas funciones lineales

![](C:\Users\pjcar\Google Drive\201901 - Diseno y Analisis de la Investigacion Social\sol3000\Ayudantias\A5\img\eq2.png)

Como muestra la Figura 2, si $\beta$ es positivo, $Y$ incrementa en la medida en que $X$ incrementa, la relación es positiva. Si $\beta$ es negativo, $Y$ decrece en la medida en que $X$ incrementa y viceversa, la relación es negativa. Cuando $\beta=0$, el valor de $Y$ es constante y no varía cuando $X$ varía, las variables son independientes. 

## Modelo de regresión simple
El modelo de regresión simple es definido por la siguiente ecuación.

$$
y=\beta_{0}+\beta_{1}x+u
$$

Cuando $Y$ y $X$ se relacionan mediante una ecuación como la anterior se le da a $Y$ los nombres de **variable de respuesta**, **variable predicha**,  **variable dependiente** o **regresando** y a $X$ los nombres de **variable explicativa**, **variable predictora**, **regresor** o **variable independiente** (aunque este término no se refiera al concepto estadístico de independencia). 

La variable $u$ es llamada **término error** o **perturbación** en la relación y representa factores distintos a $x$ que afectan a $y$. En una regresión simple, todos los factores que afectan a $y$ y son distintos a $x$ son factores no observados. Si los factores en $u$ permanecen constantes, de manera que el cambio en $u$ sea cero, $x$ tiene un **efecto lineal** sobre $y$.

$$
\Delta y= \beta_{1} \Delta x \quad si \quad \Delta u=0
$$

Siendo así, el cambio en $y$ es $\beta_{1}$ por el cambio en $x$, siendo $\beta_{1}$ la pendiente de la relación cuando todos los demás factores en $u$ permanecen constantes. 

Veamos un ejemplo. Se plantea un modelo sencillo que relaciona el salario de una persona con su educación:

$$
salario=\beta_{0}+\beta_{1}educación+u
$$

Si _salario_ es medido en dólares por hora y _educación_ se mide en años de educación, entonces $\beta_{1}$ mide la variación en el salario por hora por cada año adicional de educación, cuando todos los demás factores permanecen constantes. Entre esos factores tenemos la experiencia laboral, capacidades innatas, antigüedad en el empleo actual y otras cosas.

Si $\beta_{1}$ mide el efecto de $x$ sobre $y$ cuando los demás factores en $u$ permanecen constantes, el problema más difícil de resolver es que ignoramos los factores en $u$. Necesitamos hacer una suposición que restrinja la manera en la que $u$ se relaciona con $x$. Como $u$ y $x$ son variables aleatorias, se necesita un concepto basado en la probabilidad. 

Establecemos dos supuestos. El primero tiene que ver con la distribución de los efectos no observables $u$ en la población, y señala que el valor promedio de $u$ en la población es cero. 

$$
\mathbb{E}(u)=0
$$

El segundo supuesto aborda la relación entre $u$ y $x$ e involucra el _valor esperado de u dado x_. Como $u$ y $x$ son variables aleatorias, se puede definir la distribución condicional de $u$ dado cualquier valor de $x$. En otras palabras, para cada $x$ se puede obtener el valor promedio de $u$ en la proporción de la población descrita por el valor de $x$. El segundo supuesto indica que el valor promedio de $u$ no depende del valor de $x$:

$$
\mathbb{E}(u|x)=\mathbb{E}(u)
$$

Esto quiere decir que el valor esperado de los factores no observables es el mismo en todas las fracciones de la población determinados por los valores $x$ y que éste promedio es necesariamente igual al promedio de $u$ en toda la población. Cuando este supuesto se satisface, _u es independiente de x_, porque la independencia de la media es una consecuencia de la independencia entre ambas. Combinando ambos supuestos:

$$
\mathbb{E}(u|x)=0
$$

Obtenemos con esto el **supuesto de media condicional cero**. De un modo directo, indica que el error no está asociado con $X$, es decir, no tiene información adicional a $X$ que sirva para predecir o explicar a $Y$. De un modo indirecto, implica que el término error no está asociado con $Y$. 

Siendo el supuesto de media condicional cero válido, el coeficiente de regresión $\beta_{1}$ se puede interpretar como efecto causal, en el sentido de que $Y$ sólo está influenciada por $X$. Si $\mathbb{E}(u|x)=0$, entonces:

$$
\mathbb{E}(Y|X)=\beta_{0}+\beta_{1}X
$$

Esta ecuación muestra que la **función de regresión poblacional**, $\mathbb{E}(Y|X)$, es una función lineal de $X$. Por cada aumento de una unidad en los valores $x$, el **valor esperado** de $Y$ se modifica por $\beta_{1}$. Dado cualquier valor $x$, la distribución de $Y$ está centrada en $\mathbb{E}(Y|X)$. La Figura 3, a continuación, muestra una representación gráfica de esta idea. 

###### Figura 3 - $\mathbb{E}(y|x)$ como función lineal de $x$

![](C:\Users\pjcar\Google Drive\201901 - Diseno y Analisis de la Investigacion Social\sol3000\Ayudantias\A5\img\fig3.png)

De acuerdo con la definición que hemos realizado de $\mathbb{E}(y|x)=\beta_{0}+\beta_{1}x$, sabemos que se trata de un modelo **probabilístico** de la relación entre $x$ e $y$. $\mathbb{E}(y|x)$ indica cómo varía el **valor promedio** de $y$ de acuerdo con la variación de $x$.

Volvamos al ejemplo donde $Y$ es el salario y $X$ los años de educación. Supongamos que conocemos los parámetros poblacionales (en la práctica, no se conocen) y que la función de regresión poblacional es: 

$$
\mathbb{E}(salario|educ)=-0.9+0.54educ
$$

La ecuación entrega el **promedio** del salario entre todos los trabajadores que tienen una determinada cantidad de años de educación. Si $educ=12$, el salario promedio de todos los trabajadores con 12 años de escolaridad es:


$$
-0.9+0.54*12=5.58
$$

5.58 dólares. No se indica que todos los trabajadores con 12 años de escolaridad tengan un salario de 5.58, algunos tendrán un salario mayor y otros uno menor, porque el salario no es completamente dependiente de la educación. 

## Estimación de mínimos cuadrados
### Estimadores de la pendiente y el intercepto
Usando datos de una muestra podemos estimar los parámetros $\beta_{0}$ y $\beta_{1}$, desconocidos, de la ecuación para un modelo lineal. Tenemos una muestra aleatoria de tamaño $n$ tomada de una población con $\lbrace(x_{i},y_{i}): i=1,...,n\rbrace$. Para toda $i$:

$$
y_{i}=\beta_{0}+\beta_{1}x_{i}+u_{i}
$$

$u_{i}$ es el término error de la observación $i$ y contiene todos los factores distintos a $x_{i}$ que afectan a $y_{i}$. 

Dados los supuestos explicados en la sección anterior, se tiene que, en la población $u$ no está correlacionada con $x$, su valor esperado es cero y la covarianza (la variabilidad conjunta) entre $x$ y $u$ es cero. 

Existen distintas maneras de proceder en la estimación. Una de ellas es la seguida por Wooldridge, sección 2.2 del capítulo 2, quien, siguiendo los supuestos ya presentados y el método de momentos para la estimación, obtiene la siguiente ecuación:

$$
\bar{y}=\hat{\beta}_{0}+\hat{\beta}_{1}\bar{x}
$$

Donde $\bar{y}$ es el promedio muestral de las $y_{i}$ y $\bar{x}$ es el promedio muestral de las $x_{i}$. Usando este método, se obtiene una formulación del intercepto en términos de $\hat{\beta}_{1}$, $\bar{y}$ y $\bar{x}$:

$$
\hat{\beta}_{0}=\bar{y}-\hat{\beta}_{1}\bar{x}
$$

Y de la pendiente $\hat{\beta}_{1}$ en términos de $\bar{y}$, $\bar{x}$, $y_{i}$ y $x_{i}$.

$$
\hat{\beta}_{1}=\dfrac{\sum_{i=1}^{n}(x_{i}-\bar{x})(y_{i}-\bar{y})}{\sum_{i=1}^{n}(x_{i}-\bar{x})^{2}}
$$

Donde $\hat{\beta}_{1}$ es igual a la covarianza entre $x$ e $y$ dividida por la varianza de $x$. 

#### Valores ajustados y residuos
A las estimaciones dadas por estas dos ecuaciones se les llama estimaciones de **Mínimos Cuadrados Ordinarios** (Ordinary Least Squares, OLS) de $\hat{\beta}_{0}$ y $\hat{\beta}_{1}$. Se llama así porque estas estimaciones minimizan la suma de los residuos al cuadrado.

Observemos que, para todo $\hat{\beta}_{0}$ y $\hat{\beta}_{1}$, se define el **valor ajustado** o **valor predicho** para $y$ cuando $x=x_{i}$ como:

$$
\hat{y}_{i}=\hat{\beta}_{0}+\hat{\beta}_{1}x_{i}
$$

Esta función entrega los valores predichos de $y$ a valores determinados de $x$, con un intercepto y pendiente dadas. Para cada observación en la muestra hay un valor ajustado.

Para cada observación, llamamos **residuo** a la diferencia entre el valor observado $y_{i}$ y el valor predicho $\hat{y}_{i}$.

$$
\hat{u}_{i}=y_{i}-\hat{y}_{i}
$$

###### Figura 4 - Valores ajustados y residuos

![](C:\Users\pjcar\Google Drive\201901 - Diseno y Analisis de la Investigacion Social\sol3000\Ayudantias\A5\img\fig4.png)

La Figura 4 nos muestra que los valores ajustados $\hat{y}_{i}$ se encuentran en la línea de regresión OLS. Si $\hat{u}_{i}$ es positivo, la línea predice un valor inferior al de $y_{i}$; si $\hat{u}_{i}$ es negativo, la línea predice un valor superior al de $y_{i}$. Lo ideal es que, para cada $i$, $\hat{u}_{i}=0$, pero en la mayoría de los casos, los residuos son distintos de cero. 

Los residuos también pueden ser definidos como:

$$
\hat{u}_{i}=y_{i}-\beta_{0}-\beta_{1}x_{i}
$$

Y OLS calcula $\hat{\beta}_{0}$ y $\hat{\beta}_{1}$ de manera de que:

$$
SSR=\sum_{i=1}^{n}\hat{u}_{i}^{2}=\sum_{i=1}^{n}(y_{i}-\beta_{0}-\beta_{1}x_{i})^{2}
$$

Es decir, la **Suma Residual de Cuadrados** o **Suma de Cuadrados de los Errores**, sea la menor posible. La Suma Residual de Cuadrados describe la variación de los datos en torno a la línea de predicción. Con una mejor predicción, menores son los residuos y menor será la Suma Residual de Cuadrados.

Como consecuencia de la manera en la que OLS elige $\hat{\beta}_{0}$ y $\hat{\beta}_{1}$ se tienen ciertas propiedades:

- La suma y, por lo tanto, el promedio de los residuos de OLS es cero.

$$
\sum_{i=1}^{n}\hat{u}_{i}=0
$$

- La covarianza muestral entre los regresores y los residuos de OLS es cero. Lo que puede expresarse como:

$$
\sum_{i=1}^{n}x_{i}\hat{u}_{i}=0
$$

- $(\bar{x},\bar{y})$ siempre se encuentra sobre la línea de regresión de OLS

Además de estimar los parámetros de la media condicional, con OLS se puede obtener insesgamiento, consistencia y otras propiedades estadísticas que revisaremos más tarde. 

Una vez se han determinado las estimaciones del intercepto y la pendiente por OLS, se obtiene la **función de regresión de mínimos cuadrados**:

$$
\hat{y}_{i}=\hat{\beta}_{0}+\hat{\beta}_{1}x
$$

A esta ecuación también se le llama **función de regresión muestral**, dado que es la versión estimada de la **función de regresión poblacional** $\mathbb{E}(y|x)=\beta_{0}+\beta_{1}x$, que es desconocida.

Revisemos un ejemplo. Supongamos que estamos interesados en la relación entre la educación completada por una persona adulta y la educación completada por su padre, teniendo en cuenta que las ventajas de la educación son transmitidas intergeneracionalmente. En una conceptualización sencilla, nos planteamos que los hijos de padres que tienen poca educación verán sus oportunidades restringidas y tendrán menos educación que aquellos hijos de padres con más educación, a quienes se les ofrecieron mayores oportunidades. Sabemos que una relación de este tipo no va a ser perfecta y que vamos a encontrar hijos con más educación que sus padres y hijos de padres con poca educación que tendrán alta educación. Nos planteamos un modelo probabilístico, es decir, nos interesa saber como varía el promedio de educación de acuerdo a la variación en la educación de los padres:

$$
\mathbb{E}(educ|paeduc)=\beta_{0}+\beta_{1}paeduc
$$

Con esto estamos planteando que la relación entre la educación de los hijos y la educación de los padres es lineal. En este caso es poco realista, pero asumamos media condicional cero. En otras palabras, que no hay factores no observados asociados con la educación de los padres que entreguen información adicional que sirva para explicar la educación de los hijos. Siendo así, si $educ$ y $paeduc$ son medidas en años de educación, $\beta_{1}$ mide la variación en años de educación de los hijos por cada año de educación adicional de los padres, cuando todos los demás factores permanecen constantes. $\beta_{0}$ mide la educación de los hijos cuando la educación de los padres es cero.

Consideremos datos de una muestra de $N=10179$ casos tomada de la General Social Survey 2006 para Estados Unidos. Abramos la base de datos y exploremos visualmente la relación entre las variables $educ$ y $paeduc$.

````
twoway (scatter educ paeduc)
````

###### Figura 5 - Scatterplot entre educación y educación del padre

![](C:\Users\pjcar\Google Drive\201901 - Diseno y Analisis de la Investigacion Social\sol3000\Ayudantias\A5\img\Graph1.png)

Como tenemos una muestra grande, el scatterplot tiene demasiados puntos como para intuir algo respecto a la relación. Grafiquemos parte de los datos, limitando el scatterplot a una muestra aleatoria de 300 observaciones. Usamos el comando _sample_ precedido por _seed_ para determinar el punto donde se empezará a seleccionar la muestra, de manera de obtener la misma muestra si repetimos el proceso, y _preserve_, para restaurar nuestra muestra completa más tarde.

````
preserve
set seed 123
sample 300, count
twoway (scatter educ paeduc)
````

###### Figura 6 - Scatterplot entre educación y educación del padre, muestra aleatoria n=300

![](C:\Users\pjcar\Google Drive\201901 - Diseno y Analisis de la Investigacion Social\sol3000\Ayudantias\A5\img\Graph2.png)

Podemos plotear una predicción lineal entre ambas variables para nuestra submuestra, lo que nos ayudará a diagnosticar si la relación entre ambas variables es lineal. 

````
twoway (scatter educ paeduc) (lfit educ paeduc)
````

###### Figura 7 - Scatterplot entre educación y educación del padre, muestra aleatoria n=300. Valores observados y valores predichos

![](C:\Users\pjcar\Google Drive\201901 - Diseno y Analisis de la Investigacion Social\sol3000\Ayudantias\A5\img\Graph3.png)

Restauramos nuestra muestra original con el comando _restore_.

````
restore
````

Una vez hemos explorado los datos visualmente, podemos estimar los parámetros de la regresión de $educ$ por $paeduc$.  Utilizamos el comando _regress_. La primera variable especificada debe ser la variable de respuesta. Stata identificará las variables que le siguen como variables explicativas.

````
regress educ paeduc
````
````
      Source |       SS           df       MS      Number of obs   =     6,350
-------------+----------------------------------   F(1, 6348)      =   1580.58
       Model |  11033.3131         1  11033.3131   Prob > F        =    0.0000
    Residual |  44312.6279     6,348   6.9805652   R-squared       =    0.1994
-------------+----------------------------------   Adj R-squared   =    0.1992
       Total |  55345.9409     6,349  8.71726901   Root MSE        =    2.6421
    
------------------------------------------------------------------------------
        educ |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
      paeduc |   .3107844   .0078172    39.76   0.0000       .29546    .3261088
       _cons |   10.23162      .0947   108.04   0.0000     10.04598    10.41727
------------------------------------------------------------------------------
````

Centrémonos por ahora en las estimaciones de los parámetros de la pendiente y el intercepto. Redondeando, tenemos un coeficiente de regresión $\hat{\beta}_{1}=0.311$ y un intercepto $\hat{\beta}_{0}=10.232$.

En otras palabras, nuestra función de regresión de OLS es:

$$
\hat{educ}=\hat{\beta}_{0}+\hat{\beta}_{1}paeduc
$$

$$
\hat{educ}=10.232+0.311 paeduc
$$

¿Cómo se interpreta esta ecuación? Si la educación del padre es cero, $paeduc=0$, entonces, la educación del hijo corresponde al intercepto, es decir, 10.232 años de educación. Luego, con cada año adicional en la educación del padre, se predice que la educación del hijo aumentará en 0.311 años de educación, manteniendo todos los demás factores constantes.

Supongamos que queremos conocer cuántos años de educación tienen en promedio (valor esperado) quienes tienen padres con 12 años de educación. Podemos calcularlo usando los parámetros recién estimados.

$$
\hat{educ}=10.232+0.311*12
$$

````
dis 10.23162 + (0.3107844*12)
````

Quienes tienen padres con 12 años de educación alcanzan, en promedio, 13.961 años de educación.

Todo esto lo podemos obtener directamente de Stata. Usemos el comando de postestimación _margins_ para estimar el valor ajustado a 12 años de escolaridad del padre.

````
margins, at(paeduc=(12))
````

````
          Adjusted predictions                            Number of obs     =      6,350
          Model VCE    : OLS
    
          Expression   : Linear prediction, predict()
          at           : paeduc          =          12
    
          ------------------------------------------------------------------------------
                       |            Delta-method
                       |     Margin   Std. Err.      t    P>|t|     [95% Conf. Interval]
          -------------+----------------------------------------------------------------
                 _cons |   13.96104   .0335457   416.18   0.0000     13.89528     14.0268
          ------------------------------------------------------------------------------
````

También podemos pedir las predicciones para todos los valores de educación del padre, especificando el rango de la siguiente manera:

````
margins, at(paeduc=(0(1)20))
````

````
          Adjusted predictions                            Number of obs     =      6,350
          Model VCE    : OLS
    
          Expression   : Linear prediction, predict()
    
          1._at        : paeduc          =           0
    
          2._at        : paeduc          =           1
    
          3._at        : paeduc          =           2
    
          4._at        : paeduc          =           3
    
          5._at        : paeduc          =           4
    
          6._at        : paeduc          =           5
    
          7._at        : paeduc          =           6
    
          8._at        : paeduc          =           7
    
          9._at        : paeduc          =           8
    
          10._at       : paeduc          =           9
    
          11._at       : paeduc          =          10
    
          12._at       : paeduc          =          11
    
          13._at       : paeduc          =          12
    
          14._at       : paeduc          =          13
    
          15._at       : paeduc          =          14
    
          16._at       : paeduc          =          15
    
          17._at       : paeduc          =          16
    
          18._at       : paeduc          =          17
    
          19._at       : paeduc          =          18
    
          20._at       : paeduc          =          19
    
          21._at       : paeduc          =          20
    
          ------------------------------------------------------------------------------
                       |            Delta-method
                       |     Margin   Std. Err.      t    P>|t|     [95% Conf. Interval]
          -------------+----------------------------------------------------------------
                   _at |
                    1  |   10.23162      .0947   108.04   0.0000     10.04598    10.41727
                    2  |   10.54241   .0874204   120.59   0.0000     10.37103    10.71378
                    3  |   10.85319   .0802421   135.26   0.0000     10.69589    11.01049
                    4  |   11.16398   .0731947   152.52   0.0000     11.02049    11.30746
                    5  |   11.47476   .0663201   173.02   0.0000     11.34475    11.60477
                    6  |   11.78555    .059678   197.49   0.0000     11.66856    11.90253
                    7  |   12.09633   .0533553   226.71   0.0000     11.99174    12.20092
                    8  |   12.40711   .0474798   261.31   0.0000     12.31404    12.50019
                    9  |    12.7179   .0422385   301.10   0.0000      12.6351     12.8007
                   10  |   13.02868   .0378956   343.80   0.0000     12.95439    13.10297
                   11  |   13.33947   .0347889   383.44   0.0000     13.27127    13.40767
                   12  |   13.65025   .0332669   410.33   0.0000     13.58504    13.71547
                   13  |   13.96104   .0335457   416.18   0.0000     13.89528     14.0268
                   14  |   14.27182   .0355832   401.08   0.0000     14.20207    14.34158
                   15  |    14.5826   .0391053   372.91   0.0000     14.50595    14.65926
                   16  |   14.89339   .0437551   340.38   0.0000     14.80761    14.97916
                   17  |   15.20417   .0492139   308.94   0.0000      15.1077    15.30065
                   18  |   15.51496   .0552425   280.85   0.0000     15.40666    15.62325
                   19  |   15.82574   .0616739   256.60   0.0000     15.70484    15.94664
                   20  |   16.13653   .0683946   235.93   0.0000     16.00245     16.2706
                   21  |   16.44731   .0753272   218.34   0.0000     16.29964    16.59498
          ------------------------------------------------------------------------------
````

Usemos otro comando de postestimación. _predict_ estima los valores ajustados de la regresión y los guarda en una variable nueva, en este caso, llamada _fitted_

````
predict fitted
````

Podemos graficar nuestra línea de regresión predicha de varias maneras. Si sólo queremos la línea de regresión podemos usar:

````
twoway (line fitted paeduc)    
twoway (lfit educ paeduc)  
````

O, si queremos graficar los intervalos de confianza, usamos:

````
twoway (lfitci educ paeduc)
````

###### Figura 8 - Predicción lineal de educación por educación del padre

![](C:\Users\pjcar\Google Drive\201901 - Diseno y Analisis de la Investigacion Social\sol3000\Ayudantias\A5\img\Graph4.png)

También podemos superponer nuestra línea de regresión predicha en un scatterplot. Como en nuestro caso utilizar todos los puntos/observaciones, volvemos a realizar nuestra muestra de 300 casos. Graficamos, superponiendo la línea de regresión.

````
preserve
set seed 123
sample 300, count
twoway (scatter educ paeduc) (line fitted paeduc)
restore
````

###### Figura 9 - Predicción lineal de educación por educación del padre
![](C:\Users\pjcar\Google Drive\201901 - Diseno y Analisis de la Investigacion Social\sol3000\Ayudantias\A5\img\Graph5.png)

### Varianza y ajuste del modelo
#### Componentes de la varianza

Otra manera de interpretar la regresión de OLS es la siguiente: 

$$
y_{i}=\hat{y}_{i}+\hat{u}_{i}
$$

Para cada $i$, $y_{i}$ es igual a su valor ajustado $\hat{y}_{i}$ más su residuo $\hat{u}_{i}$. Si el promedio de los residuos es cero, el promedio muestral de los valores ajustados $\hat{y}_{i}$ es igual al promedio de las $y_{i}$, $\bar{\hat{y}}_{i}=\bar{y}_{i}$. Se puede demostrar que la covarianza entre $\hat{y}_{i}$ y $\hat{u}_{i}$ es cero. Por lo tanto, podemos decir que OLS descompone cada $y_{i}$ en dos partes, un valor ajustado y un residuo.

Establezcamos que la **Suma Total de Cuadrados** es:

$$
SST=\sum_{i=1}^{n}(y_{i}-\bar{y})^{2}
$$

La **Suma Explicada de Cuadrados**, la Suma de Cuadrados de la Regresión o la Suma de Cuadrados del Modelo es:

$$
SSE=\sum_{i=1}^{n}(\hat{y}_{i}-\bar{y})^{2}
$$

Y, como ya se señaló en la sección anterior, la **Suma Residual de Cuadrados** es:

$$
SSR=\sum_{i=1}^{n}\hat{u}_{i}^{2}=\sum_{i=1}^{n}(y_{i}-\hat{y}_{i})^{2}
$$

La **Suma Total de Cuadrados** es una medida de la variación total en las $y_{i}$. Dividida por $n-1$ equivale a la varianza de la muestra:

$$
s^{2}=\dfrac{\sum_{i=1}^{n}(y_{i}-\bar{y})^{2}}{n-1}=\dfrac{SST}{n-1}
$$

La Suma Explicada de Cuadrados mide la variación de los valores ajustados $\hat{y}_{i}$ y la Suma Residual de Cuadrados mide la variación de los residuos, o variación no explicada. La variación total de $y$ puede explicarse como la suma de la variación explicada más la variación no explicada. 

$$
SST=SSE+SSR
$$

#### R cuadrado
Una manera de medir qué tan bien la variable explicativa $x$ explica la variable de respuesta $y$ es calcular un indicador de **bondad de ajuste del modelo** (goodness of fit) que resuma qué tan bien se ajusta la línea de regresión de OLS a los datos. 

Un indicador de la bondad de ajuste es el **coeficiente de determinación** o **R cuadrado** de la regresión. El R cuadrado (no ajustado) se estima de la siguiente forma:

$$
R^{2}=\dfrac{SSE}{SST}
$$

o, dado que $SST=SSE+SSR$:

$$
R^{2}=1-\dfrac{SSR}{SST}
$$

Como podemos intuir de las fórmulas, el R cuadrado es el cociente de la variación explicada sobre la variación total. En otras palabras, representa cuánta varianza de la variable de resultado es explicada por la o las variables explicativas consideradas en el modelo. Decimos que el modelo tiene un buen ajuste si dicho modelo explica gran cantidad de la varianza de la variable de resultado.

El R cuadrado se interpreta como la proporción de la variación de la muestra de $y$ que es explicada por $x$, tiene una interpretación porcentual. De acuerdo con esto, el R cuadrado va de 0 a 1, y $R^{2}*100$ va de 0 a 100, dando cuenta del porcentaje de la variación de $y$ que es explicada por $x$. Si todos los puntos de los datos se encuentran sobre la línea de regresión de OLS, $R^{2}=1$. Si, en cambio, $R^{2}$ es cercano a cero, el ajuste de los datos es pobre dado que muy poco de la variación de las $y_{i}$ es captado por la variación de las $\hat{y}_{i}$. 

Volvamos al ejemplo anterior:

````
regress educ paeduc
````

```
                Source |       SS           df       MS      Number of obs   =     6,350
          -------------+----------------------------------   F(1, 6348)      =   1580.58
                 Model |  11033.3131         1  11033.3131   Prob > F        =    0.0000
              Residual |  44312.6279     6,348   6.9805652   R-squared       =    0.1994
          -------------+----------------------------------   Adj R-squared   =    0.1992
                 Total |  55345.9409     6,349  8.71726901   Root MSE        =    2.6421
    
          ------------------------------------------------------------------------------
                  educ |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
          -------------+----------------------------------------------------------------
                paeduc |   .3107844   .0078172    39.76   0.0000       .29546    .3261088
                 _cons |   10.23162      .0947   108.04   0.0000     10.04598    10.41727
          ------------------------------------------------------------------------------
```

El output de Stata nos muestra la suma total de cuadrados, la suma explicada de cuadrados y la suma residual de cuadrados. Podemos calcular $R^{2}$


````
dis 11033.3131/55345.9409
````

$R^{2}=0.1993518$, lo que corresponde con la estimación de $R^{2}$ entregada por el output, $R^{2}=0.1994$. Interpretamos que un 19.94\% de la varianza de la educación ha sido explicada por la educación del padre. 

### Asociación lineal: Pendiente y correlación
Sabemos que el modelo de regresión lineal usa una línea recta para describir la relación entre $x$ e $y$. ¿Qué nos indica respecto a la asociación entre dichas variables?

#### Coeficiente de regresión
La pendiente $\beta_{1}$ de la ecuación de predicción indica la dirección de la asociación. Su signo da cuenta de si la relación es positiva, cuando la pendiente va hacia arriba en la medida en que $x$ incrementa, o negativa, cuando la pendiente va hacia abajo en la medida en que $x$ aumenta. 

La pendiente, tal y como la hemos planteado hasta ahora, no entrega la fuerza de la asociación, si esta es fuerte o débil, porque su valor numérico está ligado a las unidades de medida. Volveremos a este problema cuando revisemos el modelo de regresión múltiple. 

#### Correlación
La correlación (de Pearson), designada como $r$, mide la dirección y la fuerza de la asociación lineal entre dos variables cuantitativas. Teniendo $y$ y $x$ cuantitativas, la correlación es la covarianza estandarizada.

Si la covarianza de $x$ e $y$ es:

$$
cov(x,y)=\dfrac{\sum_{i=1}^{n}(x_{i}-\bar{x})(y_{i}-\bar{y})}{n-1}
$$

La correlación entre $x$ e $y$ es:

$$
r=\dfrac{cov(x,y)}{s_{x}s_{y}}=\dfrac{\sum_{i=1}^{n}(x_{i}-\bar{x})(y_{i}-\bar{y})}{\sqrt{\sum_{i=1}^{n}(x_{i}-\bar{x})^{2} \sum_{i=1}^{n}(y_{i}-\bar{y})^{2}}}
$$

Una $r$ positiva indica una asociación positiva, mientras que una $r$ negativa indica una asociación negativa. $r$ toma valores entre -1 y 1. Los valores cercanos a 0 dan cuenta de una asociación débil.

Calculemos el coeficiente de correlación entre $educ$ y $paeduc$.

````
pwcorr educ paeduc, sig star(95)
````
````
                       |     educ   paeduc
          -------------+------------------
                  educ |   1.0000 
                       |
                       |
                paeduc |   0.4465*  1.0000 
                       |   0.0000
                       |
````

Encontramos una correlación de 0.4465, que indica una asociación positiva entre educación del padre y educación del hijo.

#### Correlación y coeficiente de regresión
Comparemos los estimadores del coeficiente de regresión y de la correlación:
$$
\hat{\beta}_{1}=\dfrac{\sum_{i=1}^{n}(x_{i}-\bar{x})(y_{i}-\bar{y})}{\sum_{i=1}^{n}(x_{i}-\bar{x})^{2}}
$$

$$
r=\dfrac{\sum_{i=1}^{n}(x_{i}-\bar{x})(y_{i}-\bar{y})}{\sqrt{\sum_{i=1}^{n}(x_{i}-\bar{x})^{2} \sum_{i=1}^{n}(y_{i}-\bar{y})^{2}}}
$$

La relación entre ambos estimadores es la siguiente:
$$
\hat{\beta}_{1}=r\dfrac{s_{y}}{s_{x}}
$$

Adicionalmente, se tiene que, para las regresiones simples:
$$
R^{2}=r^{2}
$$

Comprobemos en nuestro ejemplo. Calculemos el coeficiente de correlación entre $educ$ y $paeduc$ y la desviación estándar de ambas variables.

````
cor educ paeduc, means
````

````
          (obs=6,350)
    
              Variable |         Mean    Std. Dev.          Min          Max
          -------------+----------------------------------------------------
                  educ |     13.75827     2.952502            0           20
                paeduc |     11.34756     4.241711            0           20


                       |     educ   paeduc
          -------------+------------------
                  educ |   1.0000
                paeduc |   0.4465   1.0000
````

Calculemos $\hat{\beta}_{1}$. Recordemos que estimamos $\hat{\beta}_{1}=0.3108$ en nuestro modelo de regresión.

````
dis 0.4465*(2.952502/4.241711)
````

Nos entrega $\hat{\beta}_{1}=0.31079254$, aproximadamente el mismo resultado. 

Calculemos $R^{2}$. Habíamos estimado $R^{2}=0.1994$

````
dis 0.4465^2
````

Obtenemos $R^{2}=0.19936225$, nuevamente, el mismo resultado. 

Cuando las variaciones de $x$ e $y$ son iguales, $s_{x}=s_{y}$, la correlación entre ambas es numéricamente igual a $\hat{\beta}_{1}$. No obstante, es necesario tener en cuenta que ambas poseen diferencias:

- El valor del coeficiente de regresión depende de la unidad de medición de las variables. La correlación está estandarizada, por lo que $r$ no cambia cuando se modifica la escala de medición de $x$ o $y$. 
- La correlación no distingue entre variable de respuesta y variable explicativa, trata a ambas simétricamente. El coeficiente de regresión describe la asociación entre dos variables en una situación particular: una variable (explicativa) ayuda a predecir la otra variable (de respuesta).
\item La correlación mide el grado de asociación entre ambas variables, mientras que el coeficiente de regresión \emph{puede} dar cuenta de la relación o influencia de $x$ sobre $y$, estableciendo que:
   - La coeficiente de regresión sólo asume un carácter causal **si asumimos media condicional cero**. Es decir, si asumimos que el término error no está asociado con la(s) variable(s) explicativa(s), implicando que el término error tampoco está asociado a la variable de respuesta. El supuesto de media condicional cero puede ser incumplido por los estudios observacionales.
   - Sin media condicional cero, el coeficiente de regresión es una estimación muestral de un valor esperado condicional.
   - Esperar causalidad no es un motivo suficiente para elegir entre regresión y correlación.
   - Un motivo válido para elegir entre ambas es, en cambio, el control estadístico.

- El coeficiente de correlación no puede ser empleado para comparar la relación entre variables de muestras distintas. Asimismo, $R^{2}$ tampoco puede ser utilizado para comparar la bondad de ajuste de un modelo de regresión que emplea muestras distintas. El coeficiente de regresión, en cambio, entrega información válida para comparar un mismo modelo entre muestras distintas.






[dropbox]: http://example.com/  "Dropbox SOL3000"
[datos1]: http://example.com/  "Datos 1"
[source1]: http://gss.norc.org/About-The-GSS  "Fuente"

