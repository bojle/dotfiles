#!/usr/bin/bash

# Options. Tweak these.
opt_default_shell="$(where zsh)"
opt_packages="alacritty bspwm sxhkd cmus picom polybar rofi zathura vim xorg zsh"

# Install packages
sudo pacman -Syu "$opt_packages"

# change default shell
chsh -s "$opt_default_shell"
