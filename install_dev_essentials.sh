#!/bin/bash


pacman --version 1>/dev/null 2>/dev/null
if [[ $? == 0 ]]; then
  sudo pacman -S vim zsh fd ripgrep
fi

apt --version 1>/dev/null 2>/dev/null
if [[ $? == 0 ]]; then
  sudo apt install vim zsh ripgrep fd-find
fi


echo "Setting vim plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "Setting zsh"
wget https://raw.githubusercontent.com/bojle/dotfiles/master/zsh/.zshrc -O $HOME/.zshrc
wget https://raw.githubusercontent.com/bojle/dotfiles/master/vim/.vim/vimrc -O $HOME/.vimrc

mkdir $HOME/.zsh
sed '/zsh-z/d' $HOME/.zshrc
wget https://raw.githubusercontent.com/rupa/z/master/z.sh -O $HOME/.zsh/z.sh
echo "source $HOME/.zsh/z.sh" >> $HOME/.zshrc

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> $HOME/.zshrc

wget 'https://raw.githubusercontent.com/bojle/dotfiles/master/zsh/.zsh/zsh.alias' -O $HOME/.zsh/zsh.alias
wget 'https://raw.githubusercontent.com/bojle/dotfiles/master/zsh/.zsh/zsh.functions' -O $HOME/.zsh/zsh.functions

