#!/bin/bash
file=$1
directory=$2
mounted_point=$3

if [ ! -f $PWD/$file ]; then
  { echo $file ne sushestvuet, kakov pozor; exit 1; }
fi
echo $mounted_point
if [ $mounted_point != "" ]; then
  way=$PWD/$mounted_point/$directory
else
  way=$PWD/$directory
fi
if [ ! -d $way ]; then
  { echo "a kak popast' v $directory? freekus?"; exit 1; }
fi

echo need to move $file file into $directory directory of imager mounter in $mounted_point

mv $file $mounted_point/$directory || { echo "ne poluchilos' zasunut $file v $directory("; exit 1; }
ls $mounted_point/$directory/$file

echo razdacha prav dlya $file

sudo chroot $mounted_point chmod +x $directory/$file

echo plug $file to /etc/rc.local

sudo chroot $mounted_point sh -c "sed -i 's|exit 0|$file|' /etc/rc.local"
sudo chroot $mounted_point sh -c "echo exit 0 >> /etc/rc.local"

exit 0
