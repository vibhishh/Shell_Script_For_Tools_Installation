#!bin/bash
sudo apt-get update
sudo apt-get install docker.io -y
newgrp docker
sudo usermod -aG docker $USER
sudo chmod 777 /var/run/docker.sock
#sudo usermod -aG docker jenkins
#sudo usermod -aG docker $USER
#sudo rebooot
