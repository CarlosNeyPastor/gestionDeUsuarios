################     DESBLOQUEAR  USUARIO    ####################

#!/bin/bash


#######################################################


#Funcion LOG

# Fecha y hora del script, se usa para el log.
DATE=`date +%F`
TIME=`date +%H:%M`

# Rura del fichero de LOG
LOG="/var/log/GestionDeUsuairo_$DATE.log"

echo "Se ha desbloqueado el usuario $nom el día $DATE a las $TIME">>$LOG

#######################################################



#Funcon no vacio

novacio(){
while [ true ]
do
	echo -n "Ingrese el nombre a desbloquear:"
	read nom

if [ -z $nom ]; then 
	echo -n "No se permiten campos vacios"
	sleep 1 
	clear
		else
		break
fi
done
}
############################################################
clear
echo "..:DESBLOQUEAR USUARIO:.."
echo 
y=0
while [[ $y == "0" ]]
	do
	echo " "
	novacio
	aux=$(grep -w "$nom" /etc/passwd)
	if [ -z $aux ]
		then
			echo " "
			echo "No se puede realizar, el usuario no existe"
			y=0
			echo "Presione ENTER para salir"
			sleep 3
		else
			echo "Procesando datos"
			sleep 2
			y=1
			usermod -U $nom
			log
			echo " Usuario $nom Desbloqueado"
			sleep 3
		
	fi
done
		

