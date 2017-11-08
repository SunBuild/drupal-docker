FROM appsvcorg/nginx-fpm:0.1

COPY drupal.tar.gz /tmp
COPY entrypoint.sh /tmp

RUN chmod u+x /tmp/entrypoint.sh

ENTRYPOINT ["/tmp/entrypoint.sh"]