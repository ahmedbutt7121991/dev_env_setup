#!/bin/bash

source config.sh

function usage()
{
  cat <<EOF
$(basename $0) Usage:

$(basename $0) ([args])

    -d      CREATE DB DUMP
    -r      RESTORE DB
    -u      CHANGE DB URL
    -t      TRUNCATE TABLES
    -e      ELIMINATE DB DUMP
    -drute  RUN ALL ABOVE TASKS IN SEQUENCE
EOF
exit 0
}

prod_tasks() {
    echo "===========>>>>"

    ssh ${PRODUCTION_SERVER} "pwd;
    cd ${PROD_DOMAIN_PATH};
    echo \"Script location dir Listing.............................................\";
    ls -ltrh;
    echo \"**** Creating DB dump using mage2 Script ****\";
    bash ${db_dump_script} -dz;
    cd var;
    ls -ltrh | grep db;
    mv db.sql.gz ${db_dump_path};
    cd ${db_dump_path};ls -ltrh ${db_dump_path};
    exit"
    pwd
    # echo "Home dir Listing............................................."
    # pwd	
    # cd ${PROD_DOMAIN_PATH}
    # echo "==========================="
    # echo "Script location dir Listing............................................."
    # pwd

    # echo "**** Creating DB dump using mage2 Script ****"

    # bash ${db_dump_script} -dz
    # cd var
    # ls | grep db

    # mv db.sql.gz ${db_dump_path}
    # cd ${db_dump_path}
    # ls ${db_dump_path}
}

dev_tasks() {
    echo "======================================>>>"
    pwd
    echo "======================================"
    echo \"Restoring DB in another vhost...\"
    cd ${DEV_DOMAIN_PATH}
    ls -ltrh
    pwd
    wget http://dev10.tonsoftiles.co.uk/pub/db.sql.gz
    ls -ltrh | grep db
    pwd
    mv db.sql.gz ${db_restore_path}
    cd ${db_restore_path}
    pwd
    ls -ltrh | grep db
    pwd
    cd ..
    pwd
    echo y | bash ${db_dump_script} -rz
    pwd
    sleep 10
}

db_bk_rm() {
    echo "===========>>>>"
    ssh ${PRODUCTION_SERVER} "pwd;
    cd ${PROD_DOMAIN_PATH};
    echo \"Script location dir Listing.............................................\";
    ls -ltrh;
    echo \"Checking db bk in domain root...........................................\";
    ls -ltrh | grep db;
    cd var;
    pwd;
    echo \"Checking db bk in domain root/var dir...................................\";
    ls -ltrh | grep db;
    cd ../pub;
    pwd;
    echo \"Checking db bk in domain root/pub dir...................................\";
    ls -ltrh | grep db;
    echo \"Removing db bk in domain root/pub dir...................................\";
    rm -rf db.sql.gz;
    echo \"Checking after removing db bk in domain root/pub dir....................\";
    ls -ltrh | grep db;
    exit"
    pwd
    # echo "Home dir Listing............................................."
    # pwd	
    # cd ${PROD_DOMAIN_PATH}
    # echo "==========================="
    # echo "Script location dir Listing............................................."
    # pwd

    # echo "**** Creating DB dump using mage2 Script ****"

    # bash ${db_dump_script} -dz
    # cd var
    # ls | grep db

    # mv db.sql.gz ${db_dump_path}
    # cd ${db_dump_path}
    # ls ${db_dump_path}
}

url_update() {
    BD_HOST="$( awk '/host/ {print $3}' $db_cred_file_path | awk -F',' '{print $1}' | tr -d "'")"
    DB_NAME="$( awk '/dbname/ {print $3}' $db_cred_file_path | awk -F',' '{print $1}' | tr -d "'")"
    DB_PASSWORD="$( awk '/password/ {print $3}' $db_cred_file_path | awk -F',' '{print $1}' | tr -d "'")"
    USER_NAME="$( awk '/username/ {print $3}' $db_cred_file_path | awk -F',' '{print $1}' | tr -d "'")"

    echo "
    db host= $BD_HOST
    db name=$DB_NAME
    db username=$USER_NAME
    db pass=$DB_PASSWORD
    "
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
    mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -e "Show databases;"
    # mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "select * from ${DB_TABLE};"
    mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://ahmed.tonsoftiles.co.uk/' Where path='web/unsecure/base_url';"
    # mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://ahmed.tonsoftiles.co.uk/' Where path='web/unsecure/base_media_url';"
    mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://ahmed.tonsoftiles.co.uk/' Where path='web/unsecure/base_link_url';"
    mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://ahmed.tonsoftiles.co.uk/' Where path='web/secure/base_url';"
    # mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://ahmed.tonsoftiles.co.uk/' Where path='web/secure/base_media_url';"
    mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://ahmed.tonsoftiles.co.uk/' Where path='web/secure/base_link_url';"
    mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://ahmed.tonsoftiles.co.uk/' Where path='tm_integrations/general/tm_url';"
    mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://ahmed.tonsoftiles.co.uk/' Where path='wallfloor/general/wallfloor_url';"
    mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "Update ${DB_TABLE} set value='http://ahmed.tonsoftiles.co.uk/' Where path='tonssystem/general/tons_url';"
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


tb_trunc() {
    BD_HOST="$( awk '/host/ {print $3}' $db_cred_file_path | awk -F',' '{print $1}' | tr -d "'")"
    DB_NAME="$( awk '/dbname/ {print $3}' $db_cred_file_path | awk -F',' '{print $1}' | tr -d "'")"
    DB_PASSWORD="$( awk '/password/ {print $3}' $db_cred_file_path | awk -F',' '{print $1}' | tr -d "'")"
    USER_NAME="$( awk '/username/ {print $3}' $db_cred_file_path | awk -F',' '{print $1}' | tr -d "'")"

    echo "
    db host= ${BD_HOST}
    db name=${DB_NAME}
    db username=${USER_NAME}
    db pass=${DB_PASSWORD}
    "
    echo "-- Truncate order tables"
    ORDER_TABLE_NAMES=(gift_message quote quote_address quote_address_item quote_id_mask quote_item quote_item_option quote_payment quote_shipping_rate reporting_orders sales_bestsellers_aggregated_daily sales_bestsellers_aggregated_monthly sales_bestsellers_aggregated_yearly sales_creditmemo sales_creditmemo_comment sales_creditmemo_grid sales_creditmemo_item sales_invoice sales_invoiced_aggregated sales_invoiced_aggregated_order sales_invoice_comment sales_invoice_grid sales_invoice_item sales_order sales_order_address sales_order_aggregated_created sales_order_aggregated_updated sales_order_grid sales_order_item sales_order_payment sales_order_status_history sales_order_tax sales_order_tax_item sales_payment_transaction sales_refunded_aggregated sales_refunded_aggregated_order sales_shipment sales_shipment_comment sales_shipment_grid sales_shipment_item sales_shipment_track sales_shipping_aggregated sales_shipping_aggregated_order tax_order_aggregated_created tax_order_aggregated_updated)
    mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "SET FOREIGN_KEY_CHECKS=0;"
    for t in "${ORDER_TABLE_NAMES[@]}"; do
        mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "SET FOREIGN_KEY_CHECKS=0; TRUNCATE TABLE ${t};"
    done
    echo "-- Truncate Customer tables"
    CUSTOMER_TABLE_NAMES=(customer_address_entity customer_address_entity_datetime customer_address_entity_decimal customer_address_entity_int customer_address_entity_text customer_address_entity_varchar customer_entity customer_entity_datetime customer_entity_decimal customer_entity_int customer_entity_text customer_entity_varchar customer_grid_flat customer_log customer_log customer_visitor persistent_session wishlist wishlist_item wishlist_item_option)
    for t in "${CUSTOMER_TABLE_NAMES[@]}"; do
        mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "SET FOREIGN_KEY_CHECKS=0; TRUNCATE TABLE ${t};"
    done
    echo "-- Truncate Review tables"
    REVIEW_TABLE_NAMES=(review review_detail review_entity_summary review_store)
    for t in "${REVIEW_TABLE_NAMES[@]}"; do
        mysql -h${BD_HOST} -u${USER_NAME} -p${DB_PASSWORD} -D ${DB_NAME} -e "SET FOREIGN_KEY_CHECKS=0; TRUNCATE TABLE ${t};"
    done
}


if [[ "$1" == "" ]]; then
  usage
fi

if [[ "$1" == "-d" ]]; then
    prod_tasks
fi

if [[ "$1" == "-r" ]]; then
    dev_tasks
fi

if [[ "$1" == "-u" ]]; then
    url_update
fi

if [[ "$1" == "-e" ]]; then
    db_bk_rm
fi

if [[ "$1" == "-t" ]]; then
    tb_trunc
fi

if [[ "$1" == "-drute" ]]; then
    prod_tasks
    dev_tasks
    url_update
    tb_trunc
    db_bk_rm
fi