#!/bin/bash
# A script to generate backups of a postgres server
# Meant to be run by a chrontab regularly
# Requires .pgpass and PGPASSFILE to be appropriately set up to allow access to the postgres database


# assuming PGPASSFILE is configured in ./settings.bash (and that it may not have been run if this is a cron job)
if [[ ! -v PGPASSFILE ]]; then
	# we must locate the current folder in order to find settings.bash
	BACKUP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
	source "$BACKUP_DIR/settings.bash"
fi

# make sure the backup directory exists
if [[ ! -d $BACKUP_DIR ]]; then
        mkdir $BACKUP_DIR
fi

# the special identifier for this backup - maximum one per second
DATE=`date +%d-%m-%y-%s`

COMMAND="pg_dump -h localhost --username=$POSTGRES_USER $POSTGRES_DATABASE > $BACKUP_DIR/backup_$DATE.txt"

# the actual command to generate the backup file
echo $COMMAND
eval $COMMAND
