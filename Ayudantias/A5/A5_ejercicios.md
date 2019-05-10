# Ejercicios

Utilizando la base de datos base de datos [gss2016][datos1], que contiene información de la General Social Survey 2016 para una muestra de 2867 personas:

1. Nos interesa la relación entre el puntaje en una escala de prestigio ocupacional $prestg1$  y la educación de los encuestados $educ$, medida en años de escolaridad. Explore visualmente la relación entre ambas variables.
2. Formule la función de regresión poblacional estableciendo que la relación entre prestigio ocupacional y escolaridad es lineal. 
a.  Especifique qué representan las partes de la función.
b. ¿Esta función representa un modelo determinista o uno probabilístico? ¿Por qué?
3. Estime la función de regresión para la muestra. Identifique las estimaciones de: 
a.  Coeficiente de regresión. ¿Qué indica la magnitud y signo del coeficiente de regresión? Interprete. 
b. Intercepto. ¿Geométricamente, qué indica el intercepto? Interprete.
c.  Bondad de ajuste. ¿Qué es bondad de ajuste? ¿Cómo se calcula? Interprete.
4. Identifique los valores observados, valores predichos y residuos para las observaciones que tienen los 20 residuos más grandes.
a. Exponga sus resultados en una tabla.
b. ¿Qué representa cada uno de estos valores?
c. Presente sus resultados en un gráfico.
5. Calcule los valores predichos para:
a. Una persona con escolaridad en torno a la obtención de un diploma de educación secundaria (12 años), una persona con escolaridad en torno a la obtención de una licenciatura (16 años).
b. Toda escolaridad en el rango de valores de $educ$.
6. Estime una regresión lineal simple entre prestigio ocupacional y los siguientes atributos:
a. Tener un grado universitario, $degbach$.
b. Ser mujer, $sex$
c. Ser una persona de color, $poc$
Identifique sus estimaciones e interprete. 
6. Realice un test de independencia entre el nivel educativo del padre $padeg$ y el nivel educativo del encuestado $degree$.
a. ¿Qué quiere decir que las variables son dependientes/independientes?
b. Formule las hipótesis
c. Identifique el estadístico de prueba y su valor p.
d. Interprete
7. ¿Existen diferencias significativas en el promedio de años de escolaridad de los encuestados según el nivel de educación de su padre? 
a. ¿Qué análisis conviene implementar?
b. Formule las hipótesis.
c. Identifique el estadístico de prueba y su valor p.
d. Interprete
8. Calcule el coeficiente de correlación entre la escolaridad del encuestado y la escolaridad de su padre. Interprete.
a. A partir del coeficiente de correlación, calcule el coeficiente de regresión, para una regresión lineal simple entre ambas variables.
b. A partir del coeficiente de correlación, calcule el $R^{2}$ para una regresión lineal simple entre ambas variables.
c. Señale diferencias entre el coeficiente de correlación y el coeficiente de regresión.
9. Estime una regresión lineal simple donde la escolaridad del padre explique la escolaridad del encuestado, por género del encuestado.
a. Interprete las estimaciones para hombres y para mujeres.
b. ¿Podemos comparar la bondad de ajuste entre ambos modelos?
c. Grafique.