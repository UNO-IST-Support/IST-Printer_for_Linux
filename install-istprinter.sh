#!/bin/bash

if [ "$EUID" -ne 0 ]
then echo "Please run as sudo/root."
	exit
fi

systemctl disable --now avahi-daemon
wget -P ~/Desktop/ https://github.com/UNO-IST-Support/ISTPrinter_for_Linux/raw/master/KMbeuUXv1_17_multi_language.tar.gz
apt install smbclient
apt install cups
echo "#################################################################################"
echo "When the next thing pops up, make sure to install the KMbeuC754ux.ppd. Space will unselect, enter is continue."
echo "#################################################################################"
sleep 10s
tar -xvzf ~/Desktop/KMbeuUXv1_17_multi_language.tar.gz -C ~/Desktop/
~/Desktop/KMbeuUXv1_17_multi_language/install.pl
/etc/init.d/cups restart
echo "#################################################################################"
echo "The next step will require more user input. You will need to click the dropdown for network printers, select add, and choose Windows Printer via SAMBA."
echo "In the SMB Printer field, type 'printers.ist.unomaha.edu/ISTPrinter' without the quotes."
echo "In the user field, you will put your UNO NetID (example is if your NetID is jsmith, you will enter UNOMAHA\\jsmith)"
echo "In the password field, put your UNO NetID Password. then click forward"
echo "After that, you will choose 'Provide .ppd file' and go to the directory with the extracted tar.gz. Select KMbeu754ux.ppd and continue."
echo "In the next window, There is a few dropdown boxes. Find 'Finisher'. Change this to FS-535"
echo "Find the box labelled 'Punch Z-Fold' and change it to PK-521 (2/3 Hole) and click OK"
echo "Change the printer names and description to 'ISTPrinter' and click apply."
echo "This is paused for 20 seconds to give time to read. You can also get the instructions on the Github Repository: "
echo "https://github.com/UNO-IST-Support/ISTPrinter_for_Linux"
echo "#################################################################################"
sleep 20s
system-config-printer
rm ~/Desktop/KMbeuUXv1_17_multi_language.tar.gz
rm -r ~/Desktop/KMbeuUXv1_17_multi_language/
