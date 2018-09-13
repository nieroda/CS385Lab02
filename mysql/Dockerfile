FROM ubuntu

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server \
 && sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mysql.conf.d/mysqld.cnf \
 && mkdir /var/run/mysqld \
 && chown -R mysql:mysql /var/run/mysqld
  
VOLUME ["/var/lib/mysql"]


COPY run.sh /sbin/run.sh
COPY minibank.sql /
RUN chmod 755 /sbin/run.sh

CMD ./sbin/run.sh && mysqld_safe
