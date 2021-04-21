#!/bin/sh

###################################################
# This script has been tested in an Ubuntu 18.04 VM
# but it should work in newer Ubuntu versions
###################################################

echo Installing docker and compose
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

apt-get install -y docker-compose 

echo Run compose and start the web server
docker-compose up -d
