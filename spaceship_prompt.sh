#!/bin/bash
### This script need to be run as root and in the root folder
### Install ZSH && oh-my-zsh
apt-get install fonts-powerline -y
apt install zsh -y
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
### Set theme in .zshrc
sed -i 's/robbyrussell/spaceship/g' ~/.zshrc
#rsync -r -e "ssh" --delete -av root@dc01:~/.oh-my-zsh/custom/plugins/ ~/.oh-my-zsh/custom/plugins/
#sed -i 's/git/git k zsh-autosuggestions zsh-completions zsh-syntax-highlighting nmap ctf pip systemd sudo/g' ~/.zshrc
### Install p10K && spaceship themes
cd ~/root/.oh-my-zsh/custom/themes
git clone https://github.com/spaceship-prompt/spaceship-prompt.git ~/.oh-my-zsh/custom/themes/spaceship-prompt --depth=1
ln -s ~/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme ~/.oh-my-zsh/custom/themes/spaceship.zsh-theme





****
### install zsh + spaceship
#apt-get install zsh fonts-powerline -y
#chsh -s $(which zsh)
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#rsync -r -e "ssh -p 65531" --delete -av root@homelab.technoptik.com:~/.oh-my-zsh/custom/plugins/ ~/.oh-my-zsh/custom/plugins/
#sed -i 's/robbyrussell/spaceship/g' ~/.zshrc
#sed -i 's/git/git k zsh-autosuggestions zsh-completions zsh-syntax-highlighting nmap ctf pip systemd sudo/g' ~/.zshrc
#git clone https://github.com/spaceship-prompt/spaceship-prompt.git ~/.oh-my-zsh/custom/themes/spaceship-prompt --depth=1
#ln -s ~/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme ~/.oh-my-zsh/custom/themes/spaceship.zsh-theme
