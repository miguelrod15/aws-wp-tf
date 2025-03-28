#!/bin/bash
apt update -y
apt install -y docker.io
systemctl start docker
systemctl enable docker

docker run -d \
  --name wordpress \
  -e WORDPRESS_DB_HOST=${db_host} \
  -e WORDPRESS_DB_USER=${db_username} \
  -e WORDPRESS_DB_PASSWORD=${db_password} \
  -e WORDPRESS_DB_NAME=${db_name} \
  -p 80:80 wordpress
