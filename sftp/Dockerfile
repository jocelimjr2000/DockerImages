FROM atmoz/sftp:latest

# Update Apt and then install Nano editor (RUN can be removed)
RUN apt-get update && apt-get install -y --no-install-recommends \
    nano \
    iputils-ping

RUN apt-get autoremove -y
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

# Copy configurations
COPY init.sh /etc/sftp.d/

# Change execute permission
RUN chmod +x /etc/sftp.d/*