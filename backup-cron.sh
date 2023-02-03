#!/usr/bin/bash

dir="/home/mariem/lab2/cronJob/dir"
backupdir="/home/mariem/lab2/cronJob/backupdir"
newfile="/home/mariem/lab2/cronJob/directory-info-cron.new"
lastfile="/home/mariem/lab2/cronJob/directory-info-cron.last"
max_backups=5
mkdir -p $backupdir

newinfo=$(ls -lR $dir)
echo $newinfo > $newfile

currentdate=$(date -r $dir +"%y-%m-%d-%H-%M-%S")
echo "Last modification date: $currentdate"
if ! cmp -s $newfile $lastfile
then
		
	currentdate=$(date -r $dir +"%y-%m-%d-%H-%M-%S")
	cp -r $dir $backupdir/$currentdate
	lastinfo=$(ls -lR $dir)
	echo $lastinfo > $lastfile
	
	lines=$(ls -1 $backupdir| wc -l)
	line=$( expr $lines - $max_backups ) #get number of folders that exceeds the max_backup limit
	
	#check if the backups exceed the limit
	if [ $lines -gt $max_backups ]
	then
		op=$(ls -1 $backupdir | head -n $line )
		while read line
		do
			rm -rf "$backupdir/$line"
		done <<< $op
	fi
fi
	
	
	
	
	
	
	
