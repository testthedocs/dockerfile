
# Commands

From the **root** of your repository

## Help

``` console
docker run -it --rm -v `pwd`:/docs testthedocs/ttd-mkdocs:latest help
```

## Build

``` console
docker run -it --rm -v `pwd`:/docs testthedocs/ttd-mkdocs:latest build
```
## Serve

``` console
docker run -it --rm -p 8000:8000 -v `pwd`:/docs testthedocs/ttd-mkdocs:latest serve
```

## New

```console
docker run -it --rm -v `pwd`:/docs testthedocs/ttd-mkdocs:latest new
```
