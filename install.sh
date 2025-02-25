#!/bin/bash

# Define colors
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
CYAN='\e[36m'
WHITE='\e[37m'
RESET='\e[0m'
GRAY='\033[0;37m'

echo -e "\n${CYAN}███╗   ███╗██╗   ██╗███╗   ██╗███╗   ███╗ █████╗ ██████╗ 
████╗ ████║╚██╗ ██╔╝████╗  ██║████╗ ████║██╔══██╗██╔══██╗
██╔████╔██║ ╚████╔╝ ██╔██╗ ██║██╔████╔██║███████║██████╔╝
██║╚██╔╝██║  ╚██╔╝  ██║╚██╗██║██║╚██╔╝██║██╔══██║██╔═══╝ 
██║ ╚═╝ ██║   ██║   ██║ ╚████║██║ ╚═╝ ██║██║  ██║██║     
╚═╝     ╚═╝   ╚═╝   ╚═╝  ╚═══╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝ ${RESET}Made by ${CYAN}Diego Becker${RESET}.\n"

echo "THIS TOOL IS MADE ONLY FOR EDUCATIONAL AND RESEARCH PURPOUSES ONLY I DO NOT ASSUME
ANY KIND OF RESPONSIBILITY FOR ANY IMPROPE USE OF THIS TOOL USE IT WITH GOOD SENSE."

echo "Starting installation of dependencies..."

# Atualiza a lista de pacotes
echo "### Updating package list..."
sudo dnf update -y
echo "done!"

# Instala o nmap
echo "### Installing nmap..."
sudo dnf install nmap -y
echo "done!"

# Instala o tor
echo "### Installing tor..."
sudo dnf -y install epel-release && sudo dnf -y update
sudo dnf install tor -y
echo "done!"

# Instala o proxychains
echo "### Installing proxychains..."
sudo yum makecache --refresh
sudo dnf install proxychains-ng -y
echo "done!"

# Instala o bat (batcat em algumas distribuições)
echo "### Installing bat dependencies..."
sudo dnf install cargo
echo "done!"

echo "### Installing bat..."
cargo install --locked bat > /dev/null 2>&1
echo "done!"

echo "### Copying bat binary to bin directory..."
USER_HOME=$(eval echo ~${SUDO_USER})
sudo cp ${USER_HOME}/.cargo/bin/bat /usr/local/bin/batcat
echo "done!"

# Adiciona o link simbólico para o script mynmap no PATH
echo "Linking mynmap to /usr/local/bin..."
sudo ln -s $(pwd)/mynmap /usr/local/bin/mynmap

echo "All dependencies have been installed successfully."

sudo chmod 770 ./mynmap
