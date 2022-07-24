#!/bin/bash

sudo apt update
sudo apt install -y gobuster xclip ghidra hashid steghide

wget -qO- https://raw.githubusercontent.com/et994/kali-config/main/kali-custom-profile-functions | sudo tee --append ~/.profile
