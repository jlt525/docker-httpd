FROM centos:7

COPY ./root/etc/yum.repos.d/wandisco-svn.repo /etc/yum.repos.d/wandisco-svn.repo

RUN yum update -y && \
    yum install -y git subversion httpd mod_dav_svn mod_ssl mod_ldap openldap

COPY ./root/etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf
COPY ./root/etc/httpd/conf.d/subversion.conf /etc/httpd/conf.d/subversion.conf
COPY ./root/etc/httpd/conf.d/ssl.conf /etc/httpd/conf.d/ssl.conf

EXPOSE 8080
EXPOSE 8443

RUN mkdir -p /opt/repos && \
    mkdir -p /opt/web

VOLUME /opt/repos
VOLUME /opt/web
VOLUME /var/log/httpd
VOLUME /var/www/html

RUN echo 'application/wasm				wasm' >> /etc/mime.types
RUN echo 'application/wasm				wasm.gz' >> /etc/mime.types
RUN echo 'application/wasm				gc.wasm' >> /etc/mime.types

CMD ["/usr/sbin/httpd", "-DFOREGROUND"]
