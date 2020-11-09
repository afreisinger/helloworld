# Helloworld repository for afreisinger
All afreisinger Helloworld. Docker Images/NPM Packages can be viewed under "packages" tab

## Commands Used
### Create docker images using `build`
- `docker build . -t helloworld`

### Authenticating with a personal access token
- `echo $PAT | docker login https://docker.pkg.github.com -u USERNAME --password-stdin`

### Tag the images to the package registry path
- `docker tag helloworld docker.pkg.github.com/afreisinger/helloworld/helloworld:latest`

### Push the images to the Github package registry
- `docker push docker.pkg.github.com/afreisinger/helloworld/helloworld:latest`


### Pull the images from the Github package registry
- `docker pull docker.pkg.github.com/afreisinger/helloworld/helloworld:latest`


### Run the docker image on the engine
- `docker run helloworld -p 80:80`


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
