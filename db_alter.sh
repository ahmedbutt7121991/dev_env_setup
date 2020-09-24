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
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://ahmed.tonsoftiles.co.uk/' Where config_id=2;"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://ahmed.tonsoftiles.co.uk/' Where config_id=517;"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://ahmed.tonsoftiles.co.uk/' Where config_id=518;"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://ahmed.tonsoftiles.co.uk/' Where config_id=520;"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://ahmed.tonsoftiles.co.uk/' Where config_id=2283;"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://ahmed.tonsoftiles.co.uk/' Where config_id=2310;"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://ahmed.tonsoftiles.co.uk/' Where config_id=2312;"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://ahmed.tonsoftiles.co.uk/' Where config_id=2313;"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://ahmed.tonsoftiles.co.uk/' Where config_id=2324;"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://ahmed.tonsoftiles.co.uk/' Where config_id=2325;"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://ahmed.tonsoftiles.co.uk/' Where config_id=2326;"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://ahmed.tonsoftiles.co.uk/' Where config_id=2314;"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://ahmed.tonsoftiles.co.uk/' Where config_id=2311;"
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='NULL' Where config_id=1408;"#'algoliasearch_credentials/credentials/application_id'
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='NULL' Where config_id=1409;"#algoliasearch_credentials/credentials/search_only_api_key
mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='NULL' Where config_id=1410;"#algoliasearch_credentials/credentials/api_key
