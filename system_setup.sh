#!/bin/bash
### Run this script as root 

### Set time zone
timedatectl set-timezone America/Montreal

### update and ugrade system to latest version
apt-get update -y
apt-get dist-upgrade -y

### Install and configure netdata monitoring
apt-get install netdata -y
systemctl start netdata
systemctl enable netdata
sed -i 's/127.0.0.1/0.0.0.0/g' /etc/netdata/netdata.conf
systemctl restart netdata

### System utilities
apt install tree ranger neofetch git curl tmux sysstat iotop zip unzip p7zip vim htop rsync -y
apt install apt-listbugs libpam-tmpdir needrestart debsecan fail2ban debsums -y


### Network utilities
apt-get install iftop net-tools openvpn -y


### Install daily cron job to update system
touch /etc/cron.daily/auto-update
echo '#!/bin/bash' >> /etc/cron.daily/auto-update
echo 'apt-get update -y' >> /etc/cron.daily/auto-update
echo 'apt-get dist-upgrade -y' >> /etc/cron.daily/auto-update
chmod +x /etc/cron.daily/auto-update

### Install security tools
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 013baa07180c50a7101097ef9de922f1c2fde6c4
wget -O - https://packages.cisofy.com/keys/cisofy-software-public.key |  apt-key add -
apt install apt-transport-https
echo 'Acquire::Languages "none";' | tee /etc/apt/apt.conf.d/99disable-translations
echo "deb https://packages.cisofy.com/community/lynis/deb/ stable main" | tee /etc/apt/sources.list.d/cisofy-lynis.list
apt install chkrootkit rkhunter auditd lynis -y
#curl https://omnitruck.chef.io/install.sh |  bash -s -- -P inspec
lynis audit system >> /root/lynis_system_audit.txt
chkrootkit >> /root/hkrootkit_scan.txt
rkhunter -c >> /root/rkhunter_scan.txt

### SSH
mkdir ~/.ssh
cd ~/.ssh
ssh-keygen
touch ~/.ssh/authorized_keys



### General security hardening for servers
### Remove support for unwanted file system
/sbin/modprobe -n -v freevxfs
/sbin/modprobe -n -v jffs2
/sbin/modprobe -n -v hfs
/sbin/modprobe -n -v hfsplus
modprobe -n -v squashfs
/sbin/modprobe -n -v udf
modprobe -n -v vfat

