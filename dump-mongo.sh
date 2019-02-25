#!/usr/bin/env bash

# Dump the specified database to a file of the same name.
#
# Example:
#   $ dump-db edxapp
#
# This will dump the edxapp database to a file named exapp.sql.

if [ -z "$1" ]
then
    echo "You must supply a database name!"
    exit 1
fi

echo "Dumping the $1 mongo database..."
docker exec -i edx.devstack.mongo mongodump --db $1 --gzip --archive=$1-mongo.tar.gz
docker cp edx.devstack.mongo:/$1-mongo.tar.gz ./$1-mongo.tar.gz
echo "Finished dumping the $1 mongo database!"
