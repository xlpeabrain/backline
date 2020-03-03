#!/bin/sh

source /docker-lib.sh
start_docker

docker run -d --rm --name backline -p 8080:8080 xlpeabrain/backline
sleep 15

RESULT=$(curl http://localhost:8080/actuator/health)
echo $RESULT

if [[ $RESULT == *"UP"* ]];
then
  echo "Up"
  mkdir gen
  echo $RESULT >> status.txt
  exit 0
else
  echo "FAILED"
  cat /etc/os-release
  lsb_release -a
  hostnamectl
  uname -r
  echo "Down"
  exit 1
fi