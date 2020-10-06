#!/bin/bash
source config.sh

function usage()
{
  cat <<EOF
$(basename $0) Usage:

$(basename $0) ([args])
    -c      Create DB and USER
    -p      RUN FUNCTION RELATED TO PRODUCTION TASKS
    -d      RUN FUNCTION RELATED TO DEV TASKS
    -u      UPDATE URL IN DATA BASE
    -l      CREATE ADMIN PANEL LOGIN CREDENTIALS
    -cpdul   CREATE DB- TAKE DB DUMP - RESTORE DB IN DEV - UPDATE URLs - CREATE ADMIN PANEL LOGIN CREDS
EOF
exit 0
}


echo "
============
Declarations
============
"

prod_db_host=
prod_user_name=
prod_db_name=
prod_db_pass=

magento_version=
db_dump_script=
media_dir_loc=
db_dump_path=
db_cred_file_path=
cred_file_name=

live_base_domain=
live_vhost_domain=
dev_base_domain=
dev_vhost_domain=

echo "===========>>>>"
if [ -f "${LIVE_PATH}/app/etc/local.xml" ]; then
    magento_version=1
    db_dump_script="mage-dbdump.sh"
    media_dir_loc="/media"
    db_dump_path="$LIVE_PATH"
    db_cred_file_path="${LIVE_PATH}/app/etc/local.xml"
    cred_file_name="local.xml"
elif [ -f "${LIVE_PATH}/app/etc/env.php" ]; then
    magento_version=2
    db_dump_script="mage2-dbdump.sh"
    media_dir_loc="/pub/media"
    db_dump_path="${LIVE_PATH}pub/"
    db_cred_file_path="${LIVE_PATH}/app/etc/env.php"
    cred_file_name="env.php"
else
    echo "Error: Could not detect Magento version"
    exit 1
fi

# prod_db_host="$( awk -F'=>' '/SELINUX=disabled/ { print $2 }' /etc/selinux/config)"
prod_db_host="$( awk '/host/ {print $3}' $db_cred_file_path)"
prod_db_name="$( awk '/dbname/ {print $3}' $db_cred_file_path)"
prod_db_pass="$( awk '/password/ {print $3}' $db_cred_file_path)"
prod_user_name="$( awk '/username/ {print $3}' $db_cred_file_path)"
echo "============>>>>>>>>> OUTPUTS"
echo "prod host = $prod_db_host"
echo "prod user = $prod_user_name"
echo "prod db name = $prod_db_name"
echo "prod db pass = $prod_db_pass"
echo "==============>>>>"
# status="$(service firewalld status | awk '/Active:/ { print $2}')"
# base_domain="$(echo $LIVE_PATH | awk { print $1 })"
# vhost_domain="$(echo $LIVE_PATH | awk  { print $2 })"
live_base_domain="$( echo ${LIVE_PATH} | awk -F'/' '{print $4}')"
live_vhost_domain="$( echo ${LIVE_PATH} | awk -F'/' '{print $6}')"
echo "Live Base Domain : $live_base_domain"
echo "Live vhost Domain: $live_vhost_domain"
echo "Magento version : $magento_version"
echo "DB backup script name : $db_dump_script"
echo "Media directory location : $media_dir_loc"
echo "DB Backup path to locate DB backup : $db_dump_path"
echo "DB credentials file path : $db_cred_file_path"

db_creater(){

echo "=============================="
echo "Creating a new database and user"
echo "=============================="
DEV_DB_PASS_NEW=
ls
pwd
cd /microcloud/scripts_ro/
domain_env_path="/microcloud/domains/wholes/domains/mwhole.wallsandfloors.co.uk/dev_env_setup/sample_env_setup_v2"####################################
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
}

prod_tasks() {
    echo "===========>>>>"
    echo "======================================================================="
    echo "===============       PRODUCTION TASKS RUNNING        ================="
    echo "======================================================================="
    echo "Home dir Listing............................................."
    pwd	
    cd ${LIVE_PATH}
    echo "==========================="
    echo "Script location dir Listing............................................."
    pwd

    echo "**** Creating DB dump using mage2 Script ****"

    bash ${db_dump_script} -dz
    cd var
    ls | grep db

    # mv db.sql.gz ${db_dump_path}
    # cd ${db_dump_path}
    # ls ${db_dump_path}
}


dev_task() {
    echo "============>>>>>>>>> OUTPUTS"
    echo "Dev host = $BD_HOST"
    echo "Dev user = $USER_NAME"
    echo "Dev db name = $DB_NAME"
    echo "Dev db pass = $DB_PASSWORD"
    echo "==============>>>>"
    echo " -DOMAINS- " 
    dev_base_domain="$( echo ${DEV_PATH} | awk -F'/' '{print $4}')"
    dev_vhost_domain="$( echo ${DEV_PATH} | awk -F'/' '{print $6}')"
    echo "Dev Base Domain : $dev_base_domain"
    echo "Dev vhost Domain: $dev_vhost_domain"
    echo "===================================================================================================="
    echo "=================     DEV ENVIRONMENT SETUP SCRIPT RUNNING............        ======================"
    echo "===================================================================================================="
    ls ${DEV_PATH}
    echo "==========================="
    echo "Changing DB credentials on http/app/etc/env.php File............................................."
    cd ${DEV_PATH}
    ls
    pwd
    echo "Changing DB Creds.....in env.php"
    cat app/etc/${cred_file_name}

    sed -i "s/${prod_db_name}/${DB_NAME_ENV}/gI" app/etc/${cred_file_name}
    sed -i "s/${prod_db_pass}/${DB_PASSWORD_ENV}/gI" app/etc/${cred_file_name}

    cat app/etc/${cred_file_name}

    echo "======================================"
    echo "Restoring DB in another vhost..."
    cd ${DEV_PATH}
    ls
    pwd

    echo "======================================="
    # echo "=====>>>>>>  Running::: php-7.1 bin/magento setup:di:compile      <<<<<====="

    # php-7.1 bin/magento setup:di:compile
    # php-7.1 bin/magento setup:upgrade
    # php-7.1 bin/magento c:f

    # echo "Downloading Data base: wget http://mwhole.wallsandfloors.co.uk/pub/db.sql.gz"

    # wget http://mwhole.wallsandfloors.co.uk/pub/db.sql.gz
    # mv db.sql.gz var/
    cd var
    ls | grep db

    if [ -e "db.sql.gz" ]
    then
        cd ..
        pwd
        echo y | bash mage2-dbdump.sh -rz
    else
        echo "Downloading Data base: wget http://mwhole.wallsandfloors.co.uk/pub/db.sql.gz"
        wget http://mwhole.wallsandfloors.co.uk/pub/db.sql.gz
        # mv db.sql.gz var/
        cd ..
        pwd
        echo y | bash mage2-dbdump.sh -rz
    fi
}

db_update(){
echo "========================================================================"
echo "=======================    UPDATING DATABASES URLS   ==================="
echo "========================================================================"
# mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -e "Show databases;"
# mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "select * from ${DB_TABLE};"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://hwhole.wallsandfloors.co.uk/' Where path='web/unsecure/base_url';"
# mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://hwhole.wallsandfloors.co.uk/' Where path='web/unsecure/base_media_url';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://hwhole.wallsandfloors.co.uk/' Where path='web/unsecure/base_link_url';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://hwhole.wallsandfloors.co.uk/' Where path='web/secure/base_url';"
# mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://hwhole.wallsandfloors.co.uk/' Where path='web/secure/base_media_url';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://hwhole.wallsandfloors.co.uk/' Where path='web/secure/base_link_url';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://hwhole.wallsandfloors.co.uk/' Where path='tm_integrations/general/tm_url';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://hwhole.wallsandfloors.co.uk/' Where path='wallfloor/general/wallfloor_url';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://hwhole.wallsandfloors.co.uk/' Where path='tonssystem/general/tons_url';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='' Where path='advanced/modules_disable_output/Mb_Ipconfigurations';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='' Where path='mb_microconnect/credentials/password';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='' Where path='mb_microconnect/credentials/user_name';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='' Where path='payment/paysafe_general/shop_url';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='' Where path='algoliasearch_credentials/credentials/application_id';"#'algoliasearch_credentials/credentials/application_id'
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='' Where path='algoliasearch_credentials/credentials/search_only_api_key';"#algoliasearch_credentials/credentials/search_only_api_key
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='' Where path='algoliasearch_credentials/credentials/api_key';"#algoliasearch_credentials/credentials/api_key
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='' Where path='web/cookie/cookie_domain';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='0' Where path='mbordertracking/pallex_tracker/enable';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='_' Where path='ipconfigurations/general/primary_ip';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='_' Where path='ipconfigurations/general/secondary_ip';"
}

admin_panel_login_creds(){
echo "=================================================================="
echo "=======================    ADMIN PANEL CREDS   ==================="
echo "=================================================================="
cd ${DEV_PATH}
admin_pass="${DB_NAME}@123"
php-7.1 bin/magento admin:user:create --admin-user=${DB_NAME} --admin-password=${admin_pass} --admin-email=ahmed.butt@ki5.co.uk --admin-firstname=${DB_NAME} --admin-lastname=${live_base_domain}

echo "ADMIN PANEL USERNAME:     ${DB_NAME}"
echo "ADMIN PANEL PASSWORD:     ${admin_pass}"
}


if [[ "$1" == "" ]]; then
  usage
fi

if [[ "$1" == "-c" ]]; then
    db_creater
fi

if [[ "$1" == "-p" ]]; then
    prod_tasks
fi

if [[ "$1" == "-d" ]]; then
    dev_task
fi

if [[ "$1" == "-u" ]]; then
    db_update
fi

if [[ "$1" == "-l" ]]; then
    admin_panel_login_creds
fi

if [[ "$1" == "-cpdul" ]]; then
    db_creater
    prod_tasks
    dev_task
    db_update
    admin_panel_login_creds
fi