
# Docker container for EJBCA

## Description

[EJBCA](http://www.ejbca.org) CA server container is targeted for
using in *test environments* and for *experimentation*.  **Do not use
for production!** The container will have *hardcoded credentials*.
Therefore the container image *should not be uploaded* to public
Docker Hub.  Build and **use in private environment only**.


## Building the container

First clone this repository

    git clone https://github.com/tsaarni/docker-ejbca.git
    cd docker-ejbca

Then download all dependencies

    wget http://downloads.sourceforge.net/project/ejbca/ejbca6/ejbca_6_3_1_1/ejbca_ce_6_3_1_1.zip
    wget http://download.jboss.org/jbossas/7.1/jboss-as-7.1.1.Final/jboss-as-7.1.1.Final.tar.gz
    wget http://apache.mirrors.spacedump.net/ant/binaries/apache-ant-1.9.6-bin.tar.gz

Next re-package EJBCA source release from .zip to .tar.gz (Docker does
not support .zip)
    
    unzip -q ejbca_ce_6_3_1_1.zip
    tar zcf ejbca_ce_6_3_1_1.tar.gz ejbca_ce_6_3_1_1
    rm -rf ejbca_ce_6_3_1_1 ejbca_ce_6_3_1_1.zip

Finally build the container image

    docker build --tag ejbca .


## Using the container

See [usage information](files/docker-entrypoint-help.txt).  Same text
will be printed when running the container with `docker run [OPTIONS]
IMAGE [COMMAND] [ARG...]` without providing command or by providing
`--help` as the command.


