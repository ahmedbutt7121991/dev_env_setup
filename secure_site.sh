#!/bin/bash

echo "Securing site"

# names=(mubashir raisa sajid staging tauseef testing umar uzair usama waseem)
# names=(bath bathtest bathtest1 bathtest2 cdn dev2 m2)
names=test
for i in "${names[@]}"; do
    # printf ${i}
    domain=cretes
    vhost=${i}cretesol
    echo ${vhost}
    confile=/microcloud/domains/cretes/domains/${i}.cretesol.com/___general/${i}.cretesol.com.conf
    # echo ${confile}
    url=/microcloud/domains/cretes/domains/${i}.cretesol.com/___general
    # echo ${url}

    cd ${url}
    pwd
    touch .htpasswd
    printf "${vhost}:$(openssl passwd -1 password)\n" >> .htpasswd

    printf "location ~* ^/(index.php/)?dbscripts {
    satisfy any;

    #allow x.x.x.x

    auth_basic "Login";
    auth_basic_user_file ${url}/.htpasswd;

    deny all;
    location ~* \.(php)$ {
    include fastcgi_params;
    }
    try_files $uri $uri/ @bootstrap;
    }" >> ${confile}

    /etc/init.d/nginx reload
done