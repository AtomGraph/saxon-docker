FROM openjdk:8-jre

LABEL maintainer="martynas@atomgraph.com"

WORKDIR /usr/src/Saxon-HE

### download Saxon

RUN curl http://repo1.maven.org/maven2/net/sf/saxon/Saxon-HE/9.9.1-2/Saxon-HE-9.9.1-2.jar -O

### entrypoint

COPY entrypoint.sh entrypoint.sh

ENTRYPOINT ["/bin/sh", "entrypoint.sh"]