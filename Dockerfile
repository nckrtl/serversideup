FROM serversideup/php:8.3-fpm-nginx
USER www-data
COPY --chown=www-data:www-data . .
WORKDIR /var/www/html
RUN composer install

# uncomment the following lines if you want to use s6-overlay, you'll see it wont trigger the trap upon stopping the container
# ENV S6_CMD_WAIT_FOR_SERVICES=1
# COPY --chmod=755 ./entrypoint.d/ /etc/entrypoint.d/
# USER root
# RUN docker-php-serversideup-s6-init
# USER www-data
