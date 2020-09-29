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
<<<<<<< HEAD
rsync -zzarvh --exclude '/pub/media' ${LIVE_PATH} ${DEV_PATH}
=======
# rsync -zzarvh --exclude '/pub/media' ${LIVE_PATH} ${DEV_PATH}
>>>>>>> 6c214fbc94b3fb82f63f6cd7292da61b2b2860eb
# echo "Script Execution Time: $execution_time"

# cp -rvp ${LIVE_PATH} ${DEV_PATH}

echo "................................."
echo "..........PRODUCTION............."
echo "................................."

# time ./parse_db_data.sh -p

echo "................................."
echo "..........DEVELOPMENT............."
echo "................................."

<<<<<<< HEAD
time ./parse_db_data.sh -d
=======
# time ./parse_db_data.sh -d
>>>>>>> 6c214fbc94b3fb82f63f6cd7292da61b2b2860eb

echo "..................................."
echo "..........DATABASE_URL............."
echo "..................................."

<<<<<<< HEAD
time ./parse_db_data.sh -u
=======
# time ./parse_db_data.sh -u
>>>>>>> 6c214fbc94b3fb82f63f6cd7292da61b2b2860eb

echo ".............................................."
echo "..........ADMIN_PANEL_LOGIN_CREDS............."
echo ".............................................."

<<<<<<< HEAD
time ./parse_db_data.sh -l
=======
# time ./parse_db_data.sh -l
>>>>>>> 6c214fbc94b3fb82f63f6cd7292da61b2b2860eb

echo "................................"
echo "..........STANDLONE............."
echo "................................"

# time ./parse_db_data.sh -cpdul


echo "..................................."
echo "..........CLEANINGCACHE............"
echo "..................................."
<<<<<<< HEAD
cd ${DEV_PATH}
php-7.1 bin/magento c:f 
=======
# cd ${DEV_PATH}
# php-7.1 bin/magento c:f 
>>>>>>> 6c214fbc94b3fb82f63f6cd7292da61b2b2860eb
