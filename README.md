
# Docker container for EJBCA

## Description

[EJBCA](http://www.ejbca.org) CA server container is targeted for
using in *test environments* and for *experimentation*.  **Do not use
for production!** The container will have *hardcoded credentials*.
Therefore the container image *should not be uploaded* to public
Docker Hub.  Build and **use in restricted environment only**.


## Building the container

First clone this repository

    git clone https://github.com/tsaarni/docker-ejbca.git
    cd docker-ejbca

Then download all dependencies

    wget http://downloads.sourceforge.net/project/ejbca/ejbca6/ejbca_6_3_1_1/ejbca_ce_6_3_1_1.zip
    wget http://download.jboss.org/jbossas/7.1/jboss-as-7.1.1.Final/jboss-as-7.1.1.Final.tar.gz

Next re-package EJBCA source release from .zip to .tar.gz (Docker does
not support .zip)
    
    unzip -q ejbca_ce_6_3_1_1.zip
    tar zcf ejbca_ce_6_3_1_1.tar.gz ejbca_ce_6_3_1_1
    rm -rf ejbca_ce_6_3_1_1 ejbca_ce_6_3_1_1.zip

Finally build the container image

    docker build --tag ejbca .

**Known problem**: Build fails randomly during `ant install`.
Workaround: try build again.


## Using the container

See [user manual](files/docker-entrypoint.md).

User manual is also included inside container image.  It is printed
when running the container with `docker run [OPTIONS] IMAGE [COMMAND]`
without providing command or when providing `help` as the command.


