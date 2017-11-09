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

#Check if drush is installed 
drush --version

#Download drupal
cd /home/site/wwwroot
drush dl drupal 
mv * .* ..

