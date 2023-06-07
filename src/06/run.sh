#!/bin/bash

mkdir server proxy
mkdir server/nginx proxy/nginx

cp ../nginx/nginx.conf server/nginx/nginx.conf 
cp ../nginx/nginx.conf proxy/nginx/nginx.conf
cp ../server/main.c server/main.c
cp ../server/40-fast-fcgi.sh server/40-fast-fcgi.sh

sed -i '' 's/listen 81 default_server;/listen 8080 default_server;/g' proxy/nginx/nginx.conf
sed -i '' 's/fastcgi_pass localhost:8080;/proxy_pass http:\/\/nginx:81\/;/g' proxy/nginx/nginx.conf

cp Dockerfile_server server/Dockerfile
cp Dockerfile_proxy proxy/Dockerfile

docker-compose build
docker-compose up
