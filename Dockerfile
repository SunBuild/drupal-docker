FROM appsvcorg/nginx-fpm:0.1

ENV PATH="/home/site/wwwroot:${PATH}"

COPY entrypoint.sh /tmp

RUN set -ex \
	&& apt-get update \
	&& apt-get install -y curl 

RUN chmod u+x /tmp/entrypoint.sh

ENTRYPOINT ["/tmp/entrypoint.sh"]

