#!/bin/sh

if [ "${PROJECT_ADDKEY}" = 'yes' ]; then
    eval $(ssh-agent)
    chmod 400 ~/.ssh/id_rsa*
    ssh-add ~/.ssh/id_rsa
    ssh -T git@bitbucket.org
fi

if [ "${PROJECT_AUTODEPLOY}" = 'yes' ]; then
    if [ "$(ls -A /var/www/html)" ]; then
        echo "not empty"
    else
        cd /var/www/html
        git clone $PROJECT_GIT ./
        composer install --prefer-dist --no-interaction --optimize-autoloader --no-dev
        chown -R www-data:www-data /var/www/html

        if [ "${PROJECT_MIGRATE}" = 'yes' ]; then
            cd /var/www/html
            php artisan migrate
        fi
    fi   
fi

if [ "${PROJECT_CMD}" ]; then
    eval "$PROJECT_CMD"
fi

docker-php-entrypoint $@
