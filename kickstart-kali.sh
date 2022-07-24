#!/bin/bash

# updates the repositories
sudo apt update

# installs oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# installs various packages
sudo apt install -y gobuster xclip ghidra hashid steghide
