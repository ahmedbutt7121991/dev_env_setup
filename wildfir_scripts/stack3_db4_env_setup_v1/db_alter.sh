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
echo "========================================================================"
echo "=======================    CHANGING DATABASES URLS   ==================="
echo "========================================================================"
# mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -e "Show databases;"
# mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "select * from ${DB_TABLE};"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://ahmed.tonsoftiles.co.uk/' Where path='web/unsecure/base_url';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://ahmed.tonsoftiles.co.uk/' Where path='web/secure/base_url';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://ahmed.tonsoftiles.co.uk/' Where path='wallfloor/general/wallfloor_url';"
# mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://ahmed.tonsoftiles.co.uk/' Where path='web/secure/base_url';"
# mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://ahmed.tonsoftiles.co.uk/' Where path='web/secure/base_media_url';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://ahmed.tonsoftiles.co.uk/' Where path='tonssystem/general/tons_url';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://ahmed.tonsoftiles.co.uk/' Where path='tonssystem/general/tons_url/(websites store)';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://ahmed.tonsoftiles.co.uk/' Where path='wallfloor/general/wallfloor_url';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://ahmed.tonsoftiles.co.uk/' Where path='tonssystem/general/tons_url';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='' Where path='advanced/modules_disable_output/Mb_Ipconfigurations';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='' Where path='orderprocessing/pallex_api/pallex_soap_url';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='' Where path='sales_email/shipment/copy_to';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='' Where path='sales_email/order/copy_to';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='' Where path='googlemarchant/googlemarchant_general_setting/marchanent_store_id';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='' Where path='googlemarchant/googlemarchant_general_setting/item_google_shopping_id';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='' Where path='microconnect/credentials/user_name';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='' Where path='microconnect/credentials/password';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='test' Where path='payment/sagepayform/mode';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='test' Where path='payment/sagepaydirectpro/mode';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='test' Where path='payment/sagepaypaypal/mode';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='test' Where path='payment/sagepaydirectpro_moto/mode';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='test' Where path='payment/sagepayserver_moto/mode';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='' Where path='algoliasearch_credentials/credentials/application_id';"#'algoliasearch_credentials/credentials/application_id'
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='' Where path='algoliasearch_credentials/credentials/search_only_api_key';"#algoliasearch_credentials/credentials/search_only_api_key
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='' Where path='algoliasearch_credentials/credentials/api_key';"#algoliasearch_credentials/credentials/api_key
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='' Where path='web/cookie/cookie_domain';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='0' Where path='mandrill/general/active';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='1' Where path='orderprocessing/uk_mail_api/sandbox';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='_' Where path='ipconfigurations/general/primary_ip';"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='_' Where path='ipconfigurations/general/secondary_ip';"