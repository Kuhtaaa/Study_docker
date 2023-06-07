#!/bin/bash

mkdir nginx
cp ../nginx/nginx.conf nginx/nginx.conf
cp ../server/main.c main.c
cp ../server/40-fast-fcgi.sh 40-fast-fcgi.sh

docker build -t rebbecca:tag .

rm main.c 40-fast-fcgi.sh

# adress=`pwd`
# echo $adress

docker run --name rebbecca -d -p 80:81 -v "`pwd`/nginx":/etc/nginx rebbecca:tag
# docker run --name rebbecca -d -p 80:81 -v "$adress/nginx":/etc/nginx rebbecca:tag


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