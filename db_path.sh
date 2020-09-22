#!/bin/bash
echo "==========================================="
echo "==========================================="
echo "===This Script is for Creating a DB Dump==="
echo "==========================================="
echo "==========================================="
EXCLUDE_LIST="--exclude=/var/cache \
              --exclude=/var/full_page_cache \
              --exclude=/var/session \
              --exclude=/var/log \
              --exclude=/var/backup \
              --exclude=/var/import \
              --exclude=/var/export \
              --exclude=/var/report \
              --exclude=/var/locks \
              --exclude=/includes/src \
              --exclude=/includes/config.php \
              --exclude=/var/page_cache \
              --exclude=/pub/media \
              --exclude=/pub/static \
              --exclude=/var/cache"
echo "================"
echo "Copy from Dev10 domain to Ahmed Domain............................................."
# rsync -zzarvh --exclude={'/pub/media','/pub/static','/var/page_cache','/var/cache','/var/full_page_cache','/var/session','/var/log','/var/backup','/var/import','/var/export','/var/locks','/var/report','/includes/src','/includes/config.php'} /microcloud/domains/tondev/domains/dev10.tonsoftiles.co.uk/http/ /microcloud/domains/tondev/domains/ahmed.tonsoftiles.co.uk/http/

ls /microcloud/domains/tondev/domains/ahmed.tonsoftiles.co.uk/http/


echo "*** SSH into Prod Source Server ***"
echo "================"
echo "Home dir Listing............................................."
pwd	

cd /microcloud/domains/tondev/domains/dev10.tonsoftiles.co.uk/http/
echo "==========================="
echo "Script location dir Listing............................................."
pwd

echo "**** Creating DB dump using mage2 Script ****"

./mage2-dbdump.sh -dz
cd var
ls | grep db

mv db.sql.gz ../pub/

echo "==========================="
echo "Changing DB credentials on http/app/etc/env.php File............................................."
cd /microcloud/domains/tondev/domains/ahmed.tonsoftiles.co.uk/http/
ls
pwd
echo "Changing DB Creds.....in env.php"
cat app/etc/env.php
sed -i 's/tons_dev10/ahmed_tons/gI' app/etc/env.php
sed -i 's/d386aecd9623b685a6e9cfb3f2c8577f/LzuGP9wzBhOsPDry/gI' app/etc/env.php
cat app/etc/env.php

echo "======================================"
echo "Restoring DB in another vhost..."
cd /microcloud/domains/tondev/domains/ahmed.tonsoftiles.co.uk/http/
ls
pwd
wget http://dev10.tonsoftiles.co.uk/pub/db.sql.gz
mv db.sql.gz var/
echo y | ./mage2-dbdump.sh -rz

echo "======================================"
echo "REplacing URL ..............."
# curl -X POST -F 'value=$URL' http://ahmed.tonsoftiles.co.uk/mage2.php

