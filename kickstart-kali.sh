#!/bin/bash

# permanently sets keyboard layout to italian
L='it' && sudo sed -i 's/XKBLAYOUT=\"\w*"/XKBLAYOUT=\"'$L'\"/g' /etc/default/keyboard

# import .profile custom functions
wget -qO- https://raw.githubusercontent.com/et994/kali-config/main/kali-custom-profile-functions | sudo tee --append ~/.profile

# updates the repositories
sudo apt update

# installs oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# installs various packages
sudo apt install -y gobuster xclip ghidra hashid steghide
