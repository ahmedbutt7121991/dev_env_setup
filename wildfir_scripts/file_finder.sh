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
        done
    fi
done