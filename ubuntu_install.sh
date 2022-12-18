#!/bin/bash

sudo apt-get update
sudo apt-get install ca-certificates curl gnupg lsb-release -y

#add gpg key    
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

#setup repo
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  
  #update apt index
  sudo apt-get update
  
  #Install Docker Engine, containerd, and Docker Compose
  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
  
  #portainer volume create
  docker volume create portainer_data
  
  #portainer ce install
  docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
  
  #test installation
  sudo docker run hello-world
  
  echo "Installation is done. You can access your Portainer by https://ipaddress:9443"