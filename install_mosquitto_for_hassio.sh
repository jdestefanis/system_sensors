#!/bin/bash
git clone https://github.com/Sennevds/system_sensors.git /home/pi/system_sensors
#sudo pip3 install -r /home/pi/system_sensors/requirements.txt
sudo apt-get install mosquitto mosquitto-clients
sudo apt-get install python3-apt
sudo cp /home/pi/system_sensors/example_system_sensors.service /etc/systemd/system/system_sensors.service
sudo cp /home/pi/system_sensors/src/settings_example.yaml /home/pi/system_sensors/src/settings.yaml
sudo bash /home/pi/scripts_javier/change-mosquitto-hostname.sh
sudo systemctl enable system_sensors.service
sudo systemctl start system_sensors.service
