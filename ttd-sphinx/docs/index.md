# TTD-Sphinx

Containerized application based on [Sphinx](http://www.sphinx-doc.org/en/stable) for documentation test builds.

The main purpose of this application is to create test builds in an 'easy', 'fast' and 'repeatable' way.

## Dependencies

- [Docker](https://www.docker.com/)
- A working Internet connection to pull the container on the first run

Please follow the [installation guide](https://docs.docker.com/engine/installation/) of Docker or consult the documentation of your Operating System.

## Usage

### Building HTML

*ttd-sphinx* is designed to build HTML out of `rst` or `md` files in your current working directory (`$PWD`).

The build output will be saved in a directory called *_build* in your `$PWD`.

#### Example

Change into your documentation directory (/docs) of your project:

```shell
cd docs
```

Do a `ls` to see all the files here:

```shell
index.rst
```

Run *ttd-sphinx*:

```shell
docker run -v `pwd`:/build/docs testthedocs/ttd-sphinx html
```

After the build is finished, check the content of the directory with `ls` again:

```shell
index.rst    _build
```

### Debug Mode

Run *ttd-sphinx* in *debug mode*.

```shell
$ docker run -v `pwd`:/build/docs testthedocs/ttd-sphinx debug
rm -rf docs/_build/*
sphinx-build -c _config -n -b html -d docs/_build/doctrees   docs docs/_build/debug
Running Sphinx v1.6.3
making output directory...
loading pickled environment... not yet created
building [mo]: targets for 0 po files that are out of date
building [html]: targets for 1 source files that are out of date
updating environment: 1 added, 0 changed, 0 removed
reading sources... [100%] index

looking for now-outdated files... WARNING: /build/docs/index.rst:1: (SEVERE/4) Title overline & underline mismatch.

=====
Index
===

none found
pickling environment... done
checking consistency... done
preparing documents... done
writing output... [100%] index

generating indices... genindex
writing additional pages... search
copying static files... done
copying extra files... done
dumping search index in English (code: en) ... done
dumping object inventory... done
build succeeded, 1 warning.

Debug build finished. The HTML pages are in _build/debug
```

*ttd-sphinx* will warn about all references where the target cannot be found.

## Add-ons

### Themes

- [Read the Docs Sphinx Theme](https://sphinx-rtd-theme.readthedocs.io/en/stable/)
- [Press Theme](https://github.com/schettino72/sphinx_press_theme)

### Markup

- [Recommonmark](https://recommonmark.readthedocs.io/en/latest/)

This allows you to write [CommonMark](https://commonmark.org/) inside of Docutils & Sphinx projects.

### General

- [Sphinx Sitemap](https://pypi.org/project/sphinx-sitemap)

A Sphinx extension to silently generate a [sitemaps.org](https://www.sitemaps.org/protocol.html) compliant sitemap for
the HTML version of your Sphinx Documentation.
