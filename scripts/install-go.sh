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
