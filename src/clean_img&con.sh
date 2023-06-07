#!/bin/bash

rm -rf 04/nginx 05/nginx 03/nginx 06/server 06/proxy
docker rm -f rebbecca
docker rmi -f rebbecca:tag

docker rm -f 06_nginx_1
docker rmi -f 06_nginx

docker rm -f 06_nginxproxy_1
docker rmi -f 06_nginxproxy