# Spring Boot Application Backline
Simple spring boot application accessible via port 8080 by default
For use to experiment with Spring Boot, Docker, K8s, Concourse

Notes:
- default properties file is available under /src/main/resources, but is not packaged in the excutable jar
- Sample DockerFile at root folder can be used to build an image
- Container image will have a volume at "/config" where the properties file can be mounted into the container
- the concourse pipeline definition is available under "ci" folder.
- the k8s deployment manifest is available under "k8s" folder, and the variables are populated in "ci/deploy-to-k8s.sh"
- values to be passed into the pipeline, eg credentials, should be passed in via a variable file. A template is available at "ci/cred-template.yml"

### QuickStart
**Getting a Concourse CI running on your dev local machine**

If you do not have access to a Concourse CI, the quickest and easiest way to set one up is via the BUCC project by StarkeAndWayne.
Clone and follow the instructions on https://github.com/starkandwayne/bucc

The VM was started on my mac with "bucc up --cpi virtualbox --lite"
Once the instance is up and running, run "bucc fly" and "bucc info" to get details to access the instance.

**To Build project in OS X**

Run the command to build project at root folder<br/>
"mvn clean install"

**To Run the executable jar**

To start the app with default settings, Run the command "java -jar ./target/backline.jar"<br/>
To start the app with externalized config file, Run the command "java -jar ./target/backline.jar --spring.config.location={path to config files}"

**To build container image**

Run command "docker build . -t {imageTag}"<br/>
eg docker build . -t xlpeabrain/backline

**To run container image**

Run command "docker run --name {containerName} {imageTag}"<br/>
eg docker run --name backline xlpeabrain/backline<br/>
To expose port and mount volume, "docker run --name {containerName} -p {hostport}:{containerport} --mount type=bind,source={hostpath},target={containerPath} {image tag}
