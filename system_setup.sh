#!/bin/bash
mkdir /usr/local/custom

### Run this script as root 
### Set time zone
timedatectl set-timezone America/Montreal

### update and ugrade system to latest version
apt-get update -y
apt-get dist-upgrade -y

### Install and configure netdata monitoring
#apt-get install netdata -y
#systemctl start netdata
#systemctl enable netdata
#sed -i 's/127.0.0.1/0.0.0.0/g' /etc/netdata/netdata.conf
#systemctl restart netdata

### System utilities
apt install tree ranger qemu-guest-agent neofetch git curl tmux -y
apt install figlet toilet zip unzip p7zip p7zip-plugins vim snmpd snmp libsnmp-dev htop rsync -y

### Network utilities
#apt-get install iftop network-manager net-tools openvpn -y
#systemctl start NetworkManager.service
#systemctl stop NetworkManager.service

### Install daily cron job to update system
#touch /etc/cron.daily/auto-update
#echo '#!/bin/bash' >> /etc/cron.daily/auto-update
#echo 'apt-get update -y' >> /etc/cron.daily/auto-update
#echo 'apt-get dist-upgrade -y' >> /etc/cron.daily/auto-update
#chmod +x /etc/cron.daily/auto-update

### Install security tools
#apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 013baa07180c50a7101097ef9de922f1c2fde6c4
#wget -O - https://packages.cisofy.com/keys/cisofy-software-public.key |  apt-key add -
#apt install apt-transport-https
#echo 'Acquire::Languages "none";' | tee /etc/apt/apt.conf.d/99disable-translations
#echo "deb https://packages.cisofy.com/community/lynis/deb/ stable main" | tee /etc/apt/sources.list.d/cisofy-lynis.list

#apt install chkrootkit rkhunter auditd lynis -y
#curl https://omnitruck.chef.io/install.sh |  bash -s -- -P inspec
#lynis audit system >> /root/lynis_system_audit.txt
#chkrootkit >> /root/hkrootkit_scan.txt
#qrkhunter -c >> /root/rkhunter_scan.txt

### SSH
#mkdir ~/.ssh
#ssh-keygen -t 
#mv domain.key domain.key.pub ~/.ssh
#touch ~/.ssh/authorized_keys

### Change ssh configuration

### ....





### Add zsh aliases

