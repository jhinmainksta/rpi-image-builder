#!/bin/bash
ls /usr/local/bin
sleep 5
if [ -f /usr/local/bin/gpio ] ; then
  echo gpio exist;
  exit 0
fi

echo gpio not created

sudo sed -i "s|#dtparam=i2c_arm=on|dtparam=i2c_arm=on|" /boot/firmware/config.txt || { echo unable to fix config.txt; exit 1; }
sudo sh -c "echo enable_uart=1>> /boot/firmware/config.txt" || { echo unable to fix config.txt; exit 1;}
sudo sed -i "s|console=serial0 ||" /boot/firmware/cmdline.txt || { echo unable to fix cmdline.txt; exit 1; }

sudo touch /usr/local/bin/gpio || { echo unable to touch gpio; sleep 2.5; exit 1; }
echo gpio created

echo starting reboot

sudo reboot
exit 0
