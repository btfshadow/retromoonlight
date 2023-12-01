#!/bin/bash

echo -e "\nCreating New Menus for RetroPie..."

CONFIG=$(<./menu_config.txt)
DIRECTORY=/home/btfshadow/.emulationstation/es_systems.cfg

if [ -f $DIRECTORY ]
then	
    echo -e "Removing Duplicate Systems File"
    rm $DIRECTORY
fi

echo -e "Copying Systems Config File"
cp /etc/emulationstation/es_systems.cfg $DIRECTORY

echo -e "Adding Moonlight to Systems"
sudo sed -i -e 's|</systemList>|  <system>\n    <name>moonlight</name>\n    <fullname>Moonlight</fullname>\n    <path>~/RetroPie/roms/moonlight</path>\n    <extension>.sh .SH</extension>\n    <command>bash %ROM%</command>\n    <platform>pc</platform>\n    <theme>moonlight</theme>\n  </system>\n</systemList>|g' $DIRECTORY

echo -e "\nMoonlight menu added to RetroPie..."

echo -e "Adding Plex to Systems"
sed -i -e 's|</systemList>|  <system>\n    <name>plex</name>\n    <fullname>Plex</fullname>\n    <path>~/RetroPie/roms/plex</path>\n    <extension>.sh .SH</extension>\n    <command>/usr/bin/startx ~/RetroPie/roms/plex/launch_plex.sh</command>\n    <platform>pc</platform>\n    <theme>plex</theme>\n  </system>\n</systemList>|g' $DIRECTORY

echo -e "\nPlex menu added to RetroPie..."
