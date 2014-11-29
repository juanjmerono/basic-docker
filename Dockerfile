#
# Build Basic Image
#
FROM       node:0.10.33

MAINTAINER juanjmerono <yoan.yo@gmail.com>

# Installation:
# Import MongoDB public GPG key AND create a MongoDB list file
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/debian-sysvinit dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list

# Update apt-get sources AND install MongoDB
RUN apt-get update && apt-get install -y mongodb-org=2.6.1 mongodb-org-server=2.6.1 mongodb-org-shell=2.6.1 mongodb-org-mongos=2.6.1 mongodb-org-tools=2.6.1

# Create the MongoDB data directory
RUN mkdir -p /data/db

# Install MEAN
RUN npm install -g mean-cli

# Install Grunt
RUN npm install -g grunt-cli

# Install Bower
RUN npm install -g bower

# Download and install basic source
RUN git clone https://github.com/juanjmerono/basic /opt/basic
RUN cd /opt/basic;npm install;bower install --allow-root --config.interactive=false

# Expose http/websocket ports from the container to the host
EXPOSE 3000 3001

# Work directory
WORKDIR /opt/basic

# Run
CMD mongod & grunt
