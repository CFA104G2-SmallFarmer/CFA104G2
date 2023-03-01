FROM openjdk:8-jdk AS build

# Copy your application files to the container
COPY *.java /app/

# Copy the Java files to the container
COPY ./src /app/src
COPY ./lib /app/lib

# Compile the Java files and create a WAR file
RUN find /app/src -type f -name "*.java" > /app/sources.txt
RUN mkdir -p /app/classes
RUN javac -classpath /app/lib/\* -d /app/classes @/app/sources.txt
RUN jar -cvf /app/myapp.war -C /app/classes .

## Set the default command to start your application
#CMD ["java", "-jar", "myapp.war"]

FROM tomcat:9.0-jdk8-openjdk

# Copy your WAR file to the container
COPY --from=build /app/myapp.war /usr/local/tomcat/webapps/

# run
CMD ["/usr/local/tomcat/bin/catalina.sh","run"]

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



##
## Build stage
##
#FROM maven:3.8.5-openjdk-17-slim AS build
#COPY src /home/app/src
#COPY pom.xml /home/app
#RUN mvn -f /home/app/pom.xml clean package
#
##
## Package stage
##
#FROM openjdk:17-slim
#COPY --from=build /home/app/target/linebot-v202204.jar /usr/local/lib/demo.jar
#EXPOSE 8080
#ENTRYPOINT ["java","-jar","/usr/local/lib/demo.jar"]


#I need to create a war file by docker, also, I don't use maven and gradle, I want to use the tool in jdk, such as javac and jar.
#And if I want to use the image with tomcat, such as "tomcat:9.0-jdk8-openjdk".
#By the way, please take consider the point that my java files are in different directories during you making the war file.
#Write me a Dockerfile please?
