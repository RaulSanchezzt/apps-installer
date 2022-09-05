#!/bin/bash

# A bash script to install all the apps I use at the same time
sudo apt update -y
sudo apt upgrade -y

## WEB BROWSERS
# Firefox is alredy installed

# Brave -> https://brave.com/linux/#debian-ubuntu-mint
sudo apt install -y apt-transport-https curl

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update -y

sudo apt install -y brave-browser

# Google Chrome -> https://www.google.com/chrome/
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb

## TERMINAL
# Kitty -> https://sw.kovidgoyal.net/kitty/binary/
sudo apt install -y kitty

# ZSH
sudo apt install -y zsh zsh-autosuggestions zsh-syntax-highlighting

# Change the shell to ZSH
chsh -s /bin/zsh

# sudo plugin -> https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/sudo/sudo.plugin.zsh
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh
sudo mkdir /usr/share/zsh-plugins
sudo mv sudo.plugin.zsh /usr/share/zsh-plugins
sudo chown $USER:$GRP /usr/share/zsh-plugins

# Powerlevel10K -> https://github.com/romkatv/powerlevel10k#installation
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

# Add Powerlevel10K Root Shell
sudo ln -s -f ~/.p10k.zsh /root/.p10k.zsh
sudo cp -r ~/powerlevel10k/ /root

# Zsh Symlink with root
sudo ln -s -f ~/.zshrc /root/.zshrc

# Tools
sudo apt install -y fzf xclip htop bat ranger

# lsd -> https://github.com/Peltoche/lsd
wget "https://github.com/Peltoche/lsd/releases/download/0.22.0/lsd_0.22.0_amd64.deb"
sudo dpkg -i "lsd_0.22.0_amd64.deb"

# Meslo Nerd Fonts
sudo curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf --output /usr/local/share/fonts/'MesloLGS NF Regular.ttf'
sudo curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf --output /usr/local/share/fonts/'MesloLGS NF Bold.ttf'
sudo curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf --output /usr/local/share/fonts/'MesloLGS NF Italic.ttf'
sudo curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf --output /usr/local/share/fonts/'MesloLGS NF Bold Italic.ttf'
fc-cache -v

## IDE
# Visual Studio Code -> https://code.visualstudio.com/
sudo apt install software-properties-common apt-transport-https wget -y
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code

## OTHER
# Mega Sync -> https://mega.nz/desktop
wget https://mega.nz/linux/repo/xUbuntu_22.04/amd64/megasync_4.6.8-3.1_amd64.deb
wget https://mega.nz/linux/repo/xUbuntu_22.04/amd64/nautilus-megasync_3.6.6_amd64.deb
sudo apt install ./megasync_4.6.8-3.1_amd64.deb
sudo apt install ./nautilus-megasync_3.6.6_amd64.deb

# Team Viewer -> https://www.teamviewer.com/en/download/linux/
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
sudo apt install -y ./teamviewer_amd64.deb

# Python -> https://www.python.org/downloads/
sudo apt install -y python3 python3-dev python3-pip

# Flameshot -> https://flameshot.org/#download
sudo apt install -y flameshot

# Notion Snap -> https://github.com/steverydz/notion-snap
snap install notion-snap

# Grub customizer
sudo add-apt-repository ppa:danielrichter2007/grub-customizer -y 
sudo apt-get update -y
sudo apt-get install -y grub-customizer

## FLATPAK APPS
# Setup Flatpak -> https://flatpak.org/setup/Ubuntu
sudo apt install -y flatpak
sudo apt install -y gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install apps -> Calibre, DBeaver CE, Discord, Dropbox, GNOME Extensions Manager, MarkText, Bottles, Smile, Obsidian, OnlyOffice
flatpak install flathub com.calibre_ebook.calibre io.dbeaver.DBeaverCommunity com.discordapp.Discord com.dropbox.Client com.mattjakeman.ExtensionManager com.github.marktext.marktext com.usebottles.bottles it.mijorus.smile md.obsidian.Obsidian org.onlyoffice.desktopeditors -y

## Manual Installs
# Firefox Dev
sudo apt install -y alacarte

# MySQL WorkBench
sudo apt install -y mysql-server

## FINAL COMMENTS
echo "[+] Now you only have to install manually: Firefox Developer and MySQL WorkBench."
echo "[!] Install VMware WorkStation and Nvim from the other scripts."
echo "[*] You should restart the computer and configure your dotfiles!"