
FROM java:openjdk-7

ADD jboss-as*.tar.gz ejbca*.tar.gz /opt/
COPY files /

ENV APPSRV_HOME=/opt/jboss-as-7.1.1.Final \
    EJBCA_HOME=/opt/ejbca_ce_6_3_1_1

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get install -y ant man && \
    apt-get clean && \
    /build-ejbca.sh && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME /root

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["--help"]



