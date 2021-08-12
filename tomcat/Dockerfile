FROM tomcat:8.5.20

# Update Apt and then install Nano editor (RUN can be removed)
RUN apt-get update && apt-get install -y \
    nano \
    iputils-ping \
    git \
    net-tools \
&& mkdir -p /usr/local/tomcat/conf

# Copy configurations (Tomcat users, Manager app)
COPY tomcat-users.xml /usr/local/tomcat/conf/
COPY context.xml /usr/local/tomcat/webapps/manager/META-INF/
