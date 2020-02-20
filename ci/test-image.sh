#!/bin/sh



source /docker-lib.sh
start_docker

cd backline-src
ls
docker run -d --rm --name backline -p 8080:8080 xlpeabrain/backline
sleep 15
#curl http://localhost:8080/actuator/health


RESULT=$(curl http://localhost:8080/actuator/health)
echo $RESULT
#if [[ $RESULT == *_"UP"_* ]];
#then
#  echo "Up"
#  exit 0
#else
#  echo "Down"
#  exit 1
#fi