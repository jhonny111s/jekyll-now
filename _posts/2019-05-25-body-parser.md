---
title: "Body-parser"
date: 2019-05-25
categories : [nodejs, bodyParser]
author: jhonny111s
---

----------------
## Que es body parser?

Body parser es un middleware o utilidad muy usada por el framework expressjs  que se encarga de agregar a nuestro request el campo *body* de acuerdo al tipo de contenido enviado en las cabeceras http.

ExpressJs se encarga de facilitar y abstraer la complejidad de Nodejs, sin embargo para entender el porque debemos usar [body-parser](https://www.npmjs.com/package/body-parser), debemos hablar de lo que pasa tras bambalinas.

Primero verifiquemos que resultado obtenemos en el *body*  sino utilizamos este middleware:

~~~javascript
// body is not defined into request
app.post('/', function (req, res) {
  const body = req.body;  // undefined
  res.send(JSON.stringify(body, null, 2));
});
~~~

Cuando creamos un servidor a este se le pasan dos parámetros, `request` y `response` los cuales son unos objetos con una cantidad de propiedades y métodos. Para el caso de request este es un objeto `incomingMessage` el cual implementa una intefaz  `readablestream`, esto significa que vamos a tener varios métodos que proveen un stream, osea un flujo de información que puede llegar por partes (buffer).

{% include note.html content="para más informacíon ver: [IncomingMessage](https://nodejs.org/api/http.html#http_class_http_incomingmessage), [stream.Readable](https://nodejs.org/api/stream.html#stream_class_stream_readable), [buffer](https://nodejs.org/api/buffer.html#buffer_buffer) " %}

El siguiente [ejemplo](https://nodejs.org/en/docs/guides/anatomy-of-an-http-transaction/#request-body) muestra un POST  el cual debe debe leer el *body* desde un evento llamado `data`
y concatenarlo y procesarlo en un evento `end`:

~~~javascript
// https://nodejs.org/api/stream.html#stream_event_data
app.post('/', function (req, res) {
  let body = [];
  /**
  * The 'data' event emits either a Buffer (by default) or a string if setEncoding() was used.
  **/
  req.on('data', (chunck) => {
    console.log(`Received ${chunck.length} bytes of data`, chunck);
    body.push(chunck);
  })
  /**
  * Emitted when the stream has received an EOF (FIN in TCP terminology).
  * Indicates that no more 'data' events will happen.
  * If the stream is also writable, it may be possible to continue writing.
  **/
  .on('end', () => {
    console.log(`Array of chunks`, body);
    body = Buffer.concat(body).toString();
    console.log(`Final body transform to string: ${body}`);
    res.send(body);
  })
});
~~~

{% include note.html content="Con `on` podemos acceder a los métodos del request, en este caso `data` y `end`" %}


body parser lo que hace es abstraer toda esta complejidad y simplemente agregar una propiedad llamada body al request, donde este buffer se convierte a un string, objeto, o html según el tipo de cabecera; o si hay un error o no se reconoce el tipo de dato devuelve un `{}`.

~~~javascript
/**
* Parse incoming request bodies in a middleware
* before your handlers, available under the req.body property.
**/
 app.use(bodyParser.urlencoded({ extended: false }));
 app.use(bodyParser.json())
~~~