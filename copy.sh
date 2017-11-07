#!/usr/bin/env bash

set -e

tar --exclude="index.php" -xzf /tmp/drupal-8.4.2.tar.gz -C /home/site/wwwroot
tar -xzf /tmp/drupal-8.4.2.tar.gz -C /home/site/wwwroot index.php