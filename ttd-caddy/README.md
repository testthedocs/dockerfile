# ttd-caddy
Caddy Webserver In A Container

This container used different stages.

## Stage One

- Building caddy straight from GitHub (Open Source Version)

## Stage Two

- Building the base container using the caddy binary which got build in Stage One

### Notes

#### Changing The Default Port

If you need to change the default port (2015), you can do that by adjusting *Stage Two* of the Dockerfile

```
# Stage Two
...
...
EXPOSE 80 443 2016
...
...
CMD ["-port", "2016", "--conf", "/etc/Caddyfile"]
```

This examples changes the default port (2015) to **2016**.

- Expose port 2016
- Adjust CMD and add the ``port flag`` and ``port number``

Start container on new port:
```bash
docker run -d -p 2016:2016 testthedocs/ttd-caddy:latest
```
