#!/bin/bash

source config.sh

echo "=======>>>    MAIN SCRIPT     <<<======="


echo "Production db dump"

time ./prod_db_dump.sh

echo "Dev db restoring"

time ./dev_db_restore.sh

pwd
echo "Completed db dump and restore process..........."