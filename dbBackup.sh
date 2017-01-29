#!/bin/bash
# Edit and complete your username, password, DB names and change the backup folder if you like
########################################################
MYSQL_USER="MySQL-USER"
MYSQL_PASSWORD="MySQL-PASSWORD"
BACKUP_DIR="$HOME/dbBackup/"
databases="your databases here"
########################################################
#Timestamp of backups, Full Date+Full hour format.
TIMESTAMP=$( date +"%F-%H:%M:%S")

MYSQL=/usr/bin/mysql
MYSQLDUMP=/usr/bin/mysqldump

mkdir -p "$BACKUP_DIR/mysql"



for db in $databases; do
  $MYSQLDUMP --force --opt --user=$MYSQL_USER -p$MYSQL_PASSWORD  --databases $db | gzip > "$BACKUP_DIR/mysql/$db-$TIMESTAMP.gz"
done


