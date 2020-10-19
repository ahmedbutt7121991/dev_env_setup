#!/bin/bash
source config.sh

dpkg -s $SOFTWARE &> /dev/null

if [ $? -eq 0 ]; then
    echo "Package  is installed!"
else
    echo "Package  is NOT installed!"
    # sudo apt-get install -y $SOFTWARE
fi
