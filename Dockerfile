FROM appsvcorg/nginx-fpm:0.1

COPY entrypoint.sh /tmp
COPY drupal-8.4.2.tar.gz /tmp 

RUN chmod u+x /tmp/entrypoint.sh

ENTRYPOINT ["/tmp/entrypoint.sh"]

