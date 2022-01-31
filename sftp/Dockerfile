FROM atmoz/sftp:latest

# Update Apt and then install Nano editor (RUN can be removed)
RUN apt-get update && apt-get install -y --no-install-recommends \
    nano \
    iputils-ping \
    apache2 \ 
    openssl

RUN apt-get autoremove -y
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

# Copy configurations
COPY init.sh /etc/sftp.d/

# Change execute permission
RUN chmod +x /etc/sftp.d/*

##### Apache2

# Active mod_rewrite, mod_headers and ssl (.htaccess and extra headers)
RUN a2enmod rewrite headers ssl

# Server name
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Hide information
RUN echo "ServerTokens Prod" >> /etc/apache2/apache2.conf
RUN echo "ServerSignature Off" >> /etc/apache2/apache2.conf

# Add Configuration
ADD 000-default.conf /etc/apache2/sites-enabled/000-default.conf

# Create selfsigned certificate
RUN openssl req -x509 -nodes -days 36500 \
    -subj  "/C=BR/ST=PR/O=myorg/CN=localhost" \
    -newkey rsa:2048 \
    -keyout /etc/ssl/private/myprivkey.key \
    -out /etc/ssl/certs/mycert.crt;

RUN echo "StrictHostKeyChecking=no" >> /etc/ssh/ssh_config
RUN mkdir ~/.ssh

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2

RUN mkdir -p $APACHE_RUN_DIR $APACHE_LOCK_DIR $APACHE_LOG_DIR

EXPOSE 80 443 22
