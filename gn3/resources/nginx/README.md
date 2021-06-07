# NGINX server with HTTPS support

Scripts:
 - `generate_dh_group.sh` generates the Diffie–Hellman (DH) key parameters to use in NGINX
 - `generate_self_signed_certs.sh` build the certificates to use in NGINX

Contents:
 - `conf.d` should resolve to `/etc/nginx/conf.d`
 - `snippets` should resolve to `/etc/nginx/snippets`
 - `ssl` should resolve to `/etc/ssl/`
 - `www` should resolve to `/var/www`