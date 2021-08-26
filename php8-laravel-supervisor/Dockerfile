
FROM jocelimjr/php8-laravel:1.0

# install dependencies
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y supervisor

RUN mkdir -p /var/log/supervisor
RUN touch /var/run/supervisor.sock
RUN chmod 777 /var/run/supervisor.sock

ADD supervisord.conf /etc/supervisor/supervisord.conf

EXPOSE 22 80

CMD ["/usr/bin/supervisord"]
