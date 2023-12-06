#!/bin/bash
cat drawing | lolcat -a -s 400 -d 3 -f
# Script to automate Metasploit tasks
# Function Color
colorize() {
  local color_code=$1
  local text=$2
  echo -e "\e[${color_code}m${text}\e[0m"
}

# ANSI color codes
RED='\033[1;31m'      
GREEN='\033[1;32m'  
YELLOW='\033[1;33m' 
BLUEBold='\033[1;34m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Define variables
METASPLOIT_PATH="/usr/share/metasploit-framework"  # Replace with your Metasploit installation path

# Function to check if Metasploit is installed
check_metasploit() {
  if [ -d "$METASPLOIT_PATH" ]; then
    echo -e "${BLUE}Metasploit is installed.${NC}"
  else
    echo "Metasploit is not installed. Please install it and try again."
    exit 1
  fi
}

# Function to update Metasploit
update_metasploit() {
  echo "Updating Metasploit..."
  bash updateMetasploit.sh
  clear
}

# Function to scan the network using Metasploit
scan_network() {
  read -p $'\033[1;31mEnter the target IP address or press Enter to perform a complete network scan: \033[1;34m' TARGET_IP

  # If no input is provided, use the default IP
  if [ -z "$TARGET_IP" ]; then
    echo "Scan on IP = All Network scanning"
    TARGET_IP="192.168.1.0/24"
  fi

  service postgresql start
  msfconsole -x "db_nmap $TARGET_IP; services -p 1-65535; hosts"
}

# Main script
check_metasploit

while true; do
  echo -e "${BLUEBold}Choose an option:\n${RED}"
  echo -e "1. Scan network"
  echo -e "2. Show available exploits"
  echo -e "3. Show available payloads"
  echo -e "4. Show available auxiliary"
  echo -e "5. Show available encoders"
  echo -e "90. Clear"
  echo -e "99. Exit"

  read -p $'\033[1;32mEnter your choice: \033[0m' choice

  case $choice in
    1)
      scan_network
      ;;
    2)
      echo -e "${BLUE}Showing available exploits...${BLUEBold}"
      msfconsole -x "search type:exploit"
      ;;
    3)
      echo -e "${BLUE}Showing available payloads...${BLUEBold}"
      msfconsole -x "show payloads"
      ;;
    4)
      echo -e "${BLUE}Showing available auxiliary...${BLUEBold}"
      msfconsole -x "search type:auxiliary"
      ;;
    5)
      echo -e "${BLUE}Showing available encoders...${BLUEBold}"
      msfconsole -x "show encoders"
      ;;
    90)
      clear
      ;;
    99)
      read -p "Do you really want to exit? (type 'exit' to confirm): " confirm_exit
      if [ "$confirm_exit" == "exit" ]; then
        echo "Exiting..."
        exit 0
      else
        echo "Continuing..."
      fi
      ;;
    *)
      echo "Invalid choice. Please try again."
      ;;
  esac
done
