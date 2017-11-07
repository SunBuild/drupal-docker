#!/usr/bin/env bash

set -e

if ! [ -e /home/site/wwwroot/index.php -a -e /home/site/wwwroot/sites/default/settings.php ]; then
  echo "Drupal not found, copying to site root"
  echo "Copying Wordpress files, please refresh in a moment" > /home/site/wwwroot/index.php
  /tmp/copy.sh &
else
  echo "Existing Drupal installation found"
fi

exec /usr/local/bin/entrypoint.sh
