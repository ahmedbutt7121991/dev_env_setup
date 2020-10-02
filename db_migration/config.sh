#!/bin/bash

echo "--------------------------------"
echo "----	DB MIGRATION	------"
echo "----	FROM PROD TO	------"
echo "----	DEVELOPMENT	------"
echo "--------------------------------"


echo "=====>>>  STEP 1  <<<===="
echo "Configuring variables for input"

PRODUCTION_SERVER=www-data@acc.3.magestack.com
PRODUCTION_SERVER_PASS=

DEV_SERVER=www-data@acc.3.magestack.com
DEV_SERVER_PASS=

PROD_DOMAIN_PATH='/microcloud/domains/tondev/domains/dev10.tonsoftiles.co.uk/http/'
DEV_DOMAIN_PATH='/microcloud/domains/tondev/domains/ahmed.tonsoftiles.co.uk/http/'

db_dump_script="mage2-dbdump.sh"
db_dump_path="${PROD_DOMAIN_PATH}pub/"
db_restore_path="${DEV_DOMAIN_PATH}var/"
db_cred_file_path="${DEV_DOMAIN_PATH}app/etc/env.php"
DB_TABLE='core_config_data'
# BD_HOST='db3.i'
# DB_NAME='testa_tons'
# USER_NAME='testa_tons'
# DB_PASSWORD='ad4f2f9a8092c68d55b572d11d8020c3'
# DB_NAME_ENV="'testa_tons',"
# USER_NAME_ENV="'testa_tons',"
# DB_PASSWORD_ENV="'ad4f2f9a8092c68d55b572d11d8020c3',"
# DB_NAME_ENV="'ahmed_tons',"