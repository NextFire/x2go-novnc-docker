# x2go-novnc-docker

**x2go-novnc** lets you use a [x2goclient](https://wiki.x2go.org/doku.php/doc:usage:x2goclient) instance in your browser via [noVNC](https://github.com/novnc/noVNC). Based on the [`debian:stable-slim`](https://hub.docker.com/_/debian) image.

## Usage
Via Docker Compose:
```compose
services:
  x2go-novnc:
    image: nextfire/x2go-novnc
    ports:
      - "6080:6080"
    volumes:
      - <path to config folder>:/config
    cap_add:
      - NET_ADMIN
    restart: unless-stopped
```
The website will be available at `localhost:6080`.

In your config folder you can put a `init.sh` to setup, for example, a VPN access to your school.
