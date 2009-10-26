rem 备份users.elephantbase.net主库
mysqldump -hlocalhost -uroot -p**** test uc_members tb_users > "users.elephantbase.net_%DATE%.txt"
rem 压缩备份文件
zip "users.elephantbase.net_%DATE%.zip" "users.elephantbase.net_%DATE%.txt"
del "users.elephantbase.net_%DATE%.txt"