#!/bin/bash
# Este script lee el hostname actual del archivo y lo reemplaza por el nuevo
hostname1=$(cat /home/pi/system_sensors/src/settings.yaml | grep hostname | cut -d ":" -f 2)
hostname1=`echo $hostname1 | sed 's/ *$//g'`
hostname1=$(echo $hostname1 | cut -d " " -f1)
#echo "El hostname actual es: $hostname1"
echo Ingrese el nuevo hostname o IP Address de Home Assistant: default: homeassistant
read hostname2
echo "El hostname ingresado $hostname2 es correcto?"
select yn in "Yes" "No"; do
case $yn in
        Yes ) sudo sed -i 's/hostname: '$hostname1'/hostname: '$hostname2'/g' /home/pi/system_sensors/src/settings.yaml; echo "El nuevo hostname es: $hostname2"; break;;
        No ) exit;;
    esac
done

user1=$(cat /home/pi/system_sensors/src/settings.yaml | grep user | cut -d ":" -f 2)
user1=`echo $user1 | sed 's/ *$//g'`
user1=$(echo $user1 | cut -d " " -f1)
#echo "El user actual es: $user1"
echo Ingrese el usuario del servidor de mqtt configurado en Home Assistant
read user2
echo "El usuario ingresado $user2 es correcto?"
select yn in "Yes" "No"; do
case $yn in
        Yes ) sudo sed -i 's/user: '$user1'/user: '$user2'/g' /home/pi/system_sensors/src/settings.yaml; echo "El nuevo user es: $user2"; break;;
        No ) exit;;
    esac
done

pass1=$(cat /home/pi/system_sensors/src/settings.yaml | grep password | cut -d ":" -f 2)
pass1=`echo $pass1 | sed 's/ *$//g'`
pass1=$(echo $pass1 | cut -d " " -f1)
echo Ingrese el password del server de mqtt configurado en de Home Assistant
read pass2
echo "El password ingresado $pass2 es correcto?"
select yn in "Yes" "No"; do
case $yn in
        Yes ) sudo sed -i 's/password: '$pass1'/password: '$pass2'/g' /home/pi/system_sensors/src/settings.yaml; echo "El nuevo pass es: $pass2"; break;;
        No ) exit;;
    esac
done

devicename1=$(cat /home/pi/system_sensors/src/settings.yaml | grep deviceName | cut -d ":" -f 2)
devicename1=`echo $devicename1 | sed 's/ *$//g'`
devicename1=$(echo $devicename1 | cut -d " " -f1)
echo Ingrese un nombre de servicio. Este nombre es como Home Assistant lo identificara.
read devicename2
echo "Esta nombre de servicio ingresado $devicename2 es correcto?"
select yn in "Yes" "No"; do
case $yn in
        Yes ) sudo sed -i 's/deviceName: '$devicename1'/deviceName: '$devicename2'/g' /home/pi/system_sensors/src/settings.yaml; echo "El nuevo server name es: $devicename2"; break;;
        No ) exit;;
    esac
done

clientname1=$(cat /home/pi/system_sensors/src/settings.yaml | grep client_id | cut -d ":" -f 2)
clientname1=`echo $clientname1 | sed 's/ *$//g'`
clientname1=$(echo $clientname1 | cut -d " " -f1)
echo Ingrese un nombre para el cliente del servicio. Este puede ser el mismo que el nombre de servicio: $devicename2
read clientname2
echo "Esta nombre de cliente ingresado $clientname2 es correcto?"
select yn in "Yes" "No"; do
case $yn in
        Yes ) sudo sed -i 's/client_id: '$clientname1'/client_id: '$clientname2'/g' /home/pi/system_sensors/src/settings.yaml; echo "El nuevo server name es: $clientname2"; break;;
        No ) exit;;
    esac
done

timezone1=$(cat /home/pi/system_sensors/src/settings.yaml | grep timezone | cut -d ":" -f 2)
timezone1=`echo $timezone1 | sed 's/ *$//g'`
timezone1=$(echo $timezone1 | cut -d " " -f1)
echo Ingrese el Timezone donde resize con el formato: America/Argentina/Buenos_Aires. Para otras zonas clickee aqui: https://www.php.net/manual/es/timezones.php
read timezone2
echo "Esta nombre de cliente ingresado $timezone2 es correcto?"
select yn in "Yes" "No"; do
case $yn in
        Yes ) sudo sed -i 's/timezone: '$timezone1'/timezone: '$timezone2'/g' /home/pi/system_sensors/src/settings.yaml; echo "El nuevo server name es: $timezone2"; break;;
        No ) exit;;
    esac
done

sudo bash /home/pi/scripts_javier/mosquitto-hassio-devices.sh
echo "Configurando el cliente de Mosquitto.... Por favor espere."
