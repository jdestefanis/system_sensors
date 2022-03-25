#!/bin/bash
# Este script lee el hostname actual del archivo y lo reemplaza por el nuevo
hostname1=$(cat /home/pi/system_sensors/src/settings.yaml | grep hostname | cut -d ":" -f 2)
hostname1=`echo $hostname1 | sed 's/ *$//g'`
hostname1=$(echo $hostname1 | cut -d " " -f1)
#echo "El hostname actual es: $hostname1"
echo Ingrese el nuevo hostname o ip de home assistant
read hostname2
#echo sed -i 's/hostname='$hostname1'/hostname='$hostname2'/g'
echo "Esta seguro de querer cambiar el hostname a $hostname2?"
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
echo Ingrese el nuevo user del server de mqtt de home assistant
read user2
echo "Esta seguro de querer cambiar el user a $user2?"
select yn in "Yes" "No"; do
case $yn in
        Yes ) sudo sed -i 's/user: '$user1'/user: '$user2'/g' /home/pi/system_sensors/src/settings.yaml; echo "El nuevo user es: $user2"; break;;
        No ) exit;;
    esac
done

pass1=$(cat /home/pi/system_sensors/src/settings.yaml | grep password | cut -d ":" -f 2)
pass1=`echo $pass1 | sed 's/ *$//g'`
pass1=$(echo $pass1 | cut -d " " -f1)
#echo "El pass actual es: $pass1"
echo Ingrese el nuevo pass del server de mqtt de home assistant
read pass2
echo "Esta seguro de querer cambiar el password a $pass2?"
select yn in "Yes" "No"; do
case $yn in
        Yes ) sudo sed -i 's/password: '$pass1'/password: '$pass2'/g' /home/pi/system_sensors/src/settings.yaml; echo "El nuevo pass es: $pass2"; break;;
        No ) exit;;
    esac
done

devicename1=$(cat /home/pi/system_sensors/src/settings.yaml | grep deviceName | cut -d ":" -f 2)
devicename1=`echo $devicename1 | sed 's/ *$//g'`
devicename1=$(echo $devicename1 | cut -d " " -f1)
#echo "El pass actual es: $devicename1"
echo Ingrese el nuevo Server Name. Esto es solo como aparecera en Home Assistant.
read devicename2
echo "Esta seguro de querer cambiar el Server Name a $devicename2?"
select yn in "Yes" "No"; do
case $yn in
        Yes ) sudo sed -i 's/deviceName: '$devicename1'/deviceName: '$devicename2'/g' /home/pi/system_sensors/src/settings.yaml; echo "El nuevo server name es: $devicename2"; break;;
        No ) exit;;
    esac
done

sudo bash /home/pi/scripts_javier/mosquitto-hassio-devices.sh
#exit 0
