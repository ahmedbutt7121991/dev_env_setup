#!/bin/bash

echo "Installing and Configuring Nginx yarn and nodejs"

apt-get update
apt-get install curl
apt-get install git

curl -sL https://deb.nodesource.com/setup_10.x | bash -
apt-get install -y nodejs
npm install -g yarn



apt-get install openjdk-8-jre -y


apt-get install imagemagick -y
apt-get install nginx -y

echo "Configartion file path /etc/nginx/nginx.conf"
echo "checking configuration is OK run.."
sudo nginx -t

echo "Add configurations in /etc/nginx/site-available/default"

echo "
location / {
  proxy_pass http://localhost:3000/;
}

location /assets/ {
  proxy_pass http://localhost:3000/assets/;
}

location /api/ {
  proxy_pass http://localhost:8080/api/;
}

location /img/ {
  proxy_pass http://localhost:8080/img/;
}

"