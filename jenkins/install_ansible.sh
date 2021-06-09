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
cd /home/vagrant/ansible && wget -O hosts https://github.com/arnauddegez/tp_juin_ci-cd/raw/main/ansible/hosts
cd /home/vagrant/ansible && wget -O playbook.yml https://github.com/arnauddegez/tp_juin_ci-cd/raw/main/ansible/playbook.yml
cd /home/vagrant/ansible && wget -O maj_k8sfile.yml https://github.com/arnauddegez/tp_juin_ci-cd/raw/main/ansible/maj_k8sfile.yml
cd /home/vagrant/ansible && wget -O maj_svck8sfile.yml https://github.com/arnauddegez/tp_juin_ci-cd/raw/main/ansible/maj_svck8sfile.yml

#pour le fonctionnement de sshpass avec ansible
sudo sed -i 's/#host_key_checking = False/host_key_checking = False/g' /etc/ansible/ansible.cfg

