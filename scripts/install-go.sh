#!/bin/bash

# Update the package list
sudo apt update

# Download and install GoLang
sudo apt install golang-go

# Set the GOPATH environment variable
echo "export GOPATH=$HOME/go" >> ~/.profile
echo "export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin" >> ~/.profile
source ~/.profile

# Verify the installation
go version

# create our working directory if it doesnot exist
DIR="/home/ubuntu/go-app"
if [ -d "$DIR" ]; then
    echo "${DIR} exists"
else
    echo "Creating ${DIR} directory"
    mkdir -p "$DIR"
fi

# give permission to the files inside the go app
sudo chmod -R 777 /home/ubuntu/go-app