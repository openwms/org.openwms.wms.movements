FROM amazoncorretto:21-alpine as builder
MAINTAINER interface21.io <product@openwms.org>
ENV LANG en_GB.UTF-8
WORKDIR application
ARG JAR_FILE=target/openwms-wms-movements-exec.jar
COPY ${JAR_FILE} application.jar
RUN java -Djarmode=layertools -jar application.jar extract

FROM amazoncorretto:21-alpine
WORKDIR application
COPY --from=builder application/dependencies/ ./
COPY --from=builder application/spring-boot-loader/ ./
COPY --from=builder application/snapshot-dependencies/ ./
COPY --from=builder application/application/ ./
ENTRYPOINT exec java org.springframework.boot.loader.launch.JarLauncher
