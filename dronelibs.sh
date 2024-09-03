#!/bin/bash

if [ -d /usr/drone ] ; then	
	exit 0
fi

python3 -V || sudo apt-get install -y python3
pip3 -V || sudo apt-get install -y python3-pip

sudo python -m venv /usr/drone

sudo /usr/drone/bin/pip install pymavlink
sudo /usr/drone/bin/pip install dronekit
sudo /usr/drone/bin/pip install mavproxy