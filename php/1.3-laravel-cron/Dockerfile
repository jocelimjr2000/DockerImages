# Base image
FROM jocelimjr/php:1.3-laravel

# Install dependencies
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y --no-install-recommends cron
RUN apt-get clean autoclean && apt-get autoremove --yes && rm -rf /var/lib/{apt,dpkg,cache,log}/ 

# Load entrypoint script
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod 777 /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

RUN (crontab -l 2>/dev/null; echo "* * * * * /usr/local/bin/php /var/www/html/artisan schedule:run >> /var/www/html/storage/logs/crontab.log 2>&1") | crontab -
RUN printenv | grep -v "no_proxy" >> /etc/environment
RUN service cron start
