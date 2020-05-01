# README

## Instalación

Podemos instalar diferentes librerías y paquetes para [correrlo](https://help.github.com/en/enterprise/2.14/user/articles/setting-up-your-github-pages-site-locally-with-jekyll) en nuestro sistema operativo

- Primero nuestro sistema operativo debe tener instalado ruby, gcc y cmake para poder instalar las librerías necesarias que requiere jekyll.
- Instalar la gema `bundler`, el cual es un administrador de gemas y versiones algo similar a npm.
- Instalar todos las gemas que necesita jekyll para funcionar: `bundle install`.
- Finalmente correr el servidor con `bundle exec jekyll serve`.
- Ahora podemos ver nuestro blog en `http://localhost:4000`

Podemos presentar algunos problemas con la instalación de Jekyll debido a algunos permisos por eso recomiendo seguir la guía de [Jekyll para ubuntu](https://jekyllrb.com/docs/installation/ubuntu/)

## Docker

La forma mas fácil de correr nuestro blog es usando docker, solo debemos instalarlo y seguir los siguientes pasos:

Se creo un archivo Dockerfile, el cual nos permite usar nuestro código en local y que funcione en el contenedor, usando una imagen de ubuntu.

Primero debemos estar ubicados en la carpeta del proyecto y ahi vamos a crear nuestra imagen a partir del `Dockerfile`

~~~bash
# creo una imagen llamada jhonny111s/codeoftoth apartir del directorio actual (.)
docker build -t jhonny111s/codeoftoth .  # usar el nombre de su blog
~~~

~~~bash
# corro la imagen, la cual ejecutará los comandos necesarios
# -it: modo interactivo
# -p 4000:4000 : obliga a jekyll a exponer el puesto que esta usando (4000)
# -v ${PWD}:/usr/src/app: usa el código de mi directorio actual en local como si estuviera en la carpeta /usr/src/app
docker run -it -p 4000:4000 -v ${PWD}:/usr/src/app  jhonny111s/codeoftoth
~~~

Ahora podemos ir a nuestro navegador `http://localhost:4000` y visualizar nuestro blog, cualquier cambio que hagamos en nuestro código local se verá reflejado en el contenedor, vasta con actualizar el navegador.