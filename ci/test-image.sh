#!/bin/sh

source /docker-lib.sh
start_docker
pwd

cd backline-src
#ls
docker run -d --rm --name backline -p 8080:8080 xlpeabrain/backline
sleep 15

RESULT=$(curl http://localhost:8080/actuator/health)
echo $RESULT

if [[ $RESULT = *UP* ]];
then
  echo "Up"
  cd ../
  mkdir gen
  echo $RESULT >> status.txt
  exit 0
else
  echo "Down"
  exit 1
fi