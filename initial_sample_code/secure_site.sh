#!/bin/bash

echo "Securing site"

initial=/microcloud/domains/

cd
cd ${initial}
domains=( $( ls . ))
echo $domains

for domain in *
do
    echo $domain
    if [ $domain != 'lost+found' ]
    then
        # echo $domain
        DG=${initial}${domain}/domains/
        cd ${DG}
        if [ "$(ls -A $DG)" ]; then
            echo "Take action on $DG is not Empty"
        else
            echo "$DG is Empty....Hence Skipping..."
            continue
        fi
        # pwd
        for vhost in *
        do
            # echo "${domain} --->>> ${vhost}"
            name="$( echo ${vhost} | awk -F'.' '{print $1}')"
            subdomain="$( echo ${vhost} | awk -F'.' '{print $2}')"
            # echo "${domain} --->>> ${vhost}=============>>>>>${name} --->>> ${subdomain}"
            vhost=${DG}${vhost}/
            # pwd
            cd ${vhost}
            # pwd
            if [ ! -d "http" ]; then
                echo "Skiping ${vhost} ..."
		        continue  # read next file and skip the cp command
            else
                cd http
                # pwd
                echo "Finding in domain ${vhost}http/"
                find . -name *.sql.gz*
            fi
            # echo "Finding in var......"
            # find ./var -name *.sql.gz*
            # echo "Finding in pub......"
            # find ./pub -name *.sql.gz*
        done
    fi
done
# names=(mubashir raisa sajid staging tauseef testing umar uzair usama waseem)
# names=(bath bathtest bathtest1 bathtest2 cdn dev2 m2)
# names=test
# for i in "${names[@]}"; do
#     # printf ${i}
#     domain=cretes
#     vhost=${i}cretesol
#     echo ${vhost}
#     confile=/microcloud/domains/cretes/domains/${i}.cretesol.com/___general/${i}.cretesol.com.conf
#     # echo ${confile}
#     url=/microcloud/domains/cretes/domains/${i}.cretesol.com/___general
#     # echo ${url}

#     cd ${url}
#     pwd
#     touch .htpasswd
#     printf "${vhost}:$(openssl passwd -1 password)\n" >> .htpasswd

#     printf "location ~* ^/(index.php/)?dbscripts {
#     satisfy any;

#     #allow x.x.x.x

#     auth_basic "Login";
#     auth_basic_user_file ${url}/.htpasswd;

#     deny all;
#     location ~* \.(php)$ {
#     include fastcgi_params;
#     }
#     try_files $uri $uri/ @bootstrap;
#     }" >> ${confile}

#     /etc/init.d/nginx reload
# done