Lighthouse role
=========

Install lighthouse in your hosts

- `Install dependencies` installs dependencies for `lighthouse` to work, such as: `git`, to download `lighthouse` and `nginx` repositories, `lighthouse` itself requires a web server
- `Install lighthouse` clones the `lighthouse` repository into the `/var/www/lighthouse` directory
- `Delete default nginx vhost` removes default virtual host from `nginx` configs
- `Delete default nginx vhost symlink` removes a symbolic link to the default config `nginx`
- `Copy nginx conf` copies config from `nginx.tpl` template
- `Create symlink nginx vhost` creates a symbolic link to the site config with `lighthouse`, after which `nginx` is restarted


Requirements
------------

tested only on ubuntu 20.04


Example Playbook
----------------

    - hosts: servers
      roles:
         - lighthouse-role

