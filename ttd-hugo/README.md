# TTD-Hugo

[Alpine](https://alpinelinux.org/) based container for [Hugo](http://gohugo.io/).

## Features

- Small Image, based on [Alpine Linux](http://www.alpinelinux.org/).
- Uses [Tini](https://github.com/krallin/tini) as `init`.
- Uses [su-exec](https://github.com/ncopa/su-exec) for setting permissions
- Uses `hugo extended`

## Dependencies

- [Docker](https://docker.com "Homepage of docker")

## Installation

Pull the image:

```
docker pull testthedocs/ttd-hugo
```

## Usage

Create a new site:

```bash
docker run --rm -v `pwd`:/src testthedocs/ttd-hugo new site ttd.blog
```

This will create a new directory with the following structure
```bash
drwxr-xr-x  8 svx svx 4096 Dec 24 12:12 .
drwxr-xr-x 44 svx svx 4096 Dec 24 12:12 ..
drwxr-xr-x  2 svx svx 4096 Dec 24 12:12 archetypes
-rw-r--r--  1 svx svx   82 Dec 24 12:12 config.toml
drwxr-xr-x  2 svx svx 4096 Dec 24 12:12 content
drwxr-xr-x  2 svx svx 4096 Dec 24 12:12 data
drwxr-xr-x  2 svx svx 4096 Dec 24 12:12 layouts
drwxr-xr-x  2 svx svx 4096 Dec 24 12:12 static
drwxr-xr-x  2 svx svx 4096 Dec 24 12:12 themes
```

## Contribute

- [Issue Tracker](github.com/testthedocs/ttd-hugo/issues)
- [Source Code](github.com/testthedocs/ttd-hugo)

## Support

If you are having issues, please let us know.

## License

The project is licensed under MIT License.
