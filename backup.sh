#!/bin/bash

DATE=$(date +%Y%m%d_%H%M%S)
FILE="backup-$DATE.tar.gz"

echo "$DATE"

# dump MongoDB to dump/ directory
mongodump --quiet -h $MONGO_PORT_27017_TCP_ADDR

# create archive from dump/ directory
tar -zcf $FILE dump/

# delete dump/ directory
rm -rf dump/

# send archive to FTP
lftp -e "set ftp:ssl-allow no; put $FILE; bye" -u $FTP_USER,$FTP_PASSWORD $FTP_SERVER

# delete local archive
rm $FILE

