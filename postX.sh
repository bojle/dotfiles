#!/usr/bin/bash

# Options. Tweak these.
opt_stow_dirs="alacritty bspwm sxhkd cmus picom polybar rofi zathura vim X zsh scripts"

# Should be run after preX.sh
# Sets personalized settings

# stow these directories. 
stow "$opt_stow_dirs"

# Do not stow dir 'systemd', as systemd doesnt handle symlinks well. Do it manually
echo "Setting up battery-alert timer"
cd systemd/.config/
cp -r . ~/.config/
cd ../..
systemctl --user enable battery-alert.timer
systemctl --user start battery-alert.timer


# Install gruvbox and zsh-autosuggestions
