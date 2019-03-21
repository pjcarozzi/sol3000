2.1 - Explorar base de datos
============================

Descargamos la base de datos [data\_casen\_2017\_1p](http://example.com/ "Datos 1"), desde el
[Dropbox](http://example.com/ "Dropbox SOL3000") del curso, y la guardamos en la carpeta de trabajo declarada para esta sesion. La base contiene una muestra aleatoria de 1% de [Casen 2017](http://observatorio.ministeriodesarrollosocial.gob.cl/casen-multidimensional/casen/casen_2017.php "Fuente") y una seleccion de variables.

Abrimos la base de datos

          . use data_casen_2017_1prc.dta, clear

Revisemos lo ue contiene la base:

          . describe
          Contains data from data_casen_2017_1prc.dta
          obs:  2,164                    
          vars: 29
          21 Mar 2019 01:06
          size: 502,048                          
          +--------------------------------------------------------------------------------------------------------------------------+
          |              storage   display    value                                                                              	|
          |variable name   type    format     label      variable label                                                          	|
          +--------------------------------------------------------------------------------------------------------------------------+
          |folio           double  %10.0g                Identificacion hogar (comuna area seg viv hogar)                            |
          |o               double  %10.0g                Orden                                                                       |
          |id_vivienda     double  %10.0g                Identificador de la vivienda (comuna area seg viv)                          |
          |hogar           double  %10.0g                Identificacion del hogar en la vivienda                                     |
          |region          double  %10.0g     region     Region                                                                      |
          |provincia       double  %10.0g     provincia		                                                                      |
          |                                              Provincia                                                                   |
          |comuna          double  %10.0g     comuna     Comuna                                                                      |
          |zona            double  %10.0g     zona       Zona                                                                        |
          |expr            double  %10.0g                Factor de Expansion Regional                                                |
          |expc            double  %10.0g                Factor de Expansion Comunal                                                 |
          |expr_div        double  %10.0g                Factor de expansion orientacion sexual (r23) e                              |
          |                                                identidad de genero (r24)                                                 |
          |varstrat        double  %10.0g                Estratos de Varianza                                                        |
          |varunit         double  %10.0g                Conglomerados de Varianza                                                   |
          |sexo            double  %10.0g     sexo       Sexo                                                                        |
          |edad            double  %10.0g                Edad                                                                        |
          |ecivil          double  %10.0g     ecivil     Estado civil                                                                |
          |o1              double  %10.0g     o1         o1. La semana pasada, trabajo al menos una hora,                            |
          |                                                sin considerar los quehaceres                                             |
          |o2              double  %10.0g     o2         o2. Aunque no trabajo la semana pasada, realizo                             |
          |                                                alguna actividad por lo menos d                                           |
          |o3              double  %10.0g     o3         o3. Aunque no trabajo la semana pasada, tenia                               |
          |                                                algun empleo, negocio u otra acti                                         |
          |o6              double  %10.0g     o6         o6. Busco trabajo remunerado o realizo alguna                               |
          |                                                gestion para iniciar una activida                                         |
          |oficio1         double  %10.0g     oficio1    o9a_cod. Cual es su ocupacion u oficio? (1 digito)                          |
          |ytotcorh        double  %10.0g                Ingreso total del hogar corregido                                           |
          |ypc             double  %10.0g                Ingreso total per capita del hogar corregido                                |
          |numper          double  %10.0g                Numero de personas en el hogar (excluye sdpa)                               |
          |asiste          double  %10.0g     asiste     Asiste                                                                      |
          |esc             double  %10.0g                Escolaridad                                                                 |
          |educ            double  %10.0g     educ       Nivel Educacional                                                           |
          |depen           double  %10.0g     depen      Dependencia Administrativa                                                  |
          |activ           double  %10.0g     activ      Condicion de actividad                                                      |
          +--------------------------------------------------------------------------------------------------------------------------+
          Sorted by:

El output de [describe](http://www.stata.com/manuals13/ddescribe.pdf#ddescribe) nos muestra el nombre del archivo, cuantas observaciones tiene (2164), cuantas variables tiene (29) y el tamaño del archivo en bytes. Mas abajo, detalla el nombre de las variables y las etiquetas de cada variable - que describen la informacion que contienen -, el nombre del grupo de etiquetas de valores (atributos) que cada una usa si ha sido declarado, su tipo de almacenamiento y el formato con el cual se muestran.

Otro comando basico para explorar variables y observaciones es [list](http://www.stata.com/manuals13/dlist.pdf#dlist). [list](http://www.stata.com/manuals13/dlist.pdf#dlist) nos muestra, caso a caso, los valores registrados para cada variable. Podemos imprimir los valores para todas las variables y observaciones, seleccionar algunas variables o seleccionar algunas observaciones.

Cuando no existe el valor para una determinada variable, es decir, se trata de un caso missing, Stata lo identifica con un punto (.).

Revisemos las variables sexo y escolaridad para las primeras 10 observaciones:

          . list folio sexo esc in 1/10

               +--------------------------+
               |     folio     sexo   esc |
               |--------------------------|
            1. | 1.311e+12    Mujer     9 |
            2. | 7.102e+11    Mujer     8 |
            3. | 1.320e+12    Mujer     8 |
            4. | 1.320e+12   Hombre    13 |
            5. | 9.103e+11    Mujer    12 |
               |--------------------------|
            6. | 1.311e+12    Mujer     . |
            7. | 6.104e+11   Hombre     5 |
            8. | 8.305e+11    Mujer     6 |
            9. | 3.301e+11    Mujer    15 |
           10. | 6.117e+11    Mujer    12 |
               +--------------------------+

Otro comando basico es [sort](http://www.stata.com/manuals13/dsort.pdf#dsort), que nos permite ordenar las observaciones segun una determinada variable. Ordenamos los datos ascendentemente segun escolaridad:

          . sort esc

Observemos el resultado usando [list](http://www.stata.com/manuals13/dlist.pdf#dlist)

          . list folio sexo esc in 1/5

               +--------------------------+
               |     folio     sexo   esc |
               |--------------------------|
            1. | 1.510e+12   Hombre     0 |
            2. | 8.103e+11    Mujer     0 |
            3. | 5.101e+11   Hombre     0 |
            4. | 2.101e+11    Mujer     0 |
            5. | 6.114e+11   Hombre     0 |
               +--------------------------+

Los 5 primeros casos tienen 0 años de escolaridad.

2.2 - Sintaxis
==============

La estructura de los comandos de Stata es simple, aunque la cantidad de comandos pueda parecer inicialmente abrumadora. Antes que todo, es util tener en mente dos comandos: [help](http://www.stata.com/manuals13/u4.pdf#u4Statashelpandsearchfacilities) y [search](http://www.stata.com/manuals13/u4.pdf#u4Statashelpandsearchfacilities)

[search](http://www.stata.com/manuals13/u4.pdf#u4Statashelpandsearchfacilities) es el motor de busqueda de Stata. Busca en los archivos locales del programa y tambien en Internet. Los resultados entregados corresponden a comandos de Stata, FAQs en [www.stata.com](http://www.stata.com/), blogs oficiales, articulos que han aparecido en [Stata Journal](https://www.stata-journal.com), y adiciones a Stata creadas por usuarios.

Supongamos que queremos obtener informacion acerca de test de heteroscedasticidad. Podemos escribir:

          . search heteroskedasticity test

Ejecutado el comando, aparece la ventana *Viewer* con los resultados de la busqueda, identificando sus fuentes.

![search](./Ayudantias/A1/img/search.jpg)

[help](http://www.stata.com/manuals13/u4.pdf#u4Statashelpandsearchfacilities) seguido por el nombre de un comando entrega los archivos de ayuda asociados a dicho comando. [help](http://www.stata.com/manuals13/u4.pdf#u4Statashelpandsearchfacilities) es, por lejos, el comando mas util para aprender a usar Stata.

Localicemos informacion de uno de los comandos que ya han utilizado en clase:

          . help summarize

Nuevamente, se abrira ventana *Viewer*.

![help](./Ayudantias/A1/img/help.jpg)

El primer vinculo bajo el titulo, que aparece precedido por una \[R\], enlaza la entrada correspondiente a [summarize](http://www.stata.com/manuals13/rsummarize.pdf#rsummarize) en el *Stata Base Reference Manual*. Si hacemos click, accedemos esta documentacion, en formato *pdf*, guardada en los archivos locales del programa.

Volvamos a mirar la ventana de visor. El segundo titulo, *Syntax*, nos muestra la sintaxis del comando. Como si fuera una oracion gramatical, la sintaxis nos indica las reglas que gobiernan el uso del comando, a que se aplica y las opciones que acepta.

          . summarize [varlist] [if] [in] [weight] [, options]

Indica que [summarize](http://www.stata.com/manuals13/rsummarize.pdf#rsummarize) puede ser escrito bajo la abreviatura [su](http://www.stata.com/manuals13/rsummarize.pdf#rsummarize), obteniendose los mismos resultados. Señala que [summarize](http://www.stata.com/manuals13/rsummarize.pdf#rsummarize) debe ser seguido por una variable o una lista de variables y que permite el uso de los *qualifiers* [if](https://www.stata.com/manuals13/u11.pdf#u11.1.3ifexp) e [in](https://www.stata.com/manuals13/u11.pdf#u11.1.4inrange). Tambien indica que puede utilizarse con ponderadores y que, precedido de una coma (,), pueden usarse distintas opciones especificadas mas abajo, en el titulo *Options*.

El titulo *Menu* nos muestra la manera de acceder al comando desde los menus desplegables de Stata.

El titulo *Description* brinda una descripcion general del comando. Como ya vieron en la clase, [summarize](http://www.stata.com/manuals13/rsummarize.pdf#rsummarize) calcula una serie de estadisticos descriptivos univariados.

Ejecutemos el comando

          . summarize

              Variable |        Obs        Mean    Std. Dev.       Min        Max
          -------------+---------------------------------------------------------
                 folio |      2,164    8.66e+11    3.95e+11   1.10e+11   1.52e+12
                     o |      2,164    2.478743    1.513695          1         13
           id_vivienda |      2,164    8.66e+09    3.95e+09   1.10e+09   1.52e+10
                 hogar |      2,164    1.034658    .2339639          1          5
                region |      2,164    8.709335    4.180739          1         16
          -------------+---------------------------------------------------------
             provincia |      2,164    88.99168    41.57661         11        163
                comuna |      2,164    8904.728    4159.488       1101      16305
                  zona |      2,164    1.180222    .3844609          1          2
                  expr |      2,164    83.34704    74.38008          2        793
                  expc |      2,164    83.06054    81.96431          2        759
          -------------+---------------------------------------------------------
              expr_div |        894    163.6611    219.6148          7       3436
              varstrat |      2,164    89674.68     42110.1      11001     169138
               varunit |      2,164    8.97e+09    4.21e+09   1.10e+09   1.69e+10
                  sexo |      2,164    1.520333    .4997019          1          2
                  edad |      2,164    37.54575    22.57186          0         95
          -------------+---------------------------------------------------------
                ecivil |      2,164    5.099353    3.179892          1          8
                    o1 |      1,760    1.477273    .4996252          1          2
                    o2 |        840    1.984524    .1235105          1          2
                    o3 |        827     1.96977    .1713225          1          2
                    o6 |        802    1.889027    .3142942          1          2
          -------------+---------------------------------------------------------
               oficio1 |        958    7.861169    45.43424          0        999
              ytotcorh |      2,164     1189102     1346921          0   2.24e+07
                   ypc |      2,164    358595.3      626926          0   2.24e+07
                numper |      2,162    3.896392    1.776341          1         16
                asiste |      2,164    1.737523    .4400821          1          2
          -------------+---------------------------------------------------------
                   esc |      1,749    10.92624    4.256338          0         22
                  educ |      2,164    4.665434    7.542016          0         99
                 depen |        568    4.473592    10.29011          1         99
                 activ |      1,760    1.860795    .9646671          1          3

Nos entrega el numero de observaciones validas, la media, desviacion estandar, valores minimo y maximo de todas las variables presentes en la base de datos.

Esto no es util para todas las variables, estos estadisticos no tienen mucho sentido si las variables no son continuas. Calculemos la media de escolaridad en la muestra.

          . summarize esc

              Variable |        Obs        Mean    Std. Dev.       Min        Max
          -------------+---------------------------------------------------------
                   esc |      1,749    10.92624    4.256338          0         22

La media de escolaridad en la muestra es 10,9 años. Tambien podemos obtener mas estadisticos descriptivos usando la opcion *detail* (abreviada *d*), precedida por una coma.

          . summarize esc, d

                                   Escolaridad
          -------------------------------------------------------------
                Percentiles      Smallest
           1%            0              0
           5%            3              0
          10%            5              0       Obs               1,749
          25%            8              0       Sum of Wgt.       1,749

          50%           12                      Mean           10.92624
                                  Largest       Std. Dev.      4.256338
          75%           14             21
          90%           17             22       Variance       18.11641
          95%           17             22       Skewness      -.4405767
          99%           19             22       Kurtosis       2.936748

Nos muestra adicionalmente los percentiles, la varianza, asimetria y curtosis.

          . quietly log close A1_2_explorardb
