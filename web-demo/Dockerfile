FROM ubuntu:14.04
RUN apt-get install -y lighttpd
ADD demo-http-files /var/www
EXPOSE 80
CMD ["/usr/sbin/lighttpd", "-D", \
     "-f", "/etc/lighttpd/lighttpd.conf"]


