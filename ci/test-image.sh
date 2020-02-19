#!/bin/sh

sudo apt update && sudo apt upgrade
sudo apt install curl

source /docker-lib.sh
start_docker

cd backline-src
ls
docker run --rm --name backline -p 8080:8080 xlpeabrain/backline


#RESULT=$(curl http://localhost:8080/actuator/health)
#echo $RESULT
#if [[ $RESULT == *"UP"* ]];
#then
#  echo "Up"
#  exit 0
#else
#  echo "Down"
#  exit 1
#fi