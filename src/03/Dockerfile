FROM nginx
LABEL maintainer="rebbecca@student.21school.ru"

COPY ./main.c /home/main.c
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./40-fast-fcgi.sh /docker-entrypoint.d/40-fast-fcgi.sh

RUN apt update -y && \
    apt upgrade -y && \
    apt install -y \
	libfcgi-dev \
	gcc \
	spawn-fcgi && \
    gcc -I/usr/local/include /home/main.c -lfcgi -o /home/main.fcgi 

EXPOSE 81