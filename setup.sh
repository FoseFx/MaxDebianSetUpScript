#!/usr/bin/env bash
apt-get update
apt-get upgrade
apt-get dist-upgrade

apt-get install -y fail2ban
apt-get install -y sudo
apt-get install -y vim
apt-get install -y ufw
apt-get install -y logwatch
apt-get install -y git
apt-get install -y curl
apt-get install -y ca-certificates
update-ca-certificates
apt-get install nginx

useradd max -g sudo -s /bin/bash -m

mkdir /home/max/.ssh

chmod 700 /home/max/.ssh

curl  -O -L https://raw.githubusercontent.com/FoseFx/MaxDebianSetUpScript/master/authorized_keys
cat authorized_keys >> /home/max/.ssh/authorized_keys

chmod 400 /home/deploy/.ssh/authorized_keys
chown max /home/max -R

curl -O -L https://raw.githubusercontent.com/FoseFx/MaxDebianSetUpScript/master/sshd_config
cat sshd_config >> /etc/ssh/sshd_config

systemctl restart ssh

ufw allow 22
ufw enable

curl -O -L https://raw.githubusercontent.com/FoseFx/MaxDebianSetUpScript/master/00logwatch
cat 00logwatch >> /etc/cron.daily/00logwatch

rm authorized_keys
rm 00logwatch
rm sshd_config

# curl -sSL https://get.docker.com/ | sh
curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh
chmod +x nodesource_setup.sh
bash nodesource_setup.sh
apt-get install nodejs
apt-get update && apt-get upgrade

# TODO:
# passwd
# su - max
# passwd
