#!/bin/bash

# Check if the Go service is running
service_name="go-service"

if systemctl is-active --quiet $service_name; then
  echo "$service_name is running"
else
  echo "$service_name is not running"
  exit 1
fi

# Check if the Go service is listening on the correct port
port=9000

if netstat -tulpn | grep ":$port " > /dev/null; then
  echo "$service_name is listening on port $port"
else
  echo "$service_name is not listening on port $port"
  exit 1
fi

# Check if the Go service is responding to requests
response=$(curl -s http://localhost:9000)
expected_response="OK"

if [ "$response" == "$expected_response" ]; then
  echo "$service_name is responding to requests"
else
  echo "$service_name is not responding to requests"
  exit 1
fi
