#!/bin/bash

source config.sh

echo "======================"
echo  "====  RM DB BK  ===="
echo "======================"
echo "==sshing production server=="


db_bk_rm() {
    echo "===========>>>>"
    echo "======================================================================="
    echo "===============       PRODUCTION TASKS RUNNING        ================="
    echo "======================================================================="

    ssh ${PRODUCTION_SERVER} "pwd;
    cd ${PROD_DOMAIN_PATH};
    echo \"Script location dir Listing.............................................\";
    ls -ltrh;
    echo \"Checking db bk in domain root...........................................\";
    ls -ltrh | grep db;
    cd var;
    pwd;
    echo \"Checking db bk in domain root/var dir...................................\";
    ls -ltrh | grep db;
    cd ../pub;
    pwd;
    echo \"Checking db bk in domain root/pub dir...................................\";
    ls -ltrh | grep db;
    echo \"Removing db bk in domain root/pub dir...................................\";
    rm -rf db.sql.gz;
    echo \"Checking after removing db bk in domain root/pub dir....................\";
    ls -ltrh | grep db;
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

db_bk_rm