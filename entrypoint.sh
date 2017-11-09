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

drush --version

#rm -r /home/site/wwwroot
#cd /home/site
#drush qd --profile=minimal --yes > /home/logfiles/drush.log
#mv drupal wwwroot

wget https://www.drupal.org/files/projects/drupal-8.4.2.tar.gz
tar -zxvf drupal-8.4.2.tar.gz -C /home/site/wwwroot 

