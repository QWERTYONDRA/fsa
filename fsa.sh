#!/bin/bash

#####################
# Honus
# fsa = Free Space alert
# fsa.conf - config file
#####################


######
# Nacteni parametru z conf

DISK=`cat ./fsa.conf | grep '%disk%' | awk '{print $2}'`
LIMIT=`cat ./fsa.conf | grep '%limit%' | awk '{print $2}'`
CAS=`cat ./fsa.conf | grep '%cas%' | awk '{print $2}'`
LOGFILE=`cat ./fsa.conf | grep '%logfile%' | awk '{print $2}'`
