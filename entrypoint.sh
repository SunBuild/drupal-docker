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

if [ ! -d "/home/site/wwwroot/docroot" ]; then
  mkdir -p /home/site/wwwroot/docroot
fi

drush --version

rm -r /home/site/wwwroot
cd /home/site
drush qd wwwroot --profile=minimal 

ssh-keygen -A
/usr/sbin/sshd

/start.sh