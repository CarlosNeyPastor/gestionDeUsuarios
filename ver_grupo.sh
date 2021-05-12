##########     VISUALIZAR TODOS LOS GRUPOS     #################

#!/bin/bash		
clear
#######################################################


#Funcion LOG

# Fecha y hora del script, se usa para el log.
DATE=`date +%F`
TIME=`date +%H:%M`

# Rura del fichero de LOG
LOG="/var/log/GestionDeUsuairo_$DATE.log"

echo "Se hab vizualizado los grupos del sistema el día $DATE a las $TIME">>$LOG

#######################################################

echo "NOMBRE DEL GRUPO:CONTRASEÑAENCRIPTADA:GID:LISTA DE USUARIOS"
cat /etc/group | column -tx -s: | more
echo ""
echo "presione ENTER para salir"
sleep 2
