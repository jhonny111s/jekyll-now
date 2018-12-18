---
title: "Conociendo React js"
date: 2018-08-08
categories : [react, javascript]
author: jhonny111s
---
--------------------
## Todo List en React 

Para comenzar nuestra primera aplicacion en react, el bien conocido *todo list*  vamos a utilizar [create-react-app](https://github.com/facebook/create-react-app "proyecto basico preconfigurado en react") para programar sin tener que pensar en alguna configuración, como más adelante la idea es comenzar a trabajar con *TypeScript* y entender un poco mejor la estructura, en el repositorio iniciamos con [create-react-app-typescript](https://github.com/wmonk/create-react-app-typescript) sin pensar aun en el manejo que vamos a dar.

Antes de explicar nuestra aplicación, debemos entender un poco la estructura que en general tiene una aplicación en react, el primer archivos que debemos observar es el ***index.tsx*** el cual usa reactDom.render para incrustar nuestra instacia (las etiquetas en react son clases) llamada App en el elemento html root del ***index.html***.

App es una clase que representa el punto de partida de nuestra aplicacion, aqui es donde vamos a agregar nuestros componentes.

existen dos carpetas importantes que son *containers* y *components*, donde la primera contendra los archivos que presentan una logica o que proveen datos o comportamiento a componentes, usualmente tienen estados, mientras los components usualmente muestran como lucen las cosas, reciben la logica por medio de props y no especifican como se carga o cambia la información.

Lo primero que vamos a hacer es pensar nuestra aplicación como un conjunto de componentes esto quiere decir que debemos dividir nuestro **todo list** en partes funcionales: 

- Listado de tareas que vamos agregando.
- Formulario donde se escribe el item nuevo.
- Un menu basico con filtros para mostrar el estado de la tarea.

Como podemos observar en general tenemos tres componentes y un buena forma de aproximarse a la solución es empezar creando nuestra aplicacion con datos quemados, todo muy estatico.

{% include note.html content="Los archivos tienen una extension .tsx lo que significa que son archivos typescript que contendran elementos de react, si solo usan javascript la extension es [.jsx](https://reactjs.org/docs/introducing-jsx.html#why-jsx)." %}


### App.tsx
~~~react
import * as React from 'react';

import './App.css';

import AddTodo from './containers/AddTodo';
import MenuFilter from './containers/MenuFilter';
import VisibleTodoList from './containers/VisibleTodoList';

class App extends React.Component {
  public render() {
    return (
      <div className="App">
        <div className="App-intro">
          <AddTodo/>
          <VisibleTodoList/>
          <MenuFilter/>
        </div>   
      </div>
    );
  }
}

export default App;

~~~

Por lo general lo mas conveniente al programar una aplicación en Reat es empezar de lo especifico a lo general, pero para intentar que se entienda lo que queremos lograr vamos a mostrat  el archivo ***app.tsx*** en el cual vemos las etiquetas normales de html y tres etiquetas nuevas que representa una parte del programa a nivel logico y visual, vamos a explicar cada uno de ellos y empecemos por ***VisibleTodoList*** el cual va a ser el contenedor de una lista de items:

### VisibleTodoList.tsx
~~~react
import * as React from 'react';
import TodoItem from '../components/TodoItem';

class VisibleTodoList extends React.Component <{},{}> {

  public render() {
    return (
        <div>
            <p>Contenedor de items</p>
            <ul>
              <TodoItem> Primer item</TodoItem> 
              <TodoItem> segundo item</TodoItem> 
              <TodoItem> N item</TodoItem> 
            </ul>
        </div>
    );
  }
}

export default VisibleTodoList;

~~~

Al observar el contenedor identificamos otra etiqueta llamada ***TodoItem***, el cual va  ser el [componente](https://reactjs.org/docs/components-and-props.html#composing-components) que se encarga de dibujar un solo item de la lista recibiendo datos desde el contenedor:

### TodoItem.tsx
~~~react
import * as React from 'react';

class TodoItem extends React.Component <{},{}> {

  public render() {
    return (
        <React.Fragment>
        <li> {this.props.children} </li>
        </React.Fragment>
    );
  }
}

export default TodoItem;
~~~

los componentes pueden recibir explicitamente props o parametros, algo que vamos a hacer más adelante, o implicitamente por medio de *props.children* el cual pasamos dentro de la etiqueta `<TodoItem> children </TodoItem>`, ahora si corremos nuestro codigo podemos ver un listado de tres `li` con los items que agregamos en VisibleTodoList.

{% include note.html content="siempre nuestro render debe tener un unico padre ya sea un div que cubra todo el contenido o un fragment como en este caso" %}

{% include note.html content="Para correr nuestro codigo usamos `npm run start`" %}

El siguiente contenedor es ***MenuFilter.tsx***, el cual va a contener tres botones sin ninguna funcionalidad por el momento para filtart nuestra lista, ya sea para mostrar toda la lista, las tareas completadas o las tareas activas.

### MenuFilter.tsx
~~~react
import * as React from 'react';

class MenuFilter extends React.Component <{},{}> {

  public render() {
    return (
        <div>
            <p>Menu filter</p>
            <button> All </button>
            <button> Active </button>
            <button> Complete </button>
        </div>
    );
  }
}

export default MenuFilter;
~~~

y por ultimo tenermos nuestro formulario donde ingresaremos la nueva tarea ***AddTodo.tsx***

### AddTodo.tsx
~~~react
import * as React from 'react';

class AddTodo extends React.Component <{},{}> {
  public render() {
    return (
        <div>
          <form>
            <input />
            <button type="submit">
              Add Todo
            </button>
          </form>
        </div>
    );
  }
}

export default AddTodo;
~~~