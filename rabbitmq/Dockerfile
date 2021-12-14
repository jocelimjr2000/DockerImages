# Base image
FROM rabbitmq:3.9.0-management

# Install dependencies (ping, net-tools)
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y --no-install-recommends \
    nano \
    iputils-ping \
    net-tools \
    curl

RUN apt-get clean autoclean -y
RUN apt-get autoremove -y
RUN rm -rf /var/lib/apt/lists/*

# Load entrypoint script
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod 777 /docker-entrypoint.sh

EXPOSE 5672 15672

CMD [ "/docker-entrypoint.sh" ]