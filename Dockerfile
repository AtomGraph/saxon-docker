# Saxon-HE's command line, called as `docker run -i atomgraph/saxon -s:<source> -xsl:<stylesheet> [param=value...]`.
# Since Saxon 12 the jar needs xmlresolver (and its dependencies) beside it, so the build stage resolves them with Maven.

FROM maven:3.9.11-eclipse-temurin-21 AS build

ARG SAXON_VERSION=12.9

WORKDIR /usr/src/Saxon-HE

COPY pom.xml .
RUN mvn -B -q dependency:copy-dependencies -Dsaxon.version=${SAXON_VERSION} -DincludeScope=runtime -DoutputDirectory=lib

FROM eclipse-temurin:21-jre

LABEL maintainer="martynas@atomgraph.com"

WORKDIR /usr/src/Saxon-HE

COPY --from=build /usr/src/Saxon-HE/lib lib

ENTRYPOINT ["java", "-cp", "/usr/src/Saxon-HE/lib/*", "net.sf.saxon.Transform"]
