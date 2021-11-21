FROM openjdk:8-jre

LABEL maintainer="martynas@atomgraph.com"

ARG SAXON_VERSION=10.6

WORKDIR /usr/src/Saxon-HE

### download Saxon

RUN curl https://repo1.maven.org/maven2/net/sf/saxon/Saxon-HE/${SAXON_VERSION}/Saxon-HE-${SAXON_VERSION}.jar -o Saxon-HE.jar

### entrypoint

COPY entrypoint.sh entrypoint.sh

ENTRYPOINT ["/bin/sh", "entrypoint.sh"]