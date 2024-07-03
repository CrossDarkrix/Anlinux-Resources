#!/bin/bash

#Get the necessary components
yum groupinstall lxde-desktop -y
yum install tigervnc-server dbus-x11 -y

#Setup the necessary files
mkdir $HOME/.vnc
wget https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Scripts/DesktopEnvironment/Yum/Fedora/LXDE/xstartup --no-check-certificate -P $HOME/.vnc/
wget https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Scripts/DesktopEnvironment/Yum/Fedora/LXDE/vncserver-start --no-check-certificate -P $HOME/../usr/local/bin/
wget https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Scripts/DesktopEnvironment/Yum/Fedora/LXDE/vncserver-stop --no-check-certificate -P $HOME/../usr/local/bin/
chmod +x $HOME/.vnc/xstartup
chmod +x $HOME/../usr/local/bin/vncserver-start
chmod +x $HOME/../usr/local/bin/vncserver-stop

echo " "
echo "You can now start vncserver by running vncserver-start"
echo " "
echo "It will ask you to enter a password when first time starting it."
echo " "
echo "The VNC Server will be started at 127.0.0.1:5901"
echo " "
echo "You can connect to this address with a VNC Viewer you prefer"
echo " "
echo "Connect to this address will open a window with LXDE Desktop Environment"
echo " "
echo " "
echo " "
echo "Running vncserver-start"
echo " "
echo " "
echo " "
echo "To Kill VNC Server just run vncserver-stop"
echo " "
echo " "
echo " "

echo "export DISPLAY=":1"" >> $HOME/../etc/profile
source $HOME/../etc/profile

vncserver-start
