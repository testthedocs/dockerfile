# ttd-ansible-lint

Containerized [ansible-lint](https://github.com/willthames/ansible-lint) based on
Alpine Linux.

## Features

- Small Image, based on [Alpine Linux](http://www.alpinelinux.org/).
- Uses [Tini](https://github.com/krallin/tini) as `init`.

## Dependencies

- [Docker](https://docker.com "Homepage of docker")

## Installation

Pull the image:

```shell
docker pull testthedocs/ttd-ansible-lint
```

### Usage

In this example a yaml file, called ``main.yml`` is checked.

``` bash
docker run --rm -ti -v `pwd`:/build ttd-ansible-lint main.yml
```

## Contribute

- [Issue Tracker](github.com/testthedocs/ttd-ansible-lint/issues)
- [Source Code](github.com/testthedocs/ttd-ansible-lint)

## Support

If you are having issues, please let us know.

## License

The project is licensed under the GPLv2.
