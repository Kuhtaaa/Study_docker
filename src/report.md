## Part 1. Готовый докер

Взять официальный докер образ с **nginx** и выкачать его при помощи `docker pull`

![part1](image/01/1.1.png)

##### Проверить наличие докер образа через `docker images`

![part1](image/01/1.2.png)

##### Запустить докер образ через `docker run -d [image_id|repository]`

![part1](image/01/1.3.png)

##### Проверить, что образ запустился через `docker ps`

![part1](image/01/1.4.png)

##### Посмотреть информацию о контейнере через `docker inspect [container_id|container_name]`

- Размер контейнера:
![part1](image/01/1.5.1.png)
 141532686 байт (142 MB)

- Список замапленных портов: 
![part1](image/01/1.5.3.png)
80 в null

- ip контейнера: 
![part1](image/01/1.5.2.png)
172.17.0.2

##### Остановить докер образ через `docker stop [container_id|container_name]`

![part1](image/01/1.6.png)

##### Проверить, что образ остановился через `docker ps`

![part1](image/01/1.7.png)

##### Запустить докер с замапленными портами 80 и 443 на локальную машину через команду *run*

![part1](image/01/1.8.png)

##### Проверить, что в браузере по адресу *localhost:80* доступна стартовая страница **nginx**

![part1](image/01/1.10.png)

![part1](image/01/1.10.1.png)

##### Перезапустить докер контейнер через `docker restart [container_id|container_name]`

![part1](image/01/1.11.png)

##### Проверить любым способом, что контейнер запустился

## Part 2. Операции с контейнером

##### Прочитать конфигурационный файл *nginx.conf* внутри докер контейнера через команду *exec*

docker exec -i -t a2106236f685 /bin/sh
cat /etc/nginx/nginx.conf 

![part2](image/02/2.1.png)

##### Создать на локальной машине файл *nginx.conf*

создаем файл *nginx.conf*

![part2](image/02/2.3.1.png)

##### Настроить в нем по пути */status* отдачу страницы статуса сервера **nginx**

![part2](image/02/2.3.2.png)

##### Скопировать созданный файл *nginx.conf* внутрь докер образа через команду `docker cp`
######CONTAINER ID = a2106236f685

docker cp nginx.conf a2106236f685:/etc/nginx/nginx.conf

##### Перезапустить **nginx** внутри докер образа через команду *exec*
######CONTAINER ID = a2106236f685

docker exec -i -t a2106236f685 nginx -s reload

![part2](image/02/2.4.png)

##### Проверить, что по адресу *localhost:80/status* отдается страничка со статусом сервера **nginx**

![part2](image/02/2.5.png)

##### Экспортировать контейнер в файл *container.tar* через команду *export*

######CONTAINER ID = a2106236f685
команда docker export a2106236f685 > container.tar 

![part2](image/02/2.6.png)

##### Остановить контейнер

![part2](image/02/2.7.png)

##### Удалить образ через `docker rmi [image_id|repository]`, не удаляя перед этим контейнеры
##### Удалить остановленный контейнер

![part2](image/02/2.8.png)

##### Импортировать контейнер обратно через команду *import*

команда: docker import container.tar rebbecca

![part2](image/02/2.9.png)

##### Запустить импортированный контейнер

команда: docker run -d -p 80:80 -p 443:443 rebbecca /docker-entrypoint.sh nginx -g "daemon off;"

![part2](image/02/2.10.png)

##### Проверить, что по адресу *localhost:80/status* отдается страничка со статусом сервера **nginx**

![part2](image/02/2.11.png)
