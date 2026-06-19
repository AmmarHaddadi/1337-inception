# User Documentation

## Services

- MariaDB stores the database.
- WordPress runs the site.
- Nginx serves it over HTTPS.

## Start and Stop

- Start: `make up`
- Stop: `make down`

(there is also make start, make stop, make clean, make fclean, and make re for more granular control)

## Access

- Website: `https://<DOMAIN_NAME>/`
- Admin panel: `https://<DOMAIN_NAME>/wp-admin/`
- Login page: `https://<DOMAIN_NAME>/wp-login.php`

## Credentials

- `secrets/maria_normal`
- `secrets/maria_root`
- `secrets/wp_user_pass`

## Example Configuration

If you want a clean starting point, copy the example files from the `example/` directory into the real project paths:

- Copy `example/src/.env.example` to `src/.env`
- Copy `example/secrets/maria_normal.example` to `secrets/maria_normal`
- Copy `example/secrets/maria_root.example` to `secrets/maria_root`
- Copy `example/secrets/wp_user_pass.example` to `secrets/wp_user_pass`

After copying them, replace the placeholder values with your own credentials and domain name before running `make up`.

## Check Running Services

- `docker compose -f srcs/docker-compose.yml ps`
- `docker compose -f srcs/docker-compose.yml logs`
