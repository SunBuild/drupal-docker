FROM appsvcorg/nginx-fpm:0.1

ENV DRUPAL_VERSION 8.4.2

COPY entrypoint.sh /tmp

# Install Composer.
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

# Install Drush 8.
RUN composer global require drush/drush:8.*
RUN composer global update
# Unfortunately, adding the composer vendor dir to the PATH doesn't seem to work. So:
RUN ln -s /root/.composer/vendor/bin/drush /usr/local/bin/drush

# Install Drupal Console. There are no stable releases yet, so set the minimum 
# stability to dev.
RUN curl https://drupalconsole.com/installer -L -o drupal.phar && \
	mv drupal.phar /usr/local/bin/drupal && \
	chmod +x /usr/local/bin/drupal
RUN drupal init

# Install Drupal.
RUN cd /var && \
	drush dl drupal-$DRUPAL_VERSION && \
	mv /var/drupal* /home/site/wwwroot

RUN chmod u+x /tmp/entrypoint.sh

ENTRYPOINT ["/tmp/entrypoint.sh"]