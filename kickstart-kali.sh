#!/bin/bash

# downloads .profile custom functions
wget -qO- https://raw.githubusercontent.com/et994/kali-config/main/kali-custom-profile-functions | sudo tee --append ~/.profile &>/dev/null

# updates the repositories
sudo apt update &>/dev/null

# installs oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" &>/dev/null

# installs various packages
sudo apt install -y gobuster xclip ghidra hashid steghide &>/dev/null
