#!/bin/bash
sudo yum install epel-release -y
sudo yum install socat -y
sudo yum install epel-release -y
wget https://packages.erlang-solutions.com/erlang-solutions-1.0-1.noarch.rpm
sudo rpm -Uvh erlang-solutions-1.0-1.noarch.rpm
sudo yum install erlang -y
sudo yum update -y
sudo yum install wget -y
cd /tmp/
wget https://github.com/rabbitmq/rabbitmq-server/releases/download/v3.8.27/rabbitmq-server-3.8.27-1.el7.noarch.rpm
rpm --import https://github.com/rabbitmq/signing-keys/releases/download/2.0/rabbitmq-release-signing-key.asc
rpm -Uvh /tmp/rabbitmq-server-3.8.27-1.el7.noarch.rpm
sudo systemctl start rabbitmq-server
sudo systemctl enable rabbitmq-server
sudo systemctl status rabbitmq-server
sudo sh -c 'echo "[{rabbit, [{loopback_users, []}]}]." > /etc/rabbitmq/rabbitmq.config'
sudo rabbitmqctl add_user test test
sudo rabbitmqctl set_user_tags test administrator
sudo systemctl restart rabbitmq-server


###https://github.com/rabbitmq
###https://tecadmin.net/install-erlang-on-centos/
