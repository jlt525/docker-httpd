#!/bin/sh
echo "starting server"
docker run \
--volume=$(pwd)/root/opt/repos:/opt/repos \
--volume=$(pwd)/root/opt/web:/opt/web \
--volume=$(pwd)/root/var/log/httpd:/var/log/httpd \
--volume=$(pwd)/root/var/www/html:/var/www/html \
--publish 8080:8080 \
--name httpd-test \
--tty --interactive \
local/centos7-httpd24

#echo "server exited"
#sleep 5

#echo "removing container"
#docker rm httpd-test
