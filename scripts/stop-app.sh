#!/bin/bash
# Stopping existing go application

echo "Stopping any existing air(go) application"
pkill air

# delete the directory if exists
DIR="/home/ubuntu/go-app"
if [ -d "$DIR" ]; then
    echo "${DIR} exists"
    echo "Deleting the repositroy"
    rm -rf "$DIR"
else
    echo "Creating ${DIR} directory"
    mkdir -p "$DIR"
fi

