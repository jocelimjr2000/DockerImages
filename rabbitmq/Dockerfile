# Base image
FROM rabbitmq:3.9.0-management

# Install dependencies (ping, net-tools)
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y --no-install-recommends \
    iputils-ping \
    net-tools

RUN apt-get clean autoclean -y
RUN apt-get autoremove -y
RUN rm -rf /var/lib/apt/lists/*
