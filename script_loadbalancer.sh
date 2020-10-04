#!/bin/bash
apt-get -y update 
apt-get install git -y
apt install -y software-properties-common 
apt-add-repository --yes --update ppa:ansible/ansible
apt install ansible -y
apt-get install nano wget curl -y
apt-get update -y && apt-get upgrade -y
git clone https://github.com/NaidaDV/nginx_final_task_ansible_role.git /etc/ansible/roles
mkdir /etc/ansible/roles/nginx_config/vars
cp /tmp/vars.yml /etc/ansible/roles/nginx_config/vars/main.yml
ansible-playbook --connection=local --inventory 127.0.0.1, /etc/ansible/roles/playbook.yml
