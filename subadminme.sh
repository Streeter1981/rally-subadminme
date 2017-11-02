#!/bin/bash
read -s -p "Password for $MY_USERNAME: " MY_PASSWORD



if [ -z "$1" ]; then
    echo "Usage: subadminme.sh 209"
    exit
fi

SUBSCRIPTION_ID=$1

MY_USERNAME="js_admin@rallydev.com"
INSTALL_DIR="/Users/strjo05/Documents/rally-subadminme-master"

PYTHON="/usr/bin/python"

echo
echo "Subscription Admins for SubID ${SUBSCRIPTION_ID}"
echo "================================================"

${PYTHON} ${INSTALL_DIR}/usage.py -s ${SUBSCRIPTION_ID} -d 1 -u ${MY_USERNAME} -p ${MY_PASSWORD} | \
    awk -F '",' -f ${INSTALL_DIR}/parseUsage.awk | sort

echo
