#!/bin/bash

# give app separated by space
# sample 
# applist=(jenkins puppet docker)

applist=(jenkins)

for app in ${applist[@]}
do
    echo $app
    cd /
    sudo git clone https://github.com/gowriand/$app.git
    cd /$app/setupscripts/
    sudo sh -x setup-$app.sh
done
