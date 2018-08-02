[![](https://images.microbadger.com/badges/image/testthedocs/ttd-sphinx.svg)](https://microbadger.com/images/testthedocs/ttd-sphinx "Get your own image badge on microbadger.com")

[![](https://images.microbadger.com/badges/version/testthedocs/ttd-sphinx.svg)](https://microbadger.com/images/testthedocs/ttd-sphinx "Get your own version badge on microbadger.com")

# ttd-sphinx

Containerized application based on [Sphinx](http://www.sphinx-doc.org/en/stable/).

## Features

- Small Image, based on [Alpine Linux](http://www.alpinelinux.org/).
- You do not need to install [Sphinx](http://www.sphinx-doc.org/en/stable/) locally.
- Pre-configured with different add-ons.
- A new, clean and 'fresh' build with every test run.
- Uses [Tini](https://github.com/krallin/tini) as `init`.
- Uses [su-exec](https://github.com/ncopa/su-exec) for setting permissions.

## Documentation

Full documentation for end users can be found in the ["docs"](docs) folder.

## Dependencies

- [Docker](https://docker.com "Homepage of docker")

## Installation

Pull the image:

```console
docker pull testthedocs/ttd-sphinx
```

## Contribute

- [Issue Tracker](github.com/testthedocs/ttd-sphinx/issues)
- [Source Code](github.com/testthedocs/ttd-sphinx)

## Support

If you are having issues, please let us know.

## License

The project is licensed under the GPLv2.
