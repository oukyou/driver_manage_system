mysqldump -d -uroot -ppnecobassystem777 dms | sed "s/AUTO_INCREMENT=[0-9]*//" > DMS.sql
