# Kali Linux configuration

## Set keyboard layout

### Set keyboard layout for the current session
Replace `it` with your locale (eg. `fr` for french layout).
```sh
setxkbmap it
```

### Set keyboard layout permanently after reboot
Replace `L='it'` with your locale (eg. `L='de'` for german layout), then reboot:
```sh
L='it' && sudo sed -i 's/XKBLAYOUT=\"\w*"/XKBLAYOUT=\"'$L'\"/g' /etc/default/keyboard
```

## Edit default kali password
```sh
sudo passwd kali
```

---

# Tools

## Update repositories and install missing packages
```sh
sudo apt update && sudo apt install -y space_separated_packages
```
Example:  `sudo apt update && sudo apt install -y gobuster xclip ghidra steghide`

## Install **oh-my-zsh**
```sh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

---

# Customization

## Import `~/.profile` custom functions
```sh
wget -qO- https://raw.githubusercontent.com/et994/kali-config/main/kali-custom-profile-functions | sudo tee --append ~/.profile &>/dev/null
```

### A further look to custom functions

The **target** function purpose is to append to the end of the `/etc/hosts` file an IP address and its mapping to the hostname `target`.
For example, after executing `target 10.10.123.234` we can ping that IP address by specifying just the hostname: `ping -c4 target`.
If we already have a **target** in our hosts file, it will be replaced by the new **target**.

The **audit** function purpose is to scan an IP address using _nmap_, converting the output to an HTML file and viewing it using _firefox-esr_.
Usage: `audit 10.10.123.234` or in combination with the **target** function, after mapping an IP address with the **target** hostname: `audit target`.

The **msfinit** is just a one-line command to start the **msfconsole** after having initialized the **msfdb**.
