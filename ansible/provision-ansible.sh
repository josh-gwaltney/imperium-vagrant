#!/usr/bin/env bash

apt-add-repository -y ppa:ansible/ansible
apt-get update
apt-get -y install ansible

ssh-keyscan web api mongodb >> /home/vagrant/.ssh/known_hosts
chown -R vagrant:vagrant /home/vagrant/.ssh/known_hosts

ansible-playbook /home/vagrant/ansible/git.playbook.yml
ansible-playbook /home/vagrant/ansible/go.playbook.yml
ansible-playbook /home/vagrant/ansible/web.playbook.yml