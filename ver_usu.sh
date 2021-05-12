##############   VISUALIZAR TODOS LOS USUARIOS  ####################
 
#!/bin/bash
clear	


#######################################################


#Funcion LOG

# Fecha y hora del script, se usa para el log.
DATE=`date +%F`
TIME=`date +%H:%M`

# Rura del fichero de LOG
LOG="/var/log/GestionDeUsuairo_$DATE.log"

echo "Se visualizo la lista de usuarios el día $DATE a las $TIME">>$LOG

#######################################################


echo "NOMBRE DE USUARIO:x:UID:GID:COMENTARIO:HOME DE TRABAJO:INTERPRETE"
echo " "
cat /etc/passwd | column -tx -s: | more
echo "Presione ENTER para salir"
sleep 2

