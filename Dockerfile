FROM jboss/wildfly:10.0.0.Final

MAINTAINER Yong Wang <yongw@live.com>

USER root
RUN localedef -c -i en_US -f UTF-8 en_US.UTF-8 & localedef -c -i zh_CN -f UTF-8 zh_CN.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL zh_CN.UTF-8
ENV LPM_CONF_DIR /etc/lpm/conf
ENV LPM_UPLOAD_FILE_PATH /data/lpm/upload-file

ADD standalone.xml /opt/jboss/wildfly/standalone/configuration/

USER jboss
VOLUME ["/etc/lpm/conf", "/data/lpm/upload-file"]
EXPOSE 9990

CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
