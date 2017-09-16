FROM fabric8/java-jboss-openjdk8-jdk:1.0.10

ENV JAVA_APP_JAR dropwizard-example.jar
ENV AB_JOLOKIA_HTTPS true
ENV ZIPKIN_SERVER_URL http://zipkin-query:9411

EXPOSE 8081

ADD target/dropwizard-example.jar /app/
