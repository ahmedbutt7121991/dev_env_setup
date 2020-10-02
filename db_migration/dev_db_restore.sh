#!/bin/bash

source config.sh

echo "========================"
echo "====  RESTORING DB  ===="
echo "========================"

echo "==sshing Development server=="

dev_tasks() {
    echo "===================================================================================================="
    echo "=================     DEV ENVIRONMENT SETUP SCRIPT RUNNING............        ======================"
    echo "===================================================================================================="
    # ssh ${DEV_SERVER} "pwd;
    pwd
    echo "======================================"
    echo \"Restoring DB in another vhost...\"
    cd ${DEV_DOMAIN_PATH}
    ls -ltrh
    pwd
    wget http://dev10.tonsoftiles.co.uk/pub/db.sql.gz
    ls -ltrh | grep db
    pwd
    mv db.sql.gz ${db_restore_path}
    cd ${db_restore_path}
    pwd
    ls -ltrh | grep db
    # exit"
    pwd
    cd ..
    pwd
    echo y | bash ${db_dump_script} -rz
    pwd
    sleep 10
    exit
}

dev_tasks