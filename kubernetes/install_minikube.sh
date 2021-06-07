#!/bin/bash

cd $HOME && curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

#install kubectl pour linux
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

#make docker the default driver
minikube config set driver docker

#Start a cluster using the docker driver
minikube start --force --driver=docker

mkdir /home/vagrant/.kube
sudo chown vagrant: /home/vagrant/.kube

#recuperation de l'id du container minikube
#echo "Recuperation de l'id du container minikube:"
#IDCONT=$(docker ps | grep minikube | awk -F" " '{print $1}')

#Recuperation de la configuration  + authentification
echo "Recuperation de la configuration  + authentification:"
sudo -H -u vagrant sh -c "docker cp minikube:/etc/kubernetes/admin.conf /home/vagrant/.kube/config"

#recuperation du port exposé pour 8443
#echo "Recuperation du port exposé pour 8443:"
#PORTEXP=$(docker ps | grep minikube | grep "8443" | awk 'match($0,"8443"){print substr($0,RSTART-7,5)}')

#Modification de la config pour la connexion au container minikube
echo "Modification de la config pour la connexion au container minikube:"
CHAINE1="    server\: https\:\/\/control\-plane\.minikube\.internal\:8443"
CHAINE2="    server\: https\:\/\/127\.0\.0\.1\:49154"
CMD1=$(sudo -H -u vagrant sh -c "sed -i \"s/$CHAINE1/$CHAINE2/g\" ~/.kube/config")
echo $CMD1

