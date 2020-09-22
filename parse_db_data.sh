#!/bin/bash
source config.sh

echo "
============
Data PARSING
============
"

prod_db_host=
prod_user_name=
prod_db_name=
prod_db_pass=

magento_version=
db_dump_script=
media_dir_loc=
db_dump_path=
db_cred_file_path=

base_domain=
vhost_domain=

echo "===========>>>>"
if [ -f "${LIVE_PATH}/app/etc/local.xml" ]; then
     magento_version=1
     db_dump_script="mage-dbdump.sh"
     media_dir_loc="/media"
     db_dump_path="$LIVE_PATH"
     db_cred_file_path="${LIVE_PATH}/app/etc/local.xml"
elif [ -f "${LIVE_PATH}/app/etc/env.php" ]; then
     magento_version=2
     db_dump_script="mage2-dbdump.sh"
     media_dir_loc="/pub/media"
     db_dump_path="${LIVE_PATH}pub/"
     db_cred_file_path="${LIVE_PATH}/app/etc/env.php"
else
    echo "Error: Could not detect Magento version"
    exit 1
fi

echo "===========>>>>"
# prod_db_host="$( awk -F'=>' '/SELINUX=disabled/ { print $2 }' /etc/selinux/config)"
prod_db_host="$( awk '/host/ {print $3}' $db_cred_file_path)"
prod_db_name="$( awk '/dbname/ {print $3}' $db_cred_file_path)"
prod_db_pass="$( awk '/password/ {print $3}' $db_cred_file_path)"
prod_user_name="$( awk '/username/ {print $3}' $db_cred_file_path)"



echo "==============>>>>"
# status="$(service firewalld status | awk '/Active:/ { print $2}')"
# base_domain="$(echo $LIVE_PATH | awk { print $1 })"
# vhost_domain="$(echo $LIVE_PATH | awk  { print $2 })"
base_domain="$( echo ${LIVE_PATH} | awk -F'/' '{print $4}')"
vhost_domain="$( echo ${LIVE_PATH} | awk -F'/' '{print $6}')"

echo "============>>>>>>>>> OUTPUTS"
echo "prod host = $prod_db_host"
echo "prod user = $prod_user_name"
echo "prod db name = $prod_db_name"
echo "prod db pass = $prod_db_pass"

echo "$BD_HOST - $DB_NAME - $USER_NAME - $DB_PASSWORD" 

echo "Magento version : $magento_version"
echo "DB backup script name : $db_dump_script"
echo "Media directory location : $media_dir_loc"
echo "DB Backup path to locate DB backup : $db_dump_path"
echo "DB credentials file path : $db_cred_file_path"

echo "Base Domain : $base_domain"
echo "vhost Domain: $vhost_domain"

echo "===================================================================================================="
echo "=================     DEV ENVIRONMENT SETUP SCRIPT RUNNING............        ======================"
echo "===================================================================================================="
ls ${DEV_PATH}


echo "*** SSH into Prod Source Server ***"
echo "================"
echo "Home dir Listing............................................."
pwd	

cd ${LIVE_PATH}
echo "==========================="
echo "Script location dir Listing............................................."
pwd

echo "**** Creating DB dump using mage2 Script ****"

./${db_dump_script} -dz
cd var
ls | grep db

mv db.sql.gz ${db_dump_path}
cd ${db_dump_path}
ls ${db_dump_path}

echo "==========================="
echo "Changing DB credentials on http/app/etc/env.php File............................................."
cd ${DEV_PATH}
ls
pwd
echo "Changing DB Creds.....in env.php"
cat app/etc/env.php
sed -i "s/ahmed_tonsss/${DB_NAME}/gI" app/etc/env.php
sed -i "s/abcdefghijklmnopqrstuvwxyz/${DB_PASSWORD}/gI" app/etc/env.php
cat app/etc/env.php

echo "======================================"
echo "Restoring DB in another vhost..."
cd ${DEV_PATH}
ls
pwd
wget http://dev10.tonsoftiles.co.uk/pub/db.sql.gz
mv db.sql.gz var/
cd var
ls | grep db
