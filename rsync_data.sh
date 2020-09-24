#!/bin/bash
source config.sh

# This should be at the top of the script to get the start time of the script
# start=$(date +%s.%N)
echo "................................."
echo "..........DATA RSYNC............."
echo "................................."
# Here you can place your function
rsync -zzarvh --exclude={'/pub/media','/pub/static','/var/page_cache','/var/cache','/var/full_page_cache','/var/session','/var/log','/generated'} ${LIVE_PATH} ${DEV_PATH}
# end="$(date +%s.%N)/10000000"
# duration=$(echo "$end - $start")
# execution_time="printf "%.f seconds" $duration"

# echo "Script Execution Time: $execution_time"
echo "................................."
echo "..........PRODUCTION............."
echo "................................."

time ./parse_db_data.sh -p

echo "................................."
echo "..........DEVELOPMENT............."
echo "................................."

time ./parse_db_data.sh -d

echo "..................................."
echo "..........DATABASE_URL............."
echo "..................................."

time ./db_alter.sh

echo "..................................."
echo "..........CLEANINGCACHE............"
echo "..................................."
cd ${DEV_PATH}
php-7.1 bin/magento c:f