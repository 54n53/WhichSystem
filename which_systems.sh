#!/bin/bash
#https://www.youtube.com/watch?v=WfnAbZlZO64&t=4383s&ab_channel=ElPing%C3%BCinodeMarioLIVE

read -p "Introduce la IP: " ip_victima
ping -c 1 $ip_victima > /dev/null

if [ "$(echo $?)" == "0" ]; then
	echo -e "El host está disponible"
	ttl=$(ping -c 1 $ip_victima | grep "ttl=" | awk '{print $7}' | tr -d "ttl=")
	echo -e "El TTL de la máquina es $ttl"
	if [ $ttl -gt 60 ] && [ $ttl -lt 90 ]; then
		echo -e "La máquina es un Linux, porque su TTL es de $ttl"
	elif [ $ttl -gt 110 ] && [ $ttl -lt 140 ]; then
		echo -e "La máquina es un Windows, porque el TTL es de $ttl"
	else
		echo -e "TTL desconocido, el valor obtenido es $ttl"
fi
else
	echo -e "Hubo un error, vuelve a intentarlo"
fi
