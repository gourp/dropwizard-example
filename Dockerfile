#FROM fabric8/java-jboss-openjdk8-jdk:1.0.10
#
#ENV JAVA_APP_JAR dropwizard-example.jar
#ENV AB_JOLOKIA_HTTPS true
#ENV ZIPKIN_SERVER_URL http://zipkin-query:9411
#
#EXPOSE 9000 9001
#
#ADD target/dropwizard-example.jar /app/
#ADD config.yml /app/config.yml
#
##CMD java -jar dropwizard-example.jar server /app/config.yml
#ENTRYPOINT ["java", "-jar", "dropwizard-example.jar", "server", "config.yml"]

FROM fabric8/java-jboss-openjdk8-jdk:1.0.10

ENV JAVA_APP_JAR dropwizard-example.jar
ENV AB_JOLOKIA_HTTPS true
ENV ZIPKIN_SERVER_URL http://zipkin-query:9411

COPY config.yml /data/dropwizard-sample/config.yml
COPY /target/dropwizard-example.jar /data/dropwizard-sample/dropwizard-example.jar

WORKDIR /data/dropwizard-sample

RUN java -version

CMD ["java","-jar","dropwizard-example.jar","server","config.yml"]

EXPOSE 9000-9001