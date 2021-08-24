# Napkin Wiki

This is jekyll based wiki with `just-the-docs` theme.

To build locally run:

``` shell
nix-shell
```

Wiki would be available by
[http://localhost:4000](http://localhost:4000) in a browser.

The officially published version is available at [github
pages](https://soostone.github.io).


Commit and push to the master branch to publish a new version.

Nonetheless `Github Pages` can generate HTML out of jekyll files
on-the-fly - custom `Gitlab` pipeline is configured, because the
service provides obsolete gems and can fail with obscure errors.  The
custom pipeline gives consistent behavior across CI server and local
environment.

The repo with rendered HTML is
[here](https://github.com/Soostone/Soostone.github.io.git).

Locally HTML output is rendered into `_site` folder.
