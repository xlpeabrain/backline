# Spring Boot Application Backline
Simple spring boot application accessible via port 8080 by default
For use to experiment with Spring Boot, Docker, K8s, Concourse

Notes: 
- default properties file is available under /src/main/resources, but is not packaged in the excutable jar
- Sample DockerFile at root folder can be used to build an image
- Container image will have a volume at "/config" where the properties file can be mounted into the container

###QuickStart

**To Build project in OS X**

Run the command to build project at root folder
"mvn clean install"

**To Run the executable jar**

To start the app with default settings, Run the command "java -jar ./target/backline.jar"
To start the app with externalized config file, Run the command "java -jar ./target/backline.jar --spring.config.location={path to config files}"

**To build container image**

Run command "docker build . -t {imageTag}"
eg docker build . -t xlpeabrain/backline

**To run container image**

Run command "docker run --name {containerName} {imageTag}"
eg docker run --name backline xlpeabrain/backline
To expose port and mount volume, "docker run --name {containerName} -p {hostport}:{containerport} --mount type=bind,source={hostpath},target={containerPath} {image tag}