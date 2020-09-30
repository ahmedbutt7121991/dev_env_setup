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