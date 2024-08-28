#!/bin/bash

echo dronelibs started

python3 -V
pip3 -V || { sudo apt-get install -y python3-pip; pip3 -V; }
sudo apt-get remove -y modemmanager

if ! [ -d drone ]; then
	{ sudo python -m venv /usr/local/bin/drone; echo repo created; }
else
	echo  repo already exists 
fi

sudo /usr/local/bin/drone/bin/pip install pymavlink
sudo /usr/local/bin/drone/bin/pip install dronekit
sudo /usr/local/bin/drone/bin/pip install mavproxy