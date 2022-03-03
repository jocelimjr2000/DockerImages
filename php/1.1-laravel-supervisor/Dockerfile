# Base image
FROM jocelimjr/php:1.1

# Apache - default public project folder
ENV APACHE_DOCUMENT_ROOT=/var/www/html/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# install dependencies
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y supervisor

RUN mkdir -p /var/log/supervisor
RUN touch /var/run/supervisor.sock
RUN chmod 777 /var/run/supervisor.sock

ADD supervisord.conf /etc/supervisor/supervisord.conf

# Load entrypoint script
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod 777 /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

WORKDIR /var/www/html

EXPOSE 22
EXPOSE 80
EXPOSE 443

CMD ["/usr/bin/supervisord"]
