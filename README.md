# Container Images Repository for afreisinger
All afreisinger DockerImages/NPM Packages/Maven artifacts can be viewed under "packages" tab

## Commands Used
### Create docker images using `build`
- `docker build . -t helloworld`

### Tag the images to the package registry path
- `docker tag helloworld docker.pkg.github.com/afreisinger/helloworld/helloworld:latest`

### Run the docker image on the engine
- `docker run helloworld -p 80:80`

### Push the images to the Github package registry
- `docker push docker.pkg.github.com/afreisinger/helloworld/helloworld:latest`

### Dockerfile
```
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
```

### Other commands
- `docker images`
- `docker ps -a`
