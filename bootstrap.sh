#!/bin/bash

# Replace the hostname in the container
sed -i.bak 's/HOSTNAME/'"$HOSTNAME"'/g' /usr/local/apache2/htdocs/index.html

# Startup the cmd
exec "$@"
