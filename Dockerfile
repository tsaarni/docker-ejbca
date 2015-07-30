
FROM java:openjdk-7

ADD jboss-as*.tar.gz apache-ant*.tar.gz ejbca*.tar.gz /opt/
COPY files /

ENV APPSRV_HOME=/opt/jboss-as-7.1.1.Final \
    EJBCA_HOME=/opt/ejbca_ce_6_3_1_1

RUN ln -s /opt/apache-ant*/bin/ant /usr/bin/ant && \
    /build-ejbca.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["--help"]



