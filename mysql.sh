#!/bin/bash
# modified Version Script from Bash Saad Ismail - me@saadismail.net
# Author name: Ruel Nopal
# Company: RaketHost PH Inc.
# url: www.rakethost.ph

# sudo touch mysql.sh
# sudo chmod 755 mysql.sh
# sudo nano mysql.sh
# ./mysql.sh

# If /root/.my.cnf exists then it won't ask for root password
if [ -f /root/.my.cnf ]; then
	echo "Please enter the NAME of the new database! (example: database1)"
	dbname=$(< /dev/urandom tr -dc _A-Z-a-z | head -c12)
	echo "Enter This DBname or create your own: $dbname"
	read dbname
	echo "Please enter the database CHARACTER SET! (example: latin1, utf8, ...)"
	charset=utf8
	echo "Enter This chartset or set your own: $charset"
	read charset
	echo "Creating new WordPress database..."
	mysql -e "CREATE DATABASE ${dbname} /*\!40100 DEFAULT CHARACTER SET ${charset} */;"
	echo "Database successfully created!"
	echo "Showing existing databases..."
	mysql -e "show databases;"
	echo ""
	echo "Please enter the NAME of the new database user! (example: user1)"
	username=$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c12)
	echo "Enter this DBuser or Create your own: $username"
	read username
	echo "Please enter the PASSWORD for the new database user!"
	userpass=$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c16)
	echo "Enter DBpassword or create your own: $userpass"
	read userpass
	echo "Creating new user..."
	mysql -e "CREATE USER ${username}@localhost IDENTIFIED BY '${userpass}';"
	echo "User and password successfully created!"
	echo ""
	echo "Granting ALL privileges on ${dbname} to ${username}!"
	mysql -e "GRANT ALL PRIVILEGES ON ${dbname}.* TO '${username}'@'localhost';"
	mysql -e "FLUSH PRIVILEGES;"
	
	echo "DBname: $dbname"
	echo "DBuser: $username"
	echo "DBpass: $userpass"
	
	echo "You're good now :)"
	
	exit

	
# If /root/.my.cnf doesn't exist then it'll ask for root password	
else
	echo "Please enter root user MySQL password!"
	read rootpasswd
	echo "Please enter the NAME of the new database! (example: database1)"
	dbname=$(< /dev/urandom tr -dc _A-Z-a-z | head -c12)
	echo "Enter This DBname or create your own: $dbname"
	read dbname
	echo "Please enter the WordPress database CHARACTER SET! (example: latin1, utf8, ...)"
	charset=utf8
	read charset
	echo "Creating new WordPress database..."
	mysql -uroot -p${rootpasswd} -e "CREATE DATABASE ${dbname} /*\!40100 DEFAULT CHARACTER SET ${charset} */;"
	echo "Database successfully created!"
	echo "Showing existing databases..."
	mysql -uroot -p${rootpasswd} -e "show databases;"
	echo ""
	echo "Please enter the NAME of the new database user! (example: user1)"
	username=$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c12)
	echo "Enter this DBuser or Create your own: $username"
	read username
	echo "Please enter the PASSWORD for the new WordPress database user!"
	userpass=$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c16)
	echo "Enter DBpassword or create your own: $userpass"
	echo "Creating new user and password..."
	mysql -uroot -p${rootpasswd} -e "CREATE USER ${username}@localhost IDENTIFIED BY '${userpass}';"
	echo "User successfully created!"
	echo ""
	echo "Granting ALL privileges on ${dbname} to ${username}!"
	mysql -uroot -p${rootpasswd} -e "GRANT ALL PRIVILEGES ON ${dbname}.* TO '${username}'@'localhost';"
	mysql -uroot -p${rootpasswd} -e "FLUSH PRIVILEGES;"

	
	echo "DBname: $dbname"
	echo "DBuser: $username"
	echo "DBpass: $userpass"
	
	echo "You're good now :)"
	
	exit

fi
