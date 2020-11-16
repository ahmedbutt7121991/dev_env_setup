#!/bin/bash
source config.sh
# source db_user.sh
# This should be at the top of the script to get the start time of the script
# start=$(date +%s.%N)

echo ".................................."
echo "..........DB CREATION............."
echo ".................................."

# time ./parse_db_data.sh -c

echo "................................."
echo "..........PRODUCTION............."
echo "................................."

# time ./parse_db_data.sh -p

echo "................................."
echo "..........DATA RSYNC............."
echo "................................."
# Here you can place your function
# rsync -zzarvh --exclude={'/pub/media','/pub/static','/var/page_cache','/var/cache','/var/full_page_cache','/var/session','/var/log','/generated'} ${LIVE_PATH} ${DEV_PATH}
# end="$(date +%s.%N)/10000000"
# duration=$(echo "$end - $start")
# execution_time="printf "%.f seconds" $duration"
# rsync -zzarvh --exclude '/pub/media' ${LIVE_PATH} ${DEV_PATH}
# echo "Script Execution Time: $execution_time"
# rsync -zzarvh  ${LIVE_PATH} ${DEV_PATH}
# cp -rvp ${LIVE_PATH} ${DEV_PATH}

echo "................................."
echo "..........PRODUCTION............."
echo "................................."

# time ./parse_db_data.sh -p

echo "................................."
echo "..........DEVELOPMENT............."
echo "................................."

# time ./parse_db_data_qa.sh -d
# time ./parse_db_data_qa1.sh -d
# time ./parse_db_data_qa2.sh -d
# time ./parse_db_data_qa3.sh -d
# time ./parse_db_data_qa4.sh -d
# time ./parse_db_data_qa5.sh -d

echo "..................................."
echo "..........DATABASE_URL............."
echo "..................................."

# time ./parse_db_data_qa.sh -u
# time ./parse_db_data_qa1.sh -u
# time ./parse_db_data_qa2.sh -u
# time ./parse_db_data_qa3.sh -u
# time ./parse_db_data_qa4.sh -u
# time ./parse_db_data_qa5.sh -u

echo "................................................"
echo "..........REMOVING DATABASE BACKUPS............."
echo "................................................"

time ./parse_db_data.sh -r
time ./parse_db_data_qa.sh -r
time ./parse_db_data_qa1.sh -r
time ./parse_db_data_qa2.sh -r
time ./parse_db_data_qa3.sh -r
time ./parse_db_data_qa4.sh -r
time ./parse_db_data_qa5.sh -r

echo ".............................................."
echo "..........ADMIN_PANEL_LOGIN_CREDS............."
echo ".............................................."

# time ./parse_db_data.sh -l

echo "................................"
echo "..........STANDLONE............."
echo "................................"

# time ./parse_db_data.sh -cpdul


echo "..................................."
echo "..........CLEANINGCACHE............"
echo "..................................."
# cd ${QA_PATH}
# php-7.3 bin/magento app:config:import
# php-7.3 bin/magento setup:upgrade
# php-7.3 bin/magento c:f 
# cd ${QA1_PATH}
# php-7.3 bin/magento app:config:import
# php-7.3 bin/magento setup:upgrade
# php-7.3 bin/magento c:f 
# cd ${QA2_PATH}
# php-7.3 bin/magento app:config:import
# php-7.3 bin/magento setup:upgrade
# php-7.3 bin/magento c:f 
# cd ${QA3_PATH}
# php-7.3 bin/magento app:config:import
# php-7.3 bin/magento setup:upgrade
# php-7.3 bin/magento c:f 
# cd ${QA4_PATH}
# php-7.3 bin/magento app:config:import
# php-7.3 bin/magento setup:upgrade
# php-7.3 bin/magento c:f 
# cd ${QA5_PATH}
# php-7.3 bin/magento app:config:import
# php-7.3 bin/magento setup:upgrade
# php-7.3 bin/magento c:f
