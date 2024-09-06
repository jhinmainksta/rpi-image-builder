#!/bin/bash
ls /usr/local/bin
sleep 5
if [ -f /usr/local/bin/gpio ] ; then
  echo gpio exist;
  for num in 1 2 3 4 5
  do
    sleep 0.5;
    echo $num
  done
  exit 0
fi

echo gpio not created
for num in 1 2 3 4 5
do
  sleep 0.5;
  echo $num
done

sudo sed -i "s|#dtparam=i2c_arm=on|dtparam=i2c_arm=on|" /boot/firmware/config.txt || { echo unable to fix config.txt; exit 1; }
sudo sh -c "echo enable_uart=1>> /boot/firmware/config.txt" || { echo unable to fix config.txt; exit 1;}

sudo touch /usr/local/bin/gpio || { echo unable to touch gpio; sleep 2.5; exit 1; }
echo gpio created

for num in 1 2 3 
do
  sleep 0.5;
  echo $num
done

echo starting reboot

for num in 4 5 
do 
  sleep 0.5;
  echo $num
done

sudo reboot
exit 0
