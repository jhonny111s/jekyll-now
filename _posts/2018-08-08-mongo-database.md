---
title: "Mongo"
date: 2018-08-08
categories : [mongo, nosql]
author: jhonny111s
---

----------------
##  Que es mongo?

Es una base de datos basada en documentos, osea que utiliza la notacion [JSON](https://www.json.org/) e internamente trabaja con [BSON](http://bsonspec.org/) el cual se encarga de externder los tipos de datos de json y trabajar de manera binaria para ser más flexible y eficiente.

{% include note.html content="todos los lenguajes manejan [tipos de datos](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/datatypes.html) para saber si ingresamos un numero, una cadena o un array y segun el lenguaje podemos tener un tipado fuerte o uno debil" %}

###  Instalación

Mongo puede ser instalado en multiples sistemas operativos, pero donde tal vez se más sencillo es en mac, windows y distribuciones linux como redHat, ubuntu y debian.

En general el metodo más comun de [instalación](https://docs.mongodb.com/manual/administration/install-community/) es descargar el archivo comprimido que contiene todos los binarios y copiar estos archivos a un directorio para el caso de linux y mac */usr/local/bin* y para el caso de windows basta con instalar y agregar al path la ruta de instalacion hasta la carpeta bin.

una vez terminado el paso anterior es necesario crear una carpeta que generalmete se agrega a la raiz y contendra todas nuestra bases de datos, por defecto mongo reconoce: */data/db*

### Como usarlo

una vez tengamos corriendo el servidor y el cliente de mongo, en el cliente podemos visualizar los comandos más utiles escribiendo *help*.

- show dbs: muestra los nombre de las base de datos creadas
- use *db*: crea una base de datos con el nombre dado e ingresa a esta.
- db.*colección*.*metodo*: en la base de datos actual aplica un [metodo](https://docs.mongodb.com/manual/reference/method/js-collection/) a la coleccón.

un ejemplo sería crear una base de datos llamada biblioteca, con una colleción llamada libros, que contenga un registro de un libro de stephen king.

~~~ javascript
> use biblioteca
> db.libros.insertOne({"titulo": "Doctor sueño", "author": "Stephen King"})
> db.libros.find()
~~~