# README

## Instalación

- Primero nuestro sistema operativo debe tener instalado ruby, gcc y cmake para poder instalar las librerias necesarias que requiere jekyll.
- Instalar la gema `bundler`, el cual es un administrador de gemas y versiones algo similar a npm.
- Instalar todos las gemas que necesita jekyll para funcionar: `bundle install`.
- Finalmente correr el servidor con `bundle exec jekyll serve`.
- Ahora podemos ver nuestro blog en `http://localhost:4000`

## Docker

Se creo un archivo Dockerfile, el cual nos permite usar nuestro código en local y que funcione en el contenedor, usando una imagen de ubuntu.

Primero debemos estar ubicados en la carpeta del projecto y ahi vamos a crear nuestra imagen apartir del Dockerfile

~~~bash
# creo una imagen llamada jhonny111s/codeoftoth apartir del directorio actual (.)
docker build -t jhonny111s/codeoftoth .
~~~

~~~bash
# corro la imagen, la cual ejecutará los comandos necesarios
# -it: modo interactivo
# --network host: obliga a jekyll a exponer el puesto que esta usando (4000)
# -v $(pwd):/usr/src/app: usa el código de mi directorio actual en local como si estuviera en la carpeta /usr/src/app
docker run -it --network host -v $(pwd):/usr/src/app  jhonny111s/codeoftoth
~~~

Ahora podemos ir a nuestro navegador `http://localhost:4000` y visualizar nuestro blog, cualquier cambio que hagamos en nuestro codigo local se verá reflejado en el contenedor, vasta con actualizar el navegador.