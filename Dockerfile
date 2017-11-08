FROM appsvcorg/nginx-fpm:0.1

ENV DRUPAL_VERSION 8.4.2

# Composer
# Updation: https://getcomposer.org/download/
ENV COMPOSER_DOWNLOAD_URL "https://getcomposer.org/installer"
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /home/.composer
ENV COMPOSER_VERSION "1.5.2"
# SHA384SUM https://composer.github.io/installer.sha384sum
ENV COMPOSER_SETUP_SHA 544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061

COPY entrypoint.sh /tmp

# Install Composer.
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin 

# Install Drush 8.
RUN composer global require drush/drush:8.*
RUN composer global update
# Unfortunately, adding the composer vendor dir to the PATH doesn't seem to work. So:
RUN ln -s /root/.composer/vendor/bin/drush /usr/local/bin/drush

# Install Drupal Console. There are no stable releases yet, so set the minimum 
# stability to dev.
RUN curl https://drupalconsole.com/installer -L -o drupal.phar && \
	mv drupal.phar /home/site/wwwroot && \
	chmod +x /home/site/wwwroot
RUN drupal init

# Install Drupal.
RUN cd /home/site/wwwroot && \
	drush dl drupal-$DRUPAL_VERSION 

RUN chmod u+x /tmp/entrypoint.sh

ENTRYPOINT ["/tmp/entrypoint.sh"]