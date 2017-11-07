#!/usr/bin/env bash

set -e

tar --exclude="index.php" -xzf /tmp/drupal.tar.gz -C /home/site/wwwroot
tar -xzf /tmp/drupal.tar.gz -C /home/site/wwwroot index.php