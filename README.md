# saxon-docker
Dockerized Saxon-HE (XSLT 3.0 processor)

## Usage

    docker run --rm -v "$PWD/xml/source.xml":"/xml/source.xml" -v "$PWD/xsl/stylesheet.xsl":"/xsl/stylesheet.xsl" atomgraph/saxon -s:/xml/source.xml -xsl:/xsl/stylesheet.xsl param=value

Note that we use `$PWD` in order to make host filepath absolute, as required by Docker's [`-v` (volume) option](https://docs.docker.com/engine/reference/run/#volume-shared-filesystems).

## Documentation

Saxon's [Running XSLT from the Command Line](https://www.saxonica.com/documentation/index.html#!using-xsl/commandline)