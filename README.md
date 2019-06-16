# saxon-docker
Dockerized Saxon-HE 9.9.1-2 (XSLT 3.0 processor)

## Usage

    docker run --rm -v :"/xml/source.xml" -v :"/xsl/stylesheet.xsl" atomgraph/saxon -s:/xml/source.xml -xsl:/xsl/stylesheet.xsl param=value

## Documentation

Saxon's [Running XSLT from the Command Line](https://www.saxonica.com/documentation/index.html#!using-xsl/commandline)