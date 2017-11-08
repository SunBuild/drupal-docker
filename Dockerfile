FROM appsvcorg/nginx-fpm:0.1

ADD drupal-8.4.2.tar.gz /tmp
COPY entrypoint.sh /tmp

RUN chmod u+x /tmp/entrypoint.sh

ENTRYPOINT ["/tmp/entrypoint.sh"]
