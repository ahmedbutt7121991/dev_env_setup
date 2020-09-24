#!/bin/bash
source config.sh

# BD_HOST='db3.i'
# DB_NAME='ahmed_tons'
# USER_NAME='ahmed_tons'
# DB_PASSWORD='LzuGP9wzBhOsPDry'
# ITEM_1='value'
# VAL=http://ahmed.tonsoftiles.co.uk/
#Testing
#mysql -h db3.i -u ahmed_tons -pLzuGP9wzBhOsPDry -D ahmed_tons -e "Update core_config_data set value='http://ahmed.tonsoftiles.co.uk/' Where config_id=2;"
echo "==================================================================================="
echo "==================================    SHOWING DATABASES   ========================="
echo "==================================================================================="
# mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -e "Show databases;"
# mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "select * from ${DB_TABLE};"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://ahmed.tonsoftiles.co.uk/' Where path='web/unsecure/base_url';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://ahmed.tonsoftiles.co.uk/' Where path='web/unsecure/base_media_url';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://ahmed.tonsoftiles.co.uk/' Where path='web/unsecure/base_link_url';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://ahmed.tonsoftiles.co.uk/' Where path='web/secure/base_url';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://ahmed.tonsoftiles.co.uk/' Where path='web/secure/base_media_url';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://ahmed.tonsoftiles.co.uk/' Where path='web/secure/base_link_url';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://ahmed.tonsoftiles.co.uk/' Where path='tm_integrations/general/tm_url';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://ahmed.tonsoftiles.co.uk/' Where path='wallfloor/general/wallfloor_url';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://ahmed.tonsoftiles.co.uk/' Where path='tonssystem/general/tons_url';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='NULL' Where path='advanced/modules_disable_output/Mb_Ipconfigurations';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='NULL' Where path='mb_microconnect/credentials/password';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='NULL' Where path='mb_microconnect/credentials/user_name';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='NULL' Where path='payment/paysafe_general/shop_url';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='NULL' Where path='algoliasearch_credentials/credentials/application_id';"#'algoliasearch_credentials/credentials/application_id'
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='NULL' Where path='algoliasearch_credentials/credentials/search_only_api_key';"#algoliasearch_credentials/credentials/search_only_api_key
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='NULL' Where path='algoliasearch_credentials/credentials/api_key';"#algoliasearch_credentials/credentials/api_key
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='NULL' Where path='web/cookie/cookie_domain';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='0' Where path='mbordertracking/pallex_tracker/enable';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='_' Where path='ipconfigurations/general/primary_ip';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='_' Where path='ipconfigurations/general/secondary_ip';"