# Ejercicios

Utilizando la base de datos [data\_casen\_2017\_1p](https://www.dropbox.com/s/8fo5oebnzdxtoxe/data_casen_2017_1prc.dta?dl=0 "Casen 2017"):

1. Recodificar la variable _edad_ por tramos (_tedad_), que contemple los tramos: 0-14; 15-19; 20-24;25-34; 35-44; 45-54; 55-64; 65 y más.

2. Recodificar la variable _educ_ en una nueva variable (llamada _neduc_), que tenga los siguientes atributos:
- S/E Básica incomp. (educ= sin educ, básica incompleta),
- Básica completa (educ= básica completa, media humanista incompleta, media técnica incompleta),
- Media completa (educ= media humanista completa, media técnica completa, técnico superior incompleta, profesional incompleta),
- Técnico superior completa,
- Profesional completa(educ= profesional completa, postgrado incompleto, postgrado completo)

Deje ns/nr como casos perdidos.

3. Usando tab y qualifiers, cree tablas univariadas para la variable _neduc_ por sexo para quienes tienen entre 30 y 65 años.

4. Recodifique _ecivil_ en una variable nueva (_reccivil_) que tenga los siguientes atributos:
- Casado / conviviente
- Anulado, separado, divorciado, viudo
- Soltero

5. Utilizando la variable _asiste_, señale ¿Qué porcentaje de la muestra asiste a un establecimiento educacional?

6. Utilizando la variable _depen_, genere una tabla univariada que dé cuenta de la distribución de porcentajes por dependencia educacional entre quienes asisten a unestablecimiento educacional. Recodifique antes NS/NR como caso perdido. ¿Cuál es la moda? ¿Qué porcentaje de la muestra asiste a una universidad del CRUCH?

7. Genere tablas univariadas que le permitan comparar la distribución por dependencia educacional y zona de residencia entre quienes tienen 17 años o menos. Interprete los resultados.
