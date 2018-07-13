# Configuración inicial

## link a un post
[Name of Link]({{ site.baseurl }}{% post_url 2007-10-29-first-post %})


## Listado de mis post
<ul>
  {% for post in site.posts %}
    <li>
      <a href="{{ post.url }}">{{ post.title }}</a>
      {{ post.excerpt }}
    </li>
  {% endfor %}
</ul>

## Ejemplo codigo 
{% highlight javascript %}
var k = {"d":2}
{% endhighlight %}

## fecha
{{ site.time | date_to_string }}

