#!/usr/bin/env bash

set -e

  if ! [ -e /home/site/wwwroot/index.php -a -e /home/site/wwwroot/sites/default/settings.php ]; then
    echo "Drupal not found, copying to site root"
    echo "Copying Drupal files, please refresh in a moment" 
    
  else
    echo "Existing Drupal installation found"
  fi

