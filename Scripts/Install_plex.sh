#!/bin/bash

echo -e "Installing Building Tools"

sudo apt update
sudo apt install -y xserver-xorg xinit xserver-xorg-input-all
sudo apt install -y autoconf make automake build-essential gperf yasm gnutls-dev libv4l-dev checkinstall libtool libtool-bin libharfbuzz-dev libfreetype6-dev libfontconfig1-dev libx11-dev libcec-dev libxrandr-dev libvdpau-dev libva-dev mesa-common-dev libegl1-mesa-dev yasm libasound2-dev libpulse-dev libbluray-dev libdvdread-dev libcdio-paranoia-dev libsmbclient-dev libcdio-cdda-dev libjpeg-dev libluajit-5.1-dev libuchardet-dev zlib1g-dev libfribidi-dev git libgnutls28-dev libgl1-mesa-dev libgles2-mesa-dev libsdl2-dev cmake python3 python python-minimal git

echo -e "Installing MPV Used to Stream Videos"
echo -e "\n"
echo -e "COMPILING WILL TAKE AROUND 15-18 MINUTES"
echo -e "COMPILING WILL TAKE AROUND 15-18 MINUTES"
echo -e "\n"

git clone https://github.com/mpv-player/mpv-build.git
cd mpv-build

echo --enable-libmpv-shared > mpv_options
echo --disable-cplayer >> mpv_options

./use-mpv-release
./use-ffmpeg-release

./rebuild -j$(nproc)

sudo ./install
sudo ldconfig

#######
echo -e "\nInstalling Additional OPENGL files need to build Plex"

cd ~
wget https://github.com/koendv/qt5-opengl-raspberrypi/releases/download/v5.12.5-1/qt5-opengl-dev_5.12.5_armhf.deb
sudo apt-get install -y ./qt5-opengl-dev_5.12.5_armhf.deb
rm qt5-opengl-dev_5.12.5_armhf.deb

#######
echo -e "\nCompiling Plex"

cd ~
git clone https://github.com/plexinc/plex-media-player
mkdir ~/plex-media-player/build
cd ~/plex-media-player/build
cmake -DCMAKE_BUILD_TYPE=Debug -DQTROOT=/usr/lib/qt5.12/ -DCMAKE_INSTALL_PREFIX=/usr/local/ ..
make -j$(nproc)
sudo make install

#########
mkdir -p /home/pi/RetroPie/roms/plex
#make .sh to launch plex
/bin/cp ./Scripts/launch_plex.sh /home/pi/RetroPie/roms/plex/launch_plex.sh
chmod -x /home/pi/RetroPie/roms/plex/launch_plex.sh
############################################################

mkdir -p /home/pi/.local/share/plexmediaplayer/inputmaps
/bin/cp ./gamepad/steel-series-duo.json /home/pi/.local/share/plexmediaplayer/inputmaps/xbox-controller-windows.json

############################################################
echo -e "\nInstalling Plex Theme For Carbon"
sudo /bin/cp -r ./themes/carbon/plex /etc/emulationstation/themes/carbon/
