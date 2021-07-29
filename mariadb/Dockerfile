FROM mariadb:10.6.3

# install dependencies
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y --no-install-recommends \
    nano \
    iputils-ping \
    net-tools 

RUN apt-get clean autoclean -y
RUN apt-get autoremove -y
RUN rm -rf /var/lib/apt/lists/*

EXPOSE 3306
