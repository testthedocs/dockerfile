[![Codacy Badge](https://api.codacy.com/project/badge/Grade/96405c4eeb64419d981fc37027a816b0)](https://www.codacy.com/app/svx/ttd-ansible-lint?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=testthedocs/ttd-ansible-lint&amp;utm_campaign=Badge_Grade)

# ttd-ansible-lint

Containerized [ansible-lint](https://github.com/willthames/ansible-lint)
based on Alpine Linux.

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

In this example a `yaml` file, called `main.yml` is checked.

```shell
docker run --rm -ti -v `pwd`:/build ttd-ansible-lint main.yml
```

## Contribute

- [Issue Tracker](github.com/testthedocs/ttd-ansible-lint/issues)
- [Source Code](github.com/testthedocs/ttd-ansible-lint)

## Support

If you are having issues, please let us know.

## License

The project is licensed under the GPLv2.
