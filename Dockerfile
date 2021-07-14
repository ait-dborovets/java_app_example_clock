FROM maven:3.8.1-jdk-8 as builder
WORKDIR /build
COPY . /build
RUN mvn -Dmaven.test.skip=true clean package

FROM tomcat:latest
WORKDIR /usr/local/tomcat/webapps
COPY --from=builder /build/web/target/*.war ./ROOT.war
EXPOSE 8080/tcp
