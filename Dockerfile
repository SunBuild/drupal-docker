FROM appsvcorg/nginx-fpm:0.1

ADD drupal-8.4.2.tar.gz /tmp
ADD entrypoint.sh /tmp

RUN chmod 755 /tmp/entrypoint.sh

ENTRYPOINT ["/tmp/entrypoint.sh"]
