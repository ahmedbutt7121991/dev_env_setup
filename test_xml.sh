#!/bin/bash

echo "--=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--"
echo "--=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--"
echo "--=-==-=-     MAGEv1 ENV FILE     -=-=-=-=--"
echo "--=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--"
echo "--=-==-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--"
magento_version=1
db_cred_file_path=local.xml
DB_NAME_ENV=ahmed_tons
DB_PASSWORD_ENV=xnsadlasljdkl
cat local.xml | grep host
# cat local.xml | grep username
# cat local.xml | grep password
# cat local.xml | grep dbname
# prod_db_host="$( awk '/host/ {split($0,a,/db[0-9]{1}\.i/);print a[1]; print a[2]}' $db_cred_file_path)"
# prod_db_host="$( awk '/host/ {print $1}' | 'awk ' $db_cred_file_path)"
# prod_db_host="$( awk '/host/ {print $1}' $db_cred_file_path)"
# prod_db_host="$(grep -Po '^db[0-9]{1}\.i$' $db_cred_file_path)"
# prod_db_host=$(grep -Eohm1 "<host>(<!\[CDATA\[)?(.*)(\]\]>)?<\/host>" $db_cred_file_path | sed "s#<host><!\[CDATA\[##g;s#\]\]><\/host>##g")
if [[  $magento_version == '1' ]];then
    # prod_db_host="$(awk '/<host>(<!\[CDATA\[)?(.*)(\]\]>)?<\/host>/ {print $1}' $db_cred_file_path | sed -e "s/<host><!\[CDATA\[//g" -e "s/\]\]><\/host>//g")"#| sed "s#<host><!\[CDATA\[##g;s#\]\]><\/host>##g"
    prod_db_host="$(grep -Eohm1 "<host>(<!\[CDATA\[)?(.*)(\]\]>)?<\/host>" $db_cred_file_path | sed -e "s/<host><!\[CDATA\[//g" -e "s/\]\]><\/host>//g")"
    # prod_db_name="$(awk '/dbname/ {print $1}' $db_cred_file_path | sed "s#<dbname><!\[CDATA\[##g;s#\]\]><\/dbname>##g")"
    prod_db_name="$(awk '/<dbname>(<!\[CDATA\[)?(.*)(\]\]>)?<\/dbname>/ {print $1}' $db_cred_file_path | sed "s/<dbname><!\[CDATA\[//g" -e "s/\]\]><\/dbname>//g")"
    prod_user_name="$(awk '/username/ {print $1}' $db_cred_file_path | sed "s#<username><!\[CDATA\[##g;s#\]\]><\/username>##g")"
    # prod_db_pass="$(grep -Eohm1 "<password>(<!\[CDATA\[)?(.*)(\]\]>)?<\/password>" $db_cred_file_path | sed "s#<password><!\[CDATA\[##g;s#\]\]><\/password>##g")"

    # sed -i "s/${prod_db_name}/${DB_NAME_ENV}/gI" ${db_cred_file_path}
    # sed -i "s/${prod_db_pass}/${DB_PASSWORD_ENV}/gI" ${db_cred_file_path}
fi
# prod_db_name="$( awk '/dbname/ {print $1}' $db_cred_file_path)"
# prod_db_pass="$( awk '/password/ {print $1}' $db_cred_file_path)"
# prod_user_name="$( awk '/username/ {print $1}' $db_cred_file_path)"
if [[  $magento_version == '2' ]];then
    db_cred_file_path=env.php.sample
    prod_db_host="$( awk '/host/ {print $3}' $db_cred_file_path)"
    prod_db_name="$( awk '/dbname/ {print $3}' $db_cred_file_path)"
    prod_db_pass="$( awk '/password/ {print $3}' $db_cred_file_path)"
    prod_user_name="$( awk '/username/ {print $3}' $db_cred_file_path)"
fi
echo "============>>>>>>>>> OUTPUTS"
echo "prod host = $prod_db_host"
echo "prod user = $prod_user_name"
echo "prod db name = $prod_db_name"
# echo "prod db pass = $prod_db_pass"
cat local.xml | grep host
# cat local.xml | grep username
# cat local.xml | grep password
# cat local.xml | grep dbname