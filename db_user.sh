#!/bin/bash
source config.sh

echo "=============================="
echo "Adding a new database and user"
echo "=============================="

ls
pwd
cd /microcloud/scripts_ro/

echo "Checking Command OutPut"

create_db_user.sh -h ${BD_HOST} -u ${TEST_DB_NAME}