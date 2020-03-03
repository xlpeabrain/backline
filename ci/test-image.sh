#!/bin/sh

source /docker-lib.sh
start_docker

docker run -d --rm --name backline -p 8080:8080 xlpeabrain/backline
sleep 15

RESULT=$(curl http://localhost:8080/actuator/health)
echo "$RESULT"

# Define the sanity check logic for container validation here
if test "$RESULT" == '{"status":"DOWN"}';
then
  echo "Up"
  cd gen
  echo "$RESULT" >> status.txt
  exit 0
else
  echo "Down"
  exit 1
fi