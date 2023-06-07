#!/bin/bash

mkdir nginx
cp ../nginx/nginx_status.conf nginx/nginx.conf
cp ../server/main.c main.c
cp ../server/40-fast-fcgi.sh 40-fast-fcgi.sh

docker build -t rebbecca:tag .

rm main.c 40-fast-fcgi.sh

docker run --name rebbecca -d -p 80:81 -v "`pwd`/nginx":/etc/nginx rebbecca:tag

echo -e "\nЖдем запуска контейнера\n"

i=1
sp="/-\|"
echo -n ' '
printf "\bPlease wait -  "
for((a=0; a < 101; a++))
do
    printf "\b${sp:i++%${#sp}:1}"
    sleep 0.05
done
echo -e "\n"

echo -e "Проверка Dockle\n"
Dockle -ak NGINX_GPGKEY rebbecca:tag
echo -e "\n"
