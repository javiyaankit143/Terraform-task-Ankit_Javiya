#!/bin/bash
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key -y fingerprint 0EBFCD88
sudo add-apt-repository -y \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install -y docker-ce
# Linux post-install
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable docker
# Pull and run the Nginx Docker container
#sudo docker pull nginxdemos/hello
sudo docker run -d -p 80:80 --name nginx-container nginxdemos/hello

echo "<h1>Deployed via Terraform</h1>" 
