# jekyll-hooks
A Jekyll plugin to do find-and-replace in site content through hooks.

The most requirements like this are implemented by putting a simple hooks plugin into `_plugins` folder.
But it's not gonna work with Github Pages, even at local.
Github Pages locks down the `safe=true`, the `_plugins` folder won't work at all.

With this plugin, for the local build, it works.
For he remote build on Github Pages, of course it won't work by default.
But with [jekyll-deploy-action](https://github.com/jeffreytse/jekyll-deploy-action) together, it will.

## Sample Configuration

```yaml
# _config.yml

# jekyll-hooks
hooks:
  actions:
    - type: posts
      exts: [markdown,mkdown,mkdn,mkd,md]
      # ![alt](/path/to/image "title"){:.class}
      find: >
        !\[([^\]]*)\]\(((?!http[s]?://)[^"'\n]+)(?:\s['"]([^'"]*)['"])?\)(?:\{:\.([^{]+)\})?
      # both present and non-present quotes matter
      replace: >
        {% picture \2 --alt \1 --img class="\4" title="\3" %}
      case-insensitive: true
      disabled: false
  disabled: false
```

This configuration is turning the following markdown code:

```markdown
![A happy dog](/assets/images/a-happy-dog.png "Leica iiif, Summaron 35mm/F3.5"){:.photo}
```

into a [jekyll_picture_tag](https://github.com/rbuchberger/jekyll_picture_tag)
tag format which is used to generate responsive images HTML code:

```
{% picture /assets/images/a-happy-dog.png --alt A happy dog --img class="photo" title="Leica iiif, Summaron 35mm/F3.5" %}
```
