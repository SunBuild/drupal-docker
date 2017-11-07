FROM appsvcorg/nginx-fpm:0.1

COPY drupal.tar.gz /tmp
COPY entrypoint.sh /tmp
COPY copy.sh /tmp

RUN chmod u+x /tmp/entrypoint.sh
RUN chmod u+x /tmp/copy.sh

ENTRYPOINT ["/tmp/entrypoint.sh"]
