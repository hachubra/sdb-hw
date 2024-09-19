docker compose up
sudo dpkg -i /home/alex/Downloads/dbeaver-ce_24.2.0_amd64.deb 

mkdir /home/alex/mysql/dbdata/dump
cd /home/alex/mysql/dbdata/dump
curl --output /home/alex/mysql/dbdata/dump/sakila-db.zip https://downloads.mysql.com/docs/sakila-db.zip 
ls
unzip sakila-db.zip
ls


docker exec -it mysql mysql -u sys_temp -p sys
CREATE DATABASE sakila;
exit
 mysql -u sys_temp -p sakila < /var/lib/mysql/dump/sakila-db/sakila-schema.sql 
 mysql -u sys_temp -p sakila < /var/lib/mysql/dump/sakila-db/sakila-data.sql 


 #список всех таблиц
 mysql -u sys_temp -p sakila

 show tables;
 
