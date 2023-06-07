#!/bin/bash

cp ../nginx/nginx_status.conf nginx/nginx.conf

docker restart rebbecca

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

echo -e "\nзапрос на 127.0.0.1\n"
curl 127.0.0.1

echo -e "\nзапрос на 127.0.0.1\n"
curl 127.0.0.1:80/status
echo -e "\n"

rm -rf nginx