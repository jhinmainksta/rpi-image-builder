#!/bin/bash

pip3 -V || { sudo apt-get install -y python3-pip; pip3 -V; }
sudo apt-get remove modemmanager

if ! [ -d drone ]; then
	python -m venv /home/pi/drone
fi

source drone/bin/activate

pip show pymavlink || { pip3 install pymavlink; pip show pymavlink; }
pip show dronekit || { pip3 install dronekit; pip show dronekit; }
pip show mavproxy || { pip3 install mavproxy; pip showmavproxy; }

mavproxy.py --master=/dev/ttyS0 --baudrate 57600 --aircraft MyCopter
. ~/.bashrc
