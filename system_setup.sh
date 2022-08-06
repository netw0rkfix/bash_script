#!/bin/bash

mkdir /usr/local/custom

### Rin this script as root on the system apply domain standards

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
apt install tree ranger qemu-guest-agent neofetch git curl tmux -y
apt install figlet toilet zip unzip p7zip p7zip-plugins vim snmpd snmp libsnmp-dev htop rsync -y

### Network utilities
apt-get install iftop network-manager net-tools openvpn -y
systemctl start NetworkManager.service
systemctl stop NetworkManager.service

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
#lynis audit system >> /root/lynis_system_audit.txt
#chkrootkit >> /root/hkrootkit_scan.txt
#qrkhunter -c >> /root/rkhunter_scan.txt

### SSH
mkdir ~/.ssh
ssh-keygen -t rsa -N "" -f domain.key
mv domain.key domain.key.pub ~/.ssh
touch ~/.ssh/authorized_keys
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDU/4G/b3bbekv60mQ/zZhBeYQ+ajDO+uXlrHZ8r984Tc15ANZmjYhI9uTufMv9Eys+HRpIpocWfQ4RgKgkGaF3uqS65EzlVYIw8TU8ZIjOD8LXoEat87aBKsywPYK6kTxs8s42qlhdMkHapNe8Xan82adXgFvBK3rKgVe82NDrmCHLOEQRwSGKutTPWZTmdSaRhXkW1OTRJSUn2m0KkyHJLfZd33j/ZJ+BOgklfEupWPl5z4h+joQd+0vLHjTGbK6hkYMZlokxAvJyu5P7HcjGwGq0o8dwJsCJO7KxlwXqWG+0LvWXeYd+dbGJCLDJ5u3V9+JmeD30Gd+NREP6z1dNzJc2c6StFHoLRVzfSkxn2CIVAj0GLObQ+2pBFFSc0TmRwyFk8W3SofgFbuVPMX2DCVeMe2VtMlc4XBxOjpJhQlJ0fqvPn5RtUEvB0W1VSv61rOIb7nuY+EtA3KIYQxqeEXbDzhPx0eN65eRRs2MnUt8BW+pYcUtlVmxbYbLj87E= serveradmin@ubuntu' >> ~/.ssh/authorized_keys
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDLsKEiOxMpZveqTWZPRmXfS9lUo7XiTl1o1yuCn9Gz47+6UA1L0ZBnnSdKmbVXN1ewM5Et5qhfzCNlNtOCHDS7s5D59XCXMHLYOVdDvrMBpw6/n9/uDirgsUkO2m2X/HfGnNwb5vpivCYCCxlIB9SoHTj3Y8NcBP6c4/k8b4sazbZ6oeQ85CR2KpRotIW+Oq0tnMxWxtrTH2SLBt+WDwMSqT8rF0BdPU+jPTcmuYTIRPWhMSKppZr7GGCd3+C9UHuwp6H+zrKl6YWxX6pNzGvAsRebg2ADp6AcDLBf39KiFHYAr2gvcZnvWD3gYanlrOQfoseFzUYi5kQAqOJgDYIY0CgQxA2p7IakbU3OBkIY2cwsXUji/THilbUhIcj+s1w0uDK5hJtsuBxdBueIgDt5WM1leQ8P3BFhvAj+1TTGzNJucUmrmjB4KM2ofDnjMu3aNbxy2D30K/dW/K0Gt1AKd9ENW8TJO6Oz7rEhZbOXFUNJ4IW1kvRteXAmzIDAJyE= maxime@pop-os' >> ~/.ssh/authorized_keys

### Change ssh configuration

### ....


### install zsh + spaceship
apt-get install zsh fonts-powerline -y
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rsync -r -e "ssh -p 65531" --delete -av root@homelab.technoptik.com:~/.oh-my-zsh/custom/plugins/ ~/.oh-my-zsh/custom/plugins/
sed -i 's/robbyrussell/spaceship/g' ~/.zshrc
sed -i 's/git/git k zsh-autosuggestions zsh-completions zsh-syntax-highlighting nmap ctf pip systemd sudo/g' ~/.zshrc
git clone https://github.com/spaceship-prompt/spaceship-prompt.git ~/.oh-my-zsh/custom/themes/spaceship-prompt --depth=1
ln -s ~/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme ~/.oh-my-zsh/custom/themes/spaceship.zsh-theme



### Add zsh aliases

