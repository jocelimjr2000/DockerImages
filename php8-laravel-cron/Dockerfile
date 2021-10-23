# Base image
FROM jocelimjr/php8-laravel:1.0

# Install dependencies
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y --no-install-recommends cron
RUN apt-get clean autoclean && apt-get autoremove --yes && rm -rf /var/lib/{apt,dpkg,cache,log}/ 

COPY crontab /etc/crontab