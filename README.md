# saxon-docker
Dockerized Saxon-HE (XSLT 3.0 processor)

The image [atomgraph/saxon](https://hub.docker.com/r/atomgraph/saxon) is built for `linux/amd64` and `linux/arm64` on Java 21. It is tagged by
Saxon-HE version (e.g. `12.9`), by major version (`12`) and `latest`.

## Usage

    docker run --rm -v "$PWD/xml/source.xml":"/xml/source.xml" -v "$PWD/xsl/stylesheet.xsl":"/xsl/stylesheet.xsl" atomgraph/saxon -s:/xml/source.xml -xsl:/xsl/stylesheet.xsl param=value

Note that we use `$PWD` in order to make host filepath absolute, as required by Docker's [`-v` (volume) option](https://docs.docker.com/engine/reference/run/#volume-shared-filesystems).

The source can also be read from standard input with `-s:-`, attaching the streams:

    docker run --rm -i -a stdin -a stdout -a stderr -v "$PWD/xsl":/xsl atomgraph/saxon -s:- -xsl:/xsl/stylesheet.xsl < source.xml

## Build

    docker build --build-arg SAXON_VERSION=12.9 -t atomgraph/saxon .

## Release

Pushing a tag `saxon-<version>`, where the version is a Saxon-HE release on Maven Central, builds and pushes the image for that version:

    git tag saxon-12.9 && git push origin saxon-12.9

## Documentation

Saxon's [Running XSLT from the Command Line](https://www.saxonica.com/documentation12/index.html#!using-xsl/commandline)
