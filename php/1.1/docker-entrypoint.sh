#!/bin/sh

if [ "${PROJECT_ADDKEY}" = 'yes' ]; then
    eval $(ssh-agent)
    chmod 400 ~/.ssh/id_rsa*
    ssh-add ~/.ssh/id_rsa
    ssh -T git@bitbucket.org
fi

if [ "${PROJECT_CMD}" ]; then
    eval "$PROJECT_CMD"
fi

docker-php-entrypoint $@
