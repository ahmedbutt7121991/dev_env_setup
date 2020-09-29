#!/bin/bash
source config.sh

echo "================================"
echo "Creating a new database and user"
echo "================================"
DEV_DB_PASS_NEW=
ls
pwd
cd /microcloud/scripts_ro/
domain_env_path="/microcloud/domains/tondev/domains/testing.tonsoftiles.co.uk/tondev_env_setup"
echo "Checking Command OutPut"
echo "Dev DB creation and password"
create_db_user.sh -h ${BD_HOST} -u ${DB_NAME} | tee ${domain_env_path}/dbcreds
cd ${domain_env_path}
cat dbcreds 
DEV_DB_PASS_NEW="$( awk '/Password/ {print $3}' dbcreds)"
echo "======================================="
echo "dev db pass new : ${DEV_DB_PASS_NEW}"
echo "======================================="
DB_PASSWORD="${DEV_DB_PASS_NEW}"
echo "======================================="
DB_PASSWORD_ENV="'${DEV_DB_PASS_NEW}',"
echo "======================================="
echo "${DB_PASSWORD}"
echo "======================================="
echo "${DB_PASSWORD_ENV}"
echo "======================================="