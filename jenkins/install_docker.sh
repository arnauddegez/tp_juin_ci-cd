#!/bin/bash

#Install docker
sudo apt-get update
sudo apt-get -y install apt-transport-https ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian buster stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker vagrant
sudo usermod -aG docker jenkins

#mise en place du mot de passe pour vagrant

echo 'vagrant:vagrant' | sudo chpasswd



#Preparation pour l'echange de clé ssh et restart du service pour prise en compte essai la 1ere sinon la 2eme

sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config

sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/g' /etc/ssh/sshd_config

sudo service sshd restart

echo "${GREEN}$(date +'%Y-%m-%d %H:%M:%S') [ INFO  ] : Mot de passe jenkins ... ${NC}"
cat /var/lib/jenkins/secrets/initialAdminPassword | xargs echo
