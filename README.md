# jekyll-hooks
A Jekyll plugin to do find-and-replace in site content through hooks.

The most requirements like this are implemented by putting a simple hooks plugin into `_plugins` folder.
But it's not gonna work with Github Pages, even at local.
Github Pages locks down the `safe=true`, the `_plugins` folder won't work at all.

With this plugin, for the local build, it works.
For he remote build on Github Pages, of cause it doesn't by default.
But with [jekyll-deploy-action](https://github.com/jeffreytse/jekyll-deploy-action) together, it works.

## Sample Configuration

```yaml
# _config.yml

# jekyll-hooks
hooks:
  actions:
    - type: posts
      exts: [markdown,mkdown,mkdn,mkd,md]
      find: !ruby/regexp '!\[(.*)\]\(((?!http[s]?://).+)\)(?:{:([^}]+)})*'
      replace: !ruby/regexp '{% picture \2 --alt \1 %}'
      case-insensitive: true
      disabled: false
  disabled: false
```

This configuration is turning the following markdown code:

```markdown
![A happy dog](/assets/images/a-happy-dog.png)
```

into a [jekyll_picture_tag]() tag format which is used to generate responsive images HTML code:

```
{% picture /assets/images/a-happy-dog.png --alt A happy dog %}
```
