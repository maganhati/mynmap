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
echo "Updating package list..."
sudo apt update

# Instala o nmap
echo "Installing nmap..."
sudo apt install -y nmap

# Instala o tor
echo "Installing tor..."
sudo apt install -y tor

# Instala o proxychains
echo "Installing proxychains..."
sudo apt install -y proxychains

# Instala o bat (batcat em algumas distribuições)
echo "Installing bat..."
sudo apt install -y bat

# Verifica se o batcat está disponível e cria um link simbólico se necessário
echo "Checking for batcat..."
if ! command -v batcat &> /dev/null; then
  if command -v bat &> /dev/null; then
    echo "Creating symlink for batcat..."
    sudo ln -s $(which bat) /usr/local/bin/batcat
  else
    echo "batcat or bat not found. Please check the installation."
    exit 1
  fi
fi

# Adiciona o link simbólico para o script mynmap no PATH
echo "Linking mynmap to /usr/local/bin..."
sudo ln -s $(pwd)/mynmap /usr/local/bin/mynmap

echo "All dependencies have been installed successfully."