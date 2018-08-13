#!/usr/bin/env bash

apt-get update
apt-get upgrade

apt-get install fail2ban
apt-get install sudo
apt-get install vim
apt-get install ufw
apt-get install logwatch
apt-get install git
apt-get install docker


useradd max -g sudo -s /bin/bash -m

mkdir /home/max/.ssh

chmod 700 /home/max/.ssh

curl -H 'Authorization: token $1' -O -L 'Accept: application/vnd.github.v3.raw' https://raw.githubusercontent.com/FoseFx/MaxDebianSetUpScript/master/authorized_keys
cat authorized_keys >> /home/max/.ssh/authorized_keys

# replace with download to github repo :D
chmod 400 /home/deploy/.ssh/authorized_keys
chown max:max /home/max -R

curl -H 'Authorization: token $1' -O -L 'Accept: application/vnd.github.v3.raw' https://raw.githubusercontent.com/FoseFx/MaxDebianSetUpScript/master/sshd_config
cat sshd_config >> /etc/ssh/sshd_config

systemctl restart ssh

ufw allow 22
ufw enable

curl -H 'Authorization: token $1' -O -L 'Accept: application/vnd.github.v3.raw' https://raw.githubusercontent.com/FoseFx/MaxDebianSetUpScript/master/00logwatch
cat 00logwatch >> /etc/cron.daily/00logwatch


# TODO:
# su - max
# passwd
