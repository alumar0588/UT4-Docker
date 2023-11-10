#!/bin/bash
while ! mysql -u ${DB_USER} -p${DB_PASS} -h ${DB_HOST}  -e ";" ; do
	sleep 1
done	
mysql -u $DB_USER --password=$DB_PASS -h $DB_HOST $DB_NAME < /opt/schema.sql
/usr/sbin/apache2ctl -D FOREGROUND
