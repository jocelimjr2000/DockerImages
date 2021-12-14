#!/bin/sh

if [ "${PROJECT_AUTODEPLOY}" = 'yes' ]; then
    cd /var/www/html
    eval $(ssh-agent)
    chmod 400 ~/.ssh/id_rsa*
    ssh-add ~/.ssh/id_rsa
    ssh -T git@bitbucket.org
    git clone $PROJECT_GIT ./
    composer install --prefer-dist --no-interaction --optimize-autoloader --no-dev
    chown -R www-data:www-data /var/www/html
fi

if [ "${PROJECT_MIGRATE}" = 'yes' ]; then
    cd /var/www/html
    php artisan migrate
fi

if [ "${PROJECT_CMD}" ]; then
    eval "$PROJECT_CMD"
fi

docker-php-entrypoint $@