#!/usr/bin/env bash

# Load the specified database from a file of the same name.
#
# Example:
#   $ load-db edxapp
#
# This will load the edxapp database from a file named exapp.sql.

set -e
set -o pipefail

if [ -z "$1" ]
then
    echo "You must supply a database name!"
    exit 1
fi

echo "Loading the $1 mongo database..."
docker cp ./$1-mongo.tar.gz edx.devstack.mongo:/$1-mongo.tar.gz
docker exec -i edx.devstack.mongo mongorestore --drop --gzip --archive=$1-mongo.tar.gz
docker exec -i edx.devstack.mongo rm $1-mongo.tar.gz
echo "Finished loading the $1 mongo database!"
