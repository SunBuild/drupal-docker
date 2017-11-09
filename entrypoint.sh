#!/usr/bin/env bash
log(){
	while read line ; do
		echo "`date '+%D %T'` $line"
	done
}

set -e
logfile=/home/LogFiles/entrypoint.log
test ! -f $logfile && mkdir -p /home/LogFiles && touch $logfile
exec > >(log | tee -ai $logfile)
exec 2>&1

set -x

#Download drupal
echo "Downloading Drupal CMS on to your container ..Please wait as this can take some time" > /home/site/wwwroot/index.php
cd /tmp 
tar -xzvf drupal-8.4.2.tar.gz -C /home/site/wwwroot --strip 1

#cd /home/site/
#curl -O http://files.drush.org/drush.phar 
#php drush.phar --version
#php drush.phar dl --drupal-project-rename=wwwroot drupal-8.4.2 --yes



