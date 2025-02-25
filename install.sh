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
# O usuário ao rodar o script de instalação utilizando o sudo, o binário do Bat fica automaticamente em ${USER_HOME}/.cargo/bin/bat, sendo copiado em seguida para /usr/local/bin, que está no PATH.
USER_HOME=$(eval echo ~${SUDO_USER})
sudo cp ${USER_HOME}/.cargo/bin/bat /usr/local/bin/batcat
echo "done!"

# Adiciona o link simbólico para o script mynmap no PATH
echo "Linking mynmap to /usr/bin..."
# Alterado o caminho do binário para /usr/bin/, pois com caminho anterior (/usr/local/bin/) e o usuário executando com o comando sudo (ou sem ele), o sistema solicitava a senha constantemente.
sudo ln -s $(pwd)/mynmap /usr/bin/mynmap

echo "All dependencies have been installed successfully."

sudo chmod 770 ./mynmap
