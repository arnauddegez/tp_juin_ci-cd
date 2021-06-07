#!/bin/bash

#Installation des packages sous forme de fonction avec vérification si le package est installé
install_package() {
    PACKAGE="$1"
    if ! dpkg -l |grep --quiet "^ii.$PACKAGE"; then
        apt install -y "$PACKAGE"
    fi
}

install_package "ansible"
install_package "sshpass"


#creation du repertoire ansible + recuperation du playbook
sudo mkdir /home/vagrant/ansible
cd /home/vagrant/ansible && wget -O host https://github.com/arnauddegez/tp_juin_ci-cd/raw/main/ansible/host
cd /home/vagrant/ansible && wget -O playbook https://github.com/arnauddegez/tp_juin_ci-cd/raw/main/ansible/playbook.yml