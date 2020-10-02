#!/bin/bash

source config.sh

echo "=======>>>    MAIN SCRIPT     <<<======="


# echo "Production db dump"

# time ./prod_db_dump.sh

# echo "Dev db restoring"

# time ./dev_db_restore.sh

# pwd
# echo "Completed db dump and restore process..........."
# echo "waiting ....."
# sleep 10
# echo "BK RM PROD"

# time ./prod_bk_rm.sh

# pwd
# echo "Completed bk remove process..........."

# echo "DB ALTER"

# pwd 
# time ./db_alter.sh

# time bash db_migrate.sh -drute
time bash db_migrate.sh -t