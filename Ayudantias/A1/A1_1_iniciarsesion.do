quietly log using A1_1_iniciarsesion, replace name(A1_1_iniciarsesion) 

/***

1. Iniciar una sesion en Stata
==============================

Al abrir Stata, podemos reconocer cuatro ventanas básicas:

1. Resultados
2. Command
3. Review
4. Variables y Propiedades

![interface](./Ayudantias/A1/img/GUI.jpg)

Stata es un programa que opera a través de comandos. 
Los comandos pueden ser escritos en la ventana _Command_ o ejecutados 
desde un _do-file_.

Cuando se ejecuta un comando, los resultados aparecen en la ventana _Results_.

La ventana _Review_ constituye un historial de comandos, listando todos los 
comandos que han sido ejecutados durante la sesión en Stata.

Las ventanas _Variables_ y _Properties_ exponen la lista de variables presentes 
en la base de datos cargada en la memoria del programa y sus propiedades. 
Cuando no hay una base de datos cargada, estas ventanas no muestran información.

Para mantener un registro de todas las operaciones realizadas sobre los datos, 
utilizaremos un _do-file_. Abrimos el _Do-file Editor_, escribiendo

***/

doedit


/***

en la ventana _Command_ y presionando _Enter_.

![doeditor](./Ayudantias/A1/img/doeditor.jpg)

Con esto se abre el _do-file editor_, por ahora una ventana en blanco que 
muestra la pestaña _untitled.do_ que identifica el archivo que acabamos de 
crear. 

El _do-file editor_ permite editar los scripts o archivos de órdenes de Stata, 
llamados _do-files_. 

Usar el do-file para guardar los comandos utilizados constituye una buena 
practica y sera promovida en este curso. Los do-file nos permitiran registrar
ordenadamente el codigo utilizado y con esto el procesamiento realizado sobre 
los datos. A su vez, este registro posibilita que otros puedan usar el codigo y 
volver a realizar nuestros analisis de los datos, es decir, que este sea 
potencialmente reproducible.

Con ambos objetivos en mente (orden y "reproducibilidad"), se recomienda 
organizar el codigo en secciones y realizar aclaraciones respecto a los que se 
pretende hacer y cuales son los resultados esperados. El lenguaje de Stata 
reconoce marcadores específicos como comentarios, es decir, como trozos de 
texto que no son codigo y por lo tanto no debe ser ejecutado. Insertar estos
comentarios nos permite no solo mantener un registro ordenado y reproducible,
sino "humanamente" comprensible.

Stata tiene diversas maneras de identificar comentarios:

1. Iniciar una línea con *
2. Ingresar // en una línea
3. Varias líneas con /*** y ***/

![comments](./Ayudantias/A1/img/comments.jpg)

Todo lo que ha sido identificado como comentario y reconocido por Stata quedara 
registrado en el _do-file_ en color verde.

Convencionalmente, las primeras líneas de un _do-file_ incluyen un encabezado 
que identifica el proyecto, nombre de archivo, la versión del programa, fecha, 
autor y otros datos que se consideren relevantes. Por ejemplo, Ingresamos la 
siguiente información en el _do-file_ recién  creado. 
Como no se trata de comandos, la identificamos como comentario.

![header](./Ayudantias/A1/img/head.jpg)

Otra convencion es que la primera linea de comando identifique la version de 
Stata para la cual se escribio el _do-file_. Esto permite que versiones mas
recientes del programa reconozcan los comandos. 

Si no sabemos con certeza que version estamos usando usemos el comando:

***/

version


/***

Volvamos al _do-file_, y escribimos
 
***/

version 14


/*** 

Tambien es recomendable limpiar la memoria del programa, para empezar la sesion 
desde cero.

***/

clear all
macro drop _all
capture log close 


/*** 

Para mantener los archivos localmente ordenados, declaramos una carpeta de
trabajo. Stata buscara y guardara los archivos producidos durante la sesion
en esta carpeta a menos que se especifique una diferente. Como ejemplo,
creemos una carpeta en Desktop:

***/

mkdir "C:\Users\pjcar\Desktop\ayudantia1"


* mkdir ~ /projects/ayudantia1 o algo asi en Mac
* rmdir "directory name" para eliminar carpetas

/*** 

Para declarar que esta carpeta sera nuestra carpeta de trabajo, escribimos:

***/

cd "C:\Users\pjcar\Desktop\ayudantia1"


/*** 

La direccion debe ir entre comillas y debe referir a una carpeta existente.

Ejecutemos lo que hemos escrito en nuestro _do-file_. Seleccionamos los 
comandos que deseamos ejecutar y presionamos CTRL+D (Command+Shift+D en Mac)

Con esto quedan declarada nuestra carpeta y los comandos iniciales. 
Verifiquemos los contenidos del directorio de trabajo.
***/

dir


/*** 

La carpeta esta vacia. Guardemos en ella el _do-file_ en el que estamos trabajando.
Esto debe hacerse a través de GUI. En la ventana del _Do-file Editor_, el
menu desplegable _File_ contiene la opcion _Save as_. 

Llamemos este archivo "ayudantia1" y cerremos el _do-file_. Volvamos a checkear
los contenidos de la carpeta.

***/

dir


/*** 

OK. Volvamos a abrir _ayudantia1.do_, esta vez a traves de la ventana _Command_.

***/

doedit ayudantia1


/*** 

Los _do-file_ sirven para guardar los comandos, pero no los resultados que 
van apareciendo en la ventana _Results_. Para registrar todo el proceso, podemos
usar un _log file_. Los _log files_ son especialemente practicos cuando se ejecutan
secciones largas de codigo, porque la ventana _Results_ solo muestra los 
resultados mas recientes, o, por ejemplo, cuando el procesamiento es muy demandante en
recursos y no queremos/podemos volver a correr el codigo, o cuando, por 
motivos externos (ej. Windows se cuelga/reinicia) el programa se cierra. Los
_log files_ no son necesarios, pero son utiles.

Creemos un log file llamado _logayudantia1_, que tendra por nombre _ayudantia_:

***/

log using logayudantia1, replace name(ayudantia) 


/*** 

Los _log files_ se guardan automaticamente bajo la extension _.smcl_, pero 
tambien se puede especificar la extension _.txt_. El archivo ira "grabando" el
desarrollo del trabajo hasta que se pida directamente al programa que suspenda
el registro o se cierre el log.

***/

log close ayudantia


quietly log close A1_1_iniciarsesion

