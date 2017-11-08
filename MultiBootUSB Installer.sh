#!/bin/bash

#MultiBootUSB Installer
#Program Version to be installed 8.8.0-1.deb
#Note: From Official repositories will be the most recent

#Made by Luciano Brito
#


echo "******************************************************"
echo "*                                                    *"
echo "*              MultiBootUSB Installer Tool           *"
echo "*                                                    *"
echo "******************************************************"

echo
echo "This tool will only work on Debian, Ubuntu and Derivatives!"
echo

echo
echo

echo "Enter the Super User Password!"
echo -n "Password: "
read -s senha1

echo
echo

#Installation from Official Repositories
if ! [ -x '/usr/bin/multibootusb-pkexec' ]
then
    echo "Installing MultibootUSB!"
    echo "************************"
    echo
    echo "$senha1" | sudo -S apt install python3-multibootusb -y
    echo "$senha1" | sudo -S apt install qemu -y

    #Installation Through .deb Package
    if ! [ -x '/usr/bin/multibootusb-pkexec' ]
    then
        if [ -e '/home/$USER/python3-multibootusb_8.8.0-1_all.deb*' ]
        then
            cd /home/$USER
            echo "$senha1" | sudo -S dpkg -i python3-multibootusb_8.8.0-1_all.deb*
            echo "$senha1" | sudo -S dpkg --configure -a
            echo "$senha1" | sudo -S apt update
            echo "$senha1" | sudo -S apt install python3-multibootusb --only-upgrade -y
            echo "$senha1" | sudo -S apt install -f
            echo "$senha1" | sudo -S rm -Rf python3-multibootusb_8.8.0-1_all.deb
        else
            cd /home/$USER
            wget -c 'https://ufpr.dl.sourceforge.net/project/multibootusb/8.8.0/Linux/python3-multibootusb_8.8.0-1_all.deb'
            if [ -e /home/$USER/python3-multibootusb_8.8.0-1_all.deb ]
            then
                echo "$senha1" | sudo -S dpkg -i python3-multibootusb_8.8.0-1_all.deb*
                echo "$senha1" | sudo -S dpkg --configure -a
                echo "$senha1" | sudo -S apt update
                echo "$senha1" | sudo -S apt install python3-multibootusb --only-upgrade -y
                echo "$senha1" | sudo -S apt install -f
                echo "$senha1" | sudo -S rm -Rf python3-multibootusb_8.8.0-1_all.deb
            else
                echo
                echo "The file has not been downloaded, so it will not be installed!"
                echo
            fi
        fi
    else
        clear
        echo "The Package's Already Installed, But It Will Be Updated!"
        echo "********************************************************"
        echo
        echo "$senha1" | sudo -S apt update
        echo "$senha1" | sudo -S apt install python3-multibootusb --only-upgrade -y
        echo "$senha1" | sudo -S apt install -f
    fi

else
    clear
    echo "The Package's Already Installed, But It Will Be Updated!"
    echo "********************************************************"
    echo
    echo "$senha1" | sudo -S apt update
    echo "$senha1" | sudo -S apt install python3-multibootusb --only-upgrade -y
    echo "$senha1" | sudo -S apt install -f
fi

echo "$senha1" | sudo -S dpkg --configure -a
echo "$senha1" | sudo -S apt install -f

#Teste Final da Instalação
if [ -x '/usr/bin/multibootusb-pkexec' ]
then
    echo
    echo "The 'MultiBootUSB' tool is installed!"
    echo "`dpkg -s python3-multibootusb | grep ^V --color=never`"
    echo
else
    echo
    echo "The 'MultiBootUSB' tool is not installed!"
    echo
fi

echo
echo
echo "Press 'ENTER' to quit!"
read
exit
