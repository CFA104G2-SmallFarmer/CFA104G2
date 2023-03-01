FROM openjdk:8-jdk

# Copy your application files to the container
COPY MyApp.java /app/

# Compile your application
WORKDIR /app/
RUN javac MyApp.java

# Create the WAR file
RUN jar cvf MyApp.war *.class

# Set the default command to start your application
CMD ["java", "-jar", "MyApp.war"]

FROM tomcat:9.0-jdk8-openjdk

# Copy your WAR file to the container
COPY MyApp.war /usr/local/tomcat/webapps/

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
#And if I want to use the image with tomcat, such as "tomcat:9.0-jdk8-openjdk", how shoule I write the Dockerfile?
