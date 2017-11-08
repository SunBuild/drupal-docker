#!/usr/bin/env bash

set -e

if [ ! -f "/tmp/drupal.tar.gz" ]
then
    echo "drupal.tar.gz file not found"  
else
  if ! [ -e /home/site/wwwroot/index.php -a -e /home/site/wwwroot/sites/default/settings.php ]; then
    echo "Drupal not found, copying to site root"
    echo "Copying Drupal files, please refresh in a moment" > /home/site/wwwroot/index.php
    tar -xzf /tmp/drupal.tar.gz -C /home/site/wwwroot
    rm /tmp/drupal.tar.gz 
    cp -rf C /home/site/wwwroot/drupal-8.4.2/* /home/site/wwwroot

  else
    echo "Existing Drupal installation found"
  fi
fi

