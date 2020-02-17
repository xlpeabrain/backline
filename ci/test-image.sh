#!/bin/sh

sudo apt update && sudo apt upgrade
sudo apt install curl

RESULT=$(curl http://localhost:8080/actuator/health)
echo $RESULT
if [[ $RESULT == *"UP"* ]];
then
  echo "Up"
  exit 0
else
  echo "Down"
  exit 1
fi