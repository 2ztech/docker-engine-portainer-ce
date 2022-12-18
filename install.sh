#!/bin/bash

sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

#add gpg key    
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

#setup repo
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  
  #update apt index
  sudo apt-get update
  
  #Install Docker Engine, containerd, and Docker Compose
  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
  
  #test installation
  sudo docker run hello-world
