#!/bin/bash

RED=`tput setaf 1`
VIOLET=`tput setaf 5`

# Make sure only root can run our script
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root!" 1>&2
   exit 1
fi

# Move first
if [ ! -f /usr/share/dbus-1/services/org.kde.kwalletd.service ]; then
    echo "${RED}Service ${VIOLET}/usr/share/dbus-1/services/org.kde.kwalletd.service ${RED}not found!"
else
	mv /usr/share/dbus-1/services/org.kde.kwalletd.service /usr/share/dbus-1/services/org.kde.kwalletd.service.disabled
fi

# Move second
if [ ! -f /usr/share/dbus-1/services/org.kde.kwalletd5.service ]; then
    echo "${RED}Service ${VIOLET}/usr/share/dbus-1/services/org.kde.kwalletd5.service ${RED}not found!"
else
	mv /usr/share/dbus-1/services/org.kde.kwalletd5.service /usr/share/dbus-1/services/org.kde.kwalletd5.service.disabled
fi
