---
title: "Ramas Git"
date: 2019-05-29
categories : [nodejs, branching, ramas, git]
author: jhonny111s
---

----------------
## Estrategia para ramificar un proyecto.

Usualmente al comenzar con un proyecto y claro esta usar Git como herramienta de control de versiones, debemos tratar de ser lo más ordenados posibles para que el proyecto no se convierta en un caos y es por eso que se han creado metodologías para crear ramas, como por ejemplo [gitflow workflow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow) el cual define un modelo para manejar grandes proyectos. Las siguientes son las ramas que usualmente he usado en proyectos y que están muy alineadas con lo que se propone en la industria.

### Master

La rama master debe solo contener lanzamientos oficiales, ósea releases y hotfix versionados.

~~~javascript
> git checkout master
~~~

{% include note.html content="Nunca se programa directamente sobre la rama `master`, esta debe estar bloqueada para hacer commits directamente y solo una persona o un sistema con permisos de adminstrador debería hacerlo." %}

### Develop

La rama de desarrollo es en la cual vamos a integrar todas nuestras características y correcciones de bug, la cual en general va a conservar todo el historial de nuestro desarrollo.

~~~javascript
// create a branch call develop from master
> git checkout -b develop master
~~~

{% include note.html content="Nunca se programa directamente sobre la rama `develop`, esta debe estar bloqueada para hacer commits directamente, los usuarios solo podran hacer `pull request` que se podrán mezclar si fue revisada y aprobada por dos o más desarrolladores." %}

### Feature/

Las ramas de características (feature), son aquellas que se ramifican siempre de desarrollo (develop), y son usualmente una nueva funcionalidad o tarea asignada, como por ejemplo desde jira. Su nombramiento debe se `feature/<taskName>`, usualmente si las tareas son asignadas desde jira, este genera un código parecido a `BRD-240`, o si nuestra tarea tiene un nombre entonces la rama debe tener el nombre donde las separaciones van con `_` , ejemplo `refactor_project`. Es aconsejable siempre manejar códigos que podamos fácilmente identificar, en el caso de jira podemos vincular este código con nuestra rama.

Usualmente en mi caso particular siempre hago un `merge squash` del feature a develop, otros hacen un `merge commit`, la razón de hacer un squash es que las tareas deben ser muy especificas y no tan grandes (una funcionalidad nueva muy grande se puede dividir en varias tareas) por lo que al combinar todos mis commit en uno no suponen un problema y es más fácil de leer el historial del Git.

~~~javascript
> git checkout -b feature/[taskName] develop
~~~

{% include note.html content="Toda tarea debe empezar en una rama `feature` y tener su `pull request` (PR), con su debida descripción, link a la tarea en jira o otro sistema que se use y posiblemente un check list donde se lista lo que se debe verificar antes de aprobar el PR. Ver [squash](https://github.blog/2016-04-01-squash-your-commits/)" %}

### Bugfix/

La rama para arreglar bugs funciona exactamente igual que la feature, y su nombramiento esta sujeto a las mismas reglas, la única diferencia es que ya se ha identificado un bug que debe ser solucionado por lo tanto en el historial va ser fácil de encontrar y filtrar.

~~~javascript
> git checkout -b bugfix/[taskName] develop
~~~

{% include note.html content="Un bug es un error que encontramos en nuestro código y ha sido agendado para ser arreglado, no es urgente por lo que puede esperar hasta el lanzamiento del siguiente release." %}

### Release/

Un lanzamiento es enviar todos las nuevas características y correcciones de bugs que se han mezclado en develop a master, es una tarea cíclica, se debe hacer cada cierto tiempo usualmente al finalizar un spring o después de que haya sido probado en staging (ambiente para probar producción).
Se debe crear una rama que cumpla con el estándar de [semantic version](https://semver.org/) `<mayor.minor.patch>`, como por ejemplo `release/0.1.0`, esta rama siempre debe ser sacada de develop y una vez se revise y apruebe se debe hacer un `merge commit` y además crear el `tag` correspondiente. La mezcla se puede hacer directamente a master y luego de nuevo a develop o puede ir a staging ser probado y aprobado, entonces retornar al paso inicial.

~~~javascript
> git checkout -b release/[semVersion] develop
~~~

{% include note.html content="Cuando se decide hacer un release (`release === snapshot develop`), debemos intentar no agregar más características una vez creada, debemos tener la confianza que la rama develop esta estable, para esto debemos correr test unitarios y de integración, un linter y además verificar la cobertura del código. Es importante recalcar que siempre a master se debe hacer un `merge commit`." %}

### hotfix/

Para arreglar problemas que son muy urgentes en **producción** debemos crear una rama a partir de master llamada por ejemplo `hotfix/BRD-130` y ademas crear un tag, una vez se haga la corrección se debe mezclar esa rama a master y a develop.

~~~javascript
> git checkout -b hotfix/[taskName] master
~~~

{% include note.html content="Los hotfix al igual que todas las ramas deben ser probadas y aprobadas, no existe ninguna excusa para no hacerlo. Ver [tag](https://git-scm.com/book/en/v2/Git-Basics-Tagging)" %}

### Doc/

Usualmente si nuestro proyecto es muy grande podemos mantener una rama solo para agregar o actualizar documentación, sin embargo esto puede ser parte de una rama feature.

~~~javascript
> git checkout -b doc/[taskName] develop
~~~