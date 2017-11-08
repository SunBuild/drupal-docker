#!/usr/bin/env bash

set -e

if [ ! -f "/tmp/drupal-8.4.2.tar.gz" ]
then
    echo "drupal-8.4.2.tar.gz file not found"  > /home/site/wwwroot/index.php
else
  if ! [ -e /home/site/wwwroot/index.php -a -e /home/site/wwwroot/sites/default/settings.php ]; then
    echo "Drupal not found, copying to site root"
    echo "Copying Drupal files, please refresh in a moment" > /home/site/wwwroot/index.php
    tar -xzf /tmp/drupal-8.4.2.tar.gz -C /home/site/wwwroot index.php
    rm /tmp/drupal-8.4.2.tar.gz 
    cp -rf C /home/site/wwwroot/drupal-8.4.2/* /home/site/wwwroot

  else
    echo "Existing Drupal installation found"
  fi
fi

