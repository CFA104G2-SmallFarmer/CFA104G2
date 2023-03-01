FROM openjdk:11-jdk

WORKDIR /usr/src/myapp

COPY . /usr/src/myapp

RUN javac -cp "/usr/share/tomcat/lib/*" -d classes src/*.java

RUN jar cvf myapp.war -C classes .

RUN cp myapp.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]

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
