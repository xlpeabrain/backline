#!/bin/sh
set -e
# Folder is according to the name of the concourse resource calling this script
cd backline-src
./mvnw clean install -X
