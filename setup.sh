#!/usr/bin/env bash

apt-get update
apt-get upgrade

apt-get install fail2ban
apt-get install sudo
apt-get install vim
apt-get install wget
apt-get install ufw
apt-get install logwatch
apt-get install docker

useradd max -g sudo -s /bin/bash -m

mkdir /home/max/.ssh

chmod 700 /home/max/.ssh

echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDAIXPBY4dLx9Zpi69jfsSlNPZc1tqMYbj2E8G+UthlarEWddaJkdlyXgonsXf2fRJMLoxpp4Ei6JUGPle6kEn7NH3cLkEBPJ0QoMCKtrysTlOGzZcjo2nmTsug/BXgb2MeYbjB4kz+pcZ1VCGVnsnnXdgV6aHnA1nK3fMseaOk/Jr+VOLlBOKJPcYqnEba2OEVMChw5AWN4akm+1octNAZL4RD+C5t3QVYJCbhSKmAqtQIxK5GS/cVYoQHxITQeE3GSeW93Q2lan7a4DzlKGVhZkfVfGtStQ7t8C72VbbZ4buujVE3QZgXMvbTgq1RiKIobqPcCDr3JUblKoaHb4ZN max@max-laptop" > /home/max/.ssh/authorized_keys
# replace with download to github repo :D
chmod 400 /home/deploy/.ssh/authorized_keys
chown max:max /home/max -R

# wget SSHD_CONFIG
cat sshd_config >> /etc/ssh/sshd_config

systemctl restart ssh

ufw allow 22
ufw enable

# wget 00logwatch
cat 00logwatch >> /etc/cron.daily/00logwatch


# TODO:
# su - max
# passwd
