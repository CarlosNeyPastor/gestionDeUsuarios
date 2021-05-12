##############     MODIFICAR NOMBRE      ###################
	
#!/bin/bash


#######################################################


#Funcion no vacio

novacio(){
while [ true ]
do
	echo -n "Ingrese el nombre a modificar:"
	read old

if [ -z $old ]; then 
	echo -n "No se permiten campos vacios"
	sleep 1 
	clear
		else
		break
fi
done
}
############################################################
#Funcion n vacio

novacio2(){
while [ true ]
do
	echo -n "Ingrese el nuevo nombre: "
	read new

if [ -z $new ]; then 
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
echo "..:MODIFICAR NOMBRE:.."
echo " "
novacio 
echo " "
aux=$(grep -w "$old" /etc/passwd)
if [ -z $aux ]
	then
		echo " "
		echo "No se puede realizar, el usuario no existe"
		sleep 2	
	else
		echo " "
		novacio2
		aux=$(grep -w "$new" /etc/passwd)
		if [ -z $aux ]
			then
				echo " "
				echo "Modificando Nombres"
				sleep 3				
				usermod -l $new $old
				log
				echo "El nombre del usuario $old ha sido cambiado por $new"
				sleep 2
			else
				echo " "
				echo "No se pude realizar, el usuario ya existe"
				sleep 2
		fi
fi

#######################################################


#Funcion LOG

# Fecha y hora del script, se usa para el log.
DATE=`date +%F`
TIME=`date +%H:%M`

# Rura del fichero de LOG
LOG="/var/log/GestionDeUsuairo_$DATE.log"

echo "Se modifico el nombre del usuario $old a $new el día $DATE a las $TIME">>$LOG

