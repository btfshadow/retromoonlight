#!/bin/bash

echo -e "\nCreating Refresh script in Moonlight..."

if [ -d /home/btfshadow/RetroPie/roms/moonlight ] 
then
    rm -rf /home/btfshadow/RetroPie/roms/moonlight
fi

mkdir -p /home/btfshadow/RetroPie/roms/moonlight

chmod a+x ./Scripts/Refresh.sh
/bin/cp ./Scripts/Refresh.sh /home/btfshadow/RetroPie/roms/moonlight/Refresh.sh
/bin/cp ./GenerateGamesList.py /home/btfshadow/RetroPie/roms/moonlight/GenerateGamesList.py
/bin/cp ./Scripts/Force_Quit.sh /home/btfshadow/RetroPie/roms/moonlight/Force_Quit.sh

chmod 777 /home/btfshadow/RetroPie/roms/moonlight

echo -e "Refresh script has been added to RetroPie\n"
echo -e "After loading RetroPie, use the \"Refresh\" rom listed in the Moonlight system.\n"
