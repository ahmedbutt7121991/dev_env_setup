#!/bin/bash

source config.sh

echo "======================"
echo "====  DUMPING DB  ===="
echo "======================"
# echo "DUMPING SCRIPT::::::  ${db_dump_script}"
echo "==sshing production server=="


prod_tasks() {
    echo "===========>>>>"
    echo "======================================================================="
    echo "===============       PRODUCTION TASKS RUNNING        ================="
    echo "======================================================================="

    ssh ${PRODUCTION_SERVER} "pwd;
    cd ${PROD_DOMAIN_PATH};
    echo \"Script location dir Listing.............................................\";
    ls -ltrh;
    echo \"**** Creating DB dump using mage2 Script ****\";
    bash ${db_dump_script} -dz;
    cd var;
    ls -ltrh | grep db;
    mv db.sql.gz ${db_dump_path};
    cd ${db_dump_path};ls -ltrh ${db_dump_path};
    exit"
    pwd
    # echo "Home dir Listing............................................."
    # pwd	
    # cd ${PROD_DOMAIN_PATH}
    # echo "==========================="
    # echo "Script location dir Listing............................................."
    # pwd

    # echo "**** Creating DB dump using mage2 Script ****"

    # bash ${db_dump_script} -dz
    # cd var
    # ls | grep db

    # mv db.sql.gz ${db_dump_path}
    # cd ${db_dump_path}
    # ls ${db_dump_path}
}

prod_tasks