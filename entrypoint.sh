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
cd /home/site/wwwroot
curl -O http://files.drush.org/drush.phar 
php drush.phar --version
php drush.phar dl drupal-8.4.2 --drupal-project-rename app



