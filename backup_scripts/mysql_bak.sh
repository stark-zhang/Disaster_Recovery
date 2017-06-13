#!/bin/bash

# This is a script to backup mysql/maraidb databases.
# And it's similar to apache_bak.sh

# Declare some qutities
day="$(date +%Y%m%d)"
sql_file="bak_name_"$day".sql"
log_error=".mysql_bak_err.log"
bak_folder="/home/backups/$(date +%Y)-$(date +%m)"

# This if-else will tell us the folder exists or not.
# If not, the folder will be created.
if [ ! -d "$bak_folder" ]; then
	mkdir -p "$bak_folder"
fi

# Command excuted
# Mark a date to the log.
# You shoulde modify database before using it.
# You can change the executing logic as you wish, this is just a example. It cannot be used for working.
# You shoule input the user name & password by ypurself, so this is not suitable for automatical action.
echo -e "$(date)\n" >>$bak_folder/$log_error 
read -p "Please input your user name: " -t 15 user
read -p "Please input your password: " -t 15 password
mysqldump -u "$user" -p "$password" database > $bak_folder/$sql_file 1>/dev/null 2>>$bakfolder/$log_error

# Warning!
# This scripts could disclose your database password, so my advice is you should avoid to use it.

# EOF
