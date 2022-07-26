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

## Install **oh-my-zsh**
```sh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Update repositories and install missing packages
```sh
sudo apt update && sudo apt install -y space_separated_packages
```
Example:  `sudo apt update && sudo apt install -y gobuster xclip ghidra steghide ollydbg wine`

---

# Customization

## Import `~/.custom_functions_profile` custom functions
```sh
wget -qO- https://raw.githubusercontent.com/et994/kali-linux-kickstart/main/kali-custom-functions-profile | sudo tee --append ~/.custom_functions_profile &>/dev/null
```

Now we need to auto source the file if it exists:
```sh
wget -qO- https://raw.githubusercontent.com/et994/kali-linux-kickstart/main/zshrc-custom-functions-profile-auto-source | sudo tee --append ~/.zshrc &>/dev/null
```

### A further look to custom functions

The **target** function purpose is to append to the end of the `/etc/hosts` file an IP address and its mapping to the hostname `target`.
For example, after executing `target 10.10.123.234` we can ping that IP address by specifying just the hostname: `ping -c4 target`.
If we already have a **target** in our hosts file, it will be replaced by the new **target**.

The **audit** function purpose is to scan an IP address using _nmap_, converting the output to an HTML file and viewing it using _firefox-esr_.
Usage: `audit 10.10.123.234` or in combination with the **target** function, after mapping an IP address with the **target** hostname: `audit target`.

The **msfinit** is just a one-line command to start the **msfconsole** after having initialized the **msfdb**. It is useful for the first run.

## Enable root user on Kali Linux (_not recommended_)

```sh
sudo apt update && sudo apt install -y kali-root-login
sudo passwd root
```

## Installing Docker on Kali Linux

```sh
sudo apt update && sudo apt install -y docker.io
```

Let's enable the service:

```sh
sudo systemctl enable docker --now
```

### (Optional) Using Docker without `sudo`

```sh
sudo usermod -aG docker $USER
```

Now logout and in again.

# Useful stuff
[SSH GitHub configuration](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
