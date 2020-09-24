#!/bin/bash
source config.sh

function usage()
{
  cat <<EOF
$(basename $0) Usage:

$(basename $0) ([args])

    -p      RUN FUNCTION RELATED TO PRODUCTION TASKS
    -d      RUN FUNCTION RELATED TO DEV TASKS
EOF
exit 0
}


echo "
============
Declarations
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
cred_file_name=

live_base_domain=
live_vhost_domain=
dev_base_domain=
dev_vhost_domain=

echo "===========>>>>"
if [ -f "${LIVE_PATH}/app/etc/local.xml" ]; then
    magento_version=1
    db_dump_script="mage-dbdump.sh"
    media_dir_loc="/media"
    db_dump_path="$LIVE_PATH"
    db_cred_file_path="${LIVE_PATH}/app/etc/local.xml"
    cred_file_name="local.xml"
elif [ -f "${LIVE_PATH}/app/etc/env.php" ]; then
    magento_version=2
    db_dump_script="mage2-dbdump.sh"
    media_dir_loc="/pub/media"
    db_dump_path="${LIVE_PATH}pub/"
    db_cred_file_path="${LIVE_PATH}/app/etc/env.php"
    cred_file_name="env.php"
else
    echo "Error: Could not detect Magento version"
    exit 1
fi

# prod_db_host="$( awk -F'=>' '/SELINUX=disabled/ { print $2 }' /etc/selinux/config)"
prod_db_host="$( awk '/host/ {print $3}' $db_cred_file_path)"
prod_db_name="$( awk '/dbname/ {print $3}' $db_cred_file_path)"
prod_db_pass="$( awk '/password/ {print $3}' $db_cred_file_path)"
prod_user_name="$( awk '/username/ {print $3}' $db_cred_file_path)"
echo "============>>>>>>>>> OUTPUTS"
echo "prod host = $prod_db_host"
echo "prod user = $prod_user_name"
echo "prod db name = $prod_db_name"
echo "prod db pass = $prod_db_pass"
echo "==============>>>>"
# status="$(service firewalld status | awk '/Active:/ { print $2}')"
# base_domain="$(echo $LIVE_PATH | awk { print $1 })"
# vhost_domain="$(echo $LIVE_PATH | awk  { print $2 })"
live_base_domain="$( echo ${LIVE_PATH} | awk -F'/' '{print $4}')"
live_vhost_domain="$( echo ${LIVE_PATH} | awk -F'/' '{print $6}')"
echo "Live Base Domain : $live_base_domain"
echo "Live vhost Domain: $live_vhost_domain"
echo "Magento version : $magento_version"
echo "DB backup script name : $db_dump_script"
echo "Media directory location : $media_dir_loc"
echo "DB Backup path to locate DB backup : $db_dump_path"
echo "DB credentials file path : $db_cred_file_path"

prod_tasks() {
    echo "===========>>>>"
    echo "======================================================================="
    echo "===============       PRODUCTION TASKS RUNNING        ================="
    echo "======================================================================="
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
}


dev_task() {
    echo "============>>>>>>>>> OUTPUTS"
    echo "Dev host = $BD_HOST"
    echo "Dev user = $USER_NAME"
    echo "Dev db name = $DB_NAME"
    echo "Dev db pass = $DB_PASSWORD"
    echo "==============>>>>"
    echo " -DOMAINS- " 
    dev_base_domain="$( echo ${DEV_PATH} | awk -F'/' '{print $4}')"
    dev_vhost_domain="$( echo ${DEV_PATH} | awk -F'/' '{print $6}')"
    echo "Dev Base Domain : $dev_base_domain"
    echo "Dev vhost Domain: $dev_vhost_domain"
    echo "===================================================================================================="
    echo "=================     DEV ENVIRONMENT SETUP SCRIPT RUNNING............        ======================"
    echo "===================================================================================================="
    ls ${DEV_PATH}
    echo "==========================="
    echo "Changing DB credentials on http/app/etc/env.php File............................................."
    cd ${DEV_PATH}
    ls
    pwd
    echo "Changing DB Creds.....in env.php"
    cat app/etc/${cred_file_name}

    sed -i "s/${prod_db_name}/${DB_NAME_ENV}/gI" app/etc/${cred_file_name}
    sed -i "s/${prod_db_pass}/${DB_PASSWORD_ENV}/gI" app/etc/${cred_file_name}

    cat app/etc/${cred_file_name}

    echo "======================================"
    echo "Restoring DB in another vhost..."
    cd ${DEV_PATH}
    ls
    pwd
    wget http://dev10.tonsoftiles.co.uk/pub/db.sql.gz
    mv db.sql.gz var/
    cd var
    ls | grep db
    cd ..
    pwd
    echo y | ./mage2-dbdump.sh -rz
}

if [[ "$1" == "" ]]; then
  usage
fi

if [[ "$1" == "-p" ]]; then
    prod_tasks
fi

if [[ "$1" == "-d" ]]; then
    dev_task
fi