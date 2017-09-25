# ttd-yamllint

Containerized [yamllint](https://github.com/adrienverge/yamllint) based on
Alpine Linux.


## Features

- Small Image, based on [Alpine Linux](http://www.alpinelinux.org/).
- Uses [Tini](https://github.com/krallin/tini) as `init`.
- Uses [su-exec](https://github.com/ncopa/su-exec) for setting permissions.

## Dependencies

- [Docker](https://docker.com "Homepage of docker")

## Installation

Pull the image:

``` bash
docker pull testthedocs/ttd-yamllint
```

### Usage

In this example a yaml file, called ``main.yml`` is checked.

``` bash
docker run  --rm -ti -v `pwd`:/build testthedocs/ttd-yamllint main.yml
```

## Contribute

- [Issue Tracker](github.com/testthedocs/ttd-yamllint/issues)
- [Source Code](github.com/testthedocs/ttd-yamllint)

## Support

If you are having issues, please let us know.

## License

The project is licensed under the GPLv2.
