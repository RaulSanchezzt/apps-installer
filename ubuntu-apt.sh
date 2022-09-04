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
sudo apt install -y google-chrome-stable

## TERMINAL
# Kitty -> https://sw.kovidgoyal.net/kitty/binary/
sudo apt install -y kitty

# ZSH
sudo apt install -y zsh zsh-autosuggestions zsh-syntax-highlighting

# sudo plugin -> https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/sudo/sudo.plugin.zsh
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh
sudo mv sudo.plugin.zsh /usr/share
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
sudo apt install -y code 

# DBeaver CE -> https://dbeaver.io/download/
sudo apt install -y dbeaver-ce

## OTHER
# Mega Sync -> https://mega.nz/desktop
sudo apt install -y megasync nautilus-megasync

# Team Viewer -> https://www.teamviewer.com/en/download/linux/
sudo apt install -y teamviewer

# Python -> https://www.python.org/downloads/
sudo apt install -y python3 python3-dev python3-pip

# Flameshot -> https://flameshot.org/#download
sudo apt install -y flameshot

## FLATPAK APPS
# Setup Flatpak -> https://flatpak.org/setup/Ubuntu
sudo apt install flatpak
sudo apt install gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install apps -> Calibre, Discord, MarkText, Bottles, Smile, Obsidian, OnlyOffice
flatpak install flathub com.calibre_ebook.calibre com.discordapp.Discord com.github.marktext.marktext com.usebottles.bottles it.mijorus.smile md.obsidian.Obsidian org.onlyoffice.desktopeditors

## Manual Installs
# Firefox Dev
sudo apt install -y alacarte

# MySQL WorkBench
sudo apt install -y mysql-server

# Notion Snap

# GNOME Extensions

## FINAL COMMENTS
echo "[+] Now you only have to install manually: Firefox Developer, MySQL WorkBench, Notion-snap and GNOME Extensions."
echo "[!] Install VMware WorkStation and Nvim from the other scripts."
echo "[*] Configure your dotfiles!"