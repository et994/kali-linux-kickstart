## Keyboard layout
Replace `L='it'` with your locale (eg. `L='de'` for german layout), then reboot:
```sh
L='it' && sudo sed -i 's/XKBLAYOUT=\"\w*"/XKBLAYOUT=\"'$L'\"/g' /etc/default/keyboard
```

## Edit default kali password
```sh
sudo passwd kali
```

## Install **oh-my-zsh**
```sh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Import `.profile` custom functions
```sh
wget -qO- https://raw.githubusercontent.com/et994/kali-config/main/kali-custom-profile-functions | sudo tee --append ~/.profile &>/dev/null
```

## Update repositories and install missing packages
```sh
sudo apt update && sudo apt install -y space_separated_packages
```
Example:  'sudo apt update && s
