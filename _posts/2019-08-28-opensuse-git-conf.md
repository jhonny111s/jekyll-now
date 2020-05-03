---
title: "Ssh key"
date: 2019-08-28
categories : [nodejs, git]
author: jhonny111s
---

----------------
## Crear ssh key en Opensuse

Una llave ssh básicamente es una credencial encriptada que contiene información con la cual nos podemos autenticar en una aplicación o servicio sin la necesidad de ingresar usuario y contraseña 

{% include note.html content="Para mas información ver [ssh key](https://www.ssh.com/ssh/keygen/) " %}

## GIT

Generalmente cuando pretendemos crear una llave ssh es porque queremos configurar algún repositorio que tenemos almacenado en github, gitlab o bitbucket, para acceder a este sin estar digitando usuario y contraseña y esto pasa cuando lo clonamos con http, sin embargo tenemos la opción de seleccionar ssh. Lo primero que debemos hacer entonces es tener instalado git.

{% include note.html content="[GIT](https://git-scm.com/book/en/v2/Getting-Started-About-Version-Control) es un sistema para controlar el versionamiento de código"%}

~~~bash
# zypper es el gestor de paquetes de opensuse
> sudo zypper install git
~~~

El siguiente paso importante es identificarnos, cuando hacemos un commit y luego un push a una rama, este debe tener la información de quien lo hizo, por medio de su correo y nombre. Por repositorio podemos tener diferentes configuraciones, sin embargo aquí vamos a usar la configuración global.

~~~bash
# debe funcionar en cualquier sistema operativo
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
~~~

## SSH

La llave ssh esencialmente consiste de una parte publica (`.pub`) y otra privada, donde podemos compartir nuestra llave publica y quien la tenga podrá comunicarse con nosotros sin brindar algún dato, siempre y cuando la llave privada certifique que es correcta la publica. El siguiente comando se encarga de crear las dos llaves:

~~~bash
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
# Enter en todas las opciones que aparecerán
~~~

Ahora debemos copiar nuestra llave publica desde nuestra consola e ir a pegarla en nuestro sistema preferido de alojamiento de repositorios, para este ejemplo vamos a usar github, sin embargo las instrucciones son casi iguales para otros.

~~~bash
# muestra en la consola el contenido del archivo, lo debemos copiar
cat < ~/.ssh/id_rsa.pub
~~~

Copiamos esta cadena de caracteres y la vamos a copiar en [settings/ssh keys and gpg keys](https://help.github.com/es/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account).

{% include note.html content="Para mas información ver [generating SSH key](https://git-scm.com/book/en/v2/Git-on-the-Server-Generating-Your-SSH-Public-Key)"%}

## Repositorio

Una vez completados los pasos anteriores ya podremos crear y clonar nuestros repositorios desde github, hacerles pull o push sin que nos pida usuario y contraseña.

{% include note.html content="Creamos nuestro proyecto desde github, solo debemos clonarlo [crear nuevo repositorio](https://help.github.com/en/github/getting-started-with-github/create-a-repo)"%}
{% include note.html content="Podemos crear nuestro proyecto local y luego agregar la url de nuestro proyecto creado en github [subir repositorio local](https://help.github.com/en/github/using-git/adding-a-remote)"%}

 