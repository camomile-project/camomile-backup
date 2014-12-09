#!/bin/bash

DATE=$(date +%Y%m%d_%H%M%S)
FILE='/backup/backup-$date.tar.gz'

mongodump --quiet -h $MONGO_PORT_27017_TCP_ADDR -p $MONGO_PORT_27017_TCP_PORT
tar -zcvf $FILE dump/
rm -rf dump/