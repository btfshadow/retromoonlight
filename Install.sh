#!/bin/bash

echo -e "\n****************************************************************"
echo -e "Welcome to the Moonlight Installer Script for RetroPie"
echo -e "****************************************************************\n"
echo -e "Select an option:"
echo -e " * 1: Complete Install and Setup"
echo -e " * 2: Install Moonlight"
echo -e " * 3: Pair Moonlight to PC"
echo -e " * 4: Install Moonlight Menu in RetroPie"
echo -e " * 5: Install Moonlight Refresh Script in RetroPie"
echo -e " * 6: Install Moonlight themes"
echo -e " * 7: Remove Launch Scripts"
echo -e " * 8: Install Plex"
echo -e " * 9: Exit"

read NUM
case $NUM in 
    1)
        sudo bash ./Scripts/Install_moonlight.sh
        sudo bash ./Scripts/Pair_moonlight.sh
        sudo bash ./Scripts/Install_menus.sh
        sudo bash ./Scripts/Install_Scripts.sh
        sudo bash ./Scripts/Install_themes.sh	
        sudo bash ./Scripts/Install_plex.sh
        ;;
    2)
        sudo bash ./Scripts/Install_moonlight.sh
        sudo bash ./Install.sh
        ;;
    3)				
        sudo bash ./Scripts/Pair_moonlight.sh
        sudo bash ./Install.sh
        ;;
    4)
        sudo bash ./Scripts/Install_menus.sh
        sudo bash ./Install.sh
        ;;	
    5) 
        sudo bash ./Scripts/Install_Scripts.sh
        sudo bash ./Install.sh
        ;;
    6)  
        sudo bash ./Scripts/Install_themes.sh
        sudo bash ./Install.sh
        ;;
    7)
        echo -e "\nRemoving all Moonlight launch scripts..."
        rm -rf /home/btfshadow/RetroPie/roms/moonlight	
        sudo bash ./Install.sh
        ;;
    8)
        sudo bash ./Scripts/Install_plex.sh
        sudo bash ./Install.sh
        ;;
    9)
        exit 1
        ;;		
    *) echo "INVALID NUMBER!" ;;
esac
