#!/bin/bash

echo dronelibs started

python3 -V
pip3 -V || { sudo apt-get install -y python3-pip; pip3 -V; }
sudo apt-get remove modemmanager

if ! [ -d drone ]; then
	{ sudo python -m venv /usr/local/bin/drone; echo repo created; }
else
	{ echo repo already exists; exit 0; } 
fi
cd /usr/local/bin/drone/bin

sudo pip show pymavlink || { sudo /usr/local/bin/drone/bin/pip install pymavlink; pip show pymavlink; }
sudo pip show dronekit || { sudo /usr/local/bin/drone/bin/pip install dronekit; pip show dronekit; }
sudo pip show mavproxy || { sudo /usr/local/bin/drone/bin/pip install mavproxy; pip show mavproxy; }

mavproxy.py --master=/dev/ttyS0 --baudrate 57600 --aircraft MyCopter
. ~/.bashrc
