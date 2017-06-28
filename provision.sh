#!/usr/bin/env bash
apt-get -y update
apt-get -y upgrade

#cp -a /vagrant/ssh/* /home/ubuntu/.ssh/
#chown -R ubuntu:ubuntu /home/ubuntu/.ssh
#chmod 600 /home/ubuntu/.ssh/*

cat >> /etc/hosts <<EOL

192.168.59.140 web
192.168.59.141 api
192.168.59.142 mongo
192.168.59.143 ansible
EOL