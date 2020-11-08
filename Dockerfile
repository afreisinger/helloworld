############################################################
# Dockerfile to build apache Installed Containers
############################################################

# Set the base image
FROM httpd:2.4

# File Author / Maintainer
MAINTAINER Adrián Freisinger

# Add a sample index file
COPY ./public-html/ /usr/local/apache2/htdocs/

# Add a dir
RUN mkdir -p /usr/src/app/

# Create a runner script for the entrypoint
COPY bootstrap.sh /usr/src/app/bootstrap.sh
RUN chmod +x /usr/src/app/bootstrap.sh

# Expose ports
EXPOSE 80

ENTRYPOINT ["bash", "/usr/src/app/bootstrap.sh"]

CMD httpd -D FOREGROUND