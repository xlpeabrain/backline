FROM openjdk:8-jdk-alpine
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring
ARG JAR_FILE=target/backline.jar
WORKDIR /
COPY ${JAR_FILE} backline.jar
ENTRYPOINT ["java","-jar","/backline.jar"]
VOLUME /config