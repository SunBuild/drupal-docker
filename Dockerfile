FROM appsvcorg/nginx-fpm:0.1

ENV PATH="/home/site/wwwroot:${PATH}"

COPY entrypoint.sh /tmp
COPY drush.phar /home/site/wwwroot

RUN apt-get update && \
    apt-get install curl

RUN chmod u+x /tmp/entrypoint.sh
RUN chmod u+x /home/site/wwwroot/drush.phar

ENTRYPOINT ["/tmp/entrypoint.sh"]