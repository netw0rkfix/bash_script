#!/bin/bash

### Install ZSH && oh-my-zsh + spaceship theme
apt-get install fonts-powerline git rsync zsh -y
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sed -i 's/robbyrussell/spaceship/g' ~/.zshrc
rsync -r -e "ssh" --delete -av (username)@(host):~/.oh-my-zsh/custom/plugins/ ~/.oh-my-zsh/custom/plugins/
sed -i 's/git/git k zsh-autosuggestions zsh-completions zsh-syntax-highlighting/g' ~/.zshrc
cd ~/.oh-my-zsh/custom/themes
git clone https://github.com/spaceship-prompt/spaceship-prompt.git ~/.oh-my-zsh/custom/themes/spaceship-prompt --depth=1
ln -s ~/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme ~/.oh-my-zsh/custom/themes/spaceship.zsh-theme

