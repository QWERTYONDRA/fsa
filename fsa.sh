#!/bin/bash

###################################################
#  Radek - sledovani obsazenosti disku
#  fsa - zkratka Free space alert
#  fsa.conf   konfiguracni soubor tohoto skriptu
###################################################


###################################################
#   Nacteni parametru z konfigura4n9ho souboru
#   Radeji pouziji bez komplikaci awk nez cut -d' ' -f 3

DISK=`cat ./fsa.conf | grep '%disk%' | awk '{print $2}'`
LIMIT=`cat ./fsa.conf | grep '%limit%' |  awk '{print $2}'`
CAS=`cat ./fsa.conf | grep '%cas%' | awk '{print $2}'`
LOGFILE=`cat ./fsa.conf | grep '%logfile%' | awk '{print $2}'`

####################################################
#        lze zjednodušit
# awk '$1=="%limit%" {print $2}' fsa.conf 


###################################################
#   Kontrolni vystup
#echo -e "$DISK\t$LIMIT\t$CAS\t$LOGFILE"

###################################################
#   Zjisteni aktualniho zaplneni disku df

VYUZITO=`df | grep $DISK | awk '{print $5}'`

#VYUZITO=`echo $VYUZITO | rev | cut -c2- | rev`   # Odstraneni %
VYUZITO=`echo $VYUZITO | awk '{print substr($0, 1, length($0)-1) }'`   # Odstraneni %
#echo -e "$DISK\t$KAPACITA\t$VYUZITO\t$CAS\t$LOGFILE"                   #-e dělá lomítka a " dělají proměnné$


#
