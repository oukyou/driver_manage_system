mysqldump -d -uroot -p123456 dms | sed "s/AUTO_INCREMENT=[0-9]*//" > DMS.sql
