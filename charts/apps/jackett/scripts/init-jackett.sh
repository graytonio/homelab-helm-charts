#!/bin/bash

installDependencies() {
    apk update
    apk add jq
    apk add curl
}

addIndexer() {
    echo "Adding $1"
    while [[ "$(curl -s --request POST --header 'Content-Type: application/json' --data '[]' -o /dev/null -L -b jackett.txt -w '%{http_code}' http://localhost:9117/api/v2.0/indexers/${1}/config)" != "204" ]];
        do echo "Waiting for ${1}" && sleep 2;
    done
    echo "${1} - OK!"
}

# Install Dependencies
installDependencies
touch jackett.txt

while ! curl -s http://localhost:9117/UI/Dashboard;
do
    echo "Waiting for main container to start"
    sleep 10
done

# Read API key from file system
APITOKEN=$(jq '.APIKey' /config/Jackett/ServerConfig.json)

echo "Fetching New Cookie"
curl -s -o /dev/null -c jackett.txt http://localhost:9117/UI/Login

# Add configured indexers
echo "Adding Indexers"
for index in "$@"
do
    addIndexer "$index"
done

# Sleep
sleep infinity;