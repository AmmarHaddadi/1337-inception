# Developer Documentation

all containers run on alpine linux 3.23.4
dockerfiles can be found in `src/` with a directory for each service. The `src/docker-compose.yml` file defines the services and their configurations.

read the [USER_DOC.md](USER_DOC.md) first.

## Setup

- Prerequisites: Docker, Docker Compose, and Make.
- Configuration: `src/docker-compose.yml`, `src/.env`, and files in `secrets/`.

## Build and Launch

- Build and start: `make up`
- Foreground run: `make up-watch`
- Raw Compose: `docker compose -f src/docker-compose.yml up --build`

## Manage Containers

- Start: `make start`
- Stop: `make stop`
- Down: `make down`
- Clean: `make clean`
- Full reset: `make fclean`
- Recreate: `make re`

## Persistent Data

- MariaDB data: `data/maria/`
- WordPress data: `data/wordpress/`
- The Makefile creates these host directories and Compose binds them into the containers.

to change volume destinations, edit the `src/docker-compose.yml` file and update the `volumes:` section for each service + change DATA_DIR in the Makefile.
