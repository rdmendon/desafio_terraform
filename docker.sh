#!/bin/bash
echo "oi"
sudo yum update
sudo yum install -y docker
sudo yum install git -y
sudo usermod -a -G docker ec2-user
sudo service docker start
sudo chkconfig docker on

git clone https://github.com/dockersamples/docker-pets.git
cd docker-pets/web
docker build -t docker-pets .
docker run -it -p 5000:5000 docker-pets