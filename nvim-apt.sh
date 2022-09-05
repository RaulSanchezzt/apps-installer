#!/bin/bash

if ! command -v nvim &> /dev/null
    then
        # Install Nvim -> https://github.com/RaulSanchezzt/kali-bspwm#how-to-update-nvim-v061-to-nvim-v070-in-kali-linux

        wget https://github.com/neovim/neovim/releases/download/v0.7.2/nvim-linux64.deb
        sudo apt update -y 
        sudo apt upgrade -y
        sudo rm /usr/share/applications/nvim.desktop
        sudo apt remove neovim neovim-runtime -y
        sudo apt autoremove -y
        sudo apt install ./nvim-linux64.deb -y
        sudo ln -sf /usr/bin/nvim /usr/bin/vim
        sleep 4
        clear
        echo "[!] Nvim v.0.7.2 has been successfully installed."

        # Install ripgrep -> https://github.com/BurntSushi/ripgrep#installation
        curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
        sudo dpkg -i ripgrep_13.0.0_amd64.deb

        # Install NvChad -> https://nvchad.com/quickstart/install#install
        git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim        

        sleep 4
        clear
        echo "[!] NvChad has been successfully installed."
    else
        echo "Nvim is alredy installed"
    fi