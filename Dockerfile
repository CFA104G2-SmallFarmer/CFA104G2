### 20230328 maven包war
FROM maven:3.8.5-openjdk-8-slim AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn --debug --file /home/app/pom.xml clean package
#CMD ["sleep", "infinity"] # for debug

FROM tomcat:9.0-jdk8-openjdk
COPY --from=build /home/app/target/smallfarmer-production.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["/usr/local/tomcat/bin/catalina.sh","run"]


### 20230301 jdk包war(失敗)
#FROM openjdk:8-jdk AS build
#
## Copy your application files to the container
#COPY *.java /app/
#
## Copy the Java files to the container
#COPY ./src /app/src
#COPY ./lib /app/lib
#
## Compile the Java files and create a WAR file
#RUN find /app/src -type f -name "*.java" > /app/sources.txt
#RUN mkdir -p /app/classes
#RUN javac -classpath /app/lib/\* -d /app/classes @/app/sources.txt
#RUN jar -cvf /app/myapp.war -C /app/classes .
#
### Set the default command to start your application
##CMD ["java", "-jar", "myapp.war"]
#
#FROM tomcat:9.0-jdk8-openjdk
#
## Copy your WAR file to the container
#COPY --from=build /app/myapp.war /usr/local/tomcat/webapps/
#
## run
#CMD ["/usr/local/tomcat/bin/catalina.sh","run"]


### 20230301 手工包war
## from tomcat:8.0
#FROM tomcat:9.0.65
#
## set Maintainer
#MAINTAINER TSK
#
## copy war
#COPY smallfarmer.war /usr/local/tomcat/webapps/
#
## run
#CMD ["/usr/local/tomcat/bin/catalina.sh","run"]


#I need to create a war file by docker, also, I don't use maven and gradle, I want to use the tool in jdk, such as javac and jar.
#And if I want to use the image with tomcat, such as "tomcat:9.0-jdk8-openjdk".
#By the way, please take consider the point that my java files are in different directories during you making the war file.
#Write me a Dockerfile please?
