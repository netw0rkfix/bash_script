#!/bin/bash
### This script need to be run as root and in the root folder
### Generate SSH key and copy it to domain controller
ssh-keygen -t rsa -N "" -f my.key
mkdir ~/.ssh
mv my.key my.key.pub ~/.ssh
echo "Please enter your domain controller root password in order to copy your domain dedicated SSH key"

scp ~/.ssh/my.key.pub dc01:~/.ssh/new_debian_machine_key
### Update and upgrade machine
apt update && apt dist-upgrade -y
### Install ZSH && oh-my-zsh
apt install rsync -y
apt-get install fonts-powerline -y
apt install curl git -y
apt install zsh -y
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
### Set theme in .zshrc
sed -i 's/robbyrussell/spaceship/g' ~/.zshrc
### install plugins
apt install rsync -y
echo "Please enter your domain controller root password to download zsh pluggins"
rsync -r -e "ssh" --delete -av root@dc01:~/.oh-my-zsh/custom/plugins/ ~/.oh-my-zsh/custom/plugins/
sed -i 's/git/git k zsh-autosuggestions zsh-completions zsh-syntax-highlighting nmap ctf pip systemd sudo/g' ~/.zshrc
### Install p10K && spaceship themes
cd ~/root/.oh-my-zsh/custom/themes
git clone https://github.com/spaceship-prompt/spaceship-prompt.git ~/.oh-my-zsh/custom/themes/spaceship-prompt --depth=1
ln -s ~/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme ~/.oh-my-zsh/custom/themes/spaceship.zsh-theme
