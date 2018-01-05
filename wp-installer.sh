#!/bin/bash
# Author name: Ruel Nopal
# Company: RaketHost PH Inc.
# url: www.rakethost.ph

echo "Most directory in newly created server is under \'/var/www/html/\'. if you created new user it will be \'/home/username/\'"
current_directory=$PWD
user=$(whoami)

# install wp cli
if [ -f /usr/local/bin/wp ]; then
  echo "Wp CLI is already installed in this machine!"
  wp --info

else
  echo "Installing WP CLI"
  sudo wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

  echo "Change Permission of WP CLI"
  sudo chmod +x wp-cli.phar

  echo "Move wp-cli.phar /usr/local/bin/wp"
  sudo mv wp-cli.phar /usr/local/bin/wp

  wp --info
  echo "WP Cli Successfully Installed!"
fi

echo "Downloading WP latest Files." 

sudo wget https://wordpress.org/latest.tar.gz

echo "Unzipping latest.tar.gz." 
sudo tar -xzvf latest.tar.gz

echo "latest.tar.gz to wordpress" 
echo "Changing Permissions to 755" 
sudo chmod 755 -R wordpress
echo "Permision Change." 


echo "Removing: latest.tar.gz"
sudo rm -rf latest.tar.gz
echo "Remove latest.tar.gz"

echo "Change the User to Current User" 
sudo chown $user:$user -R wordpress
echo "User Data now: $user"

echo "Moving to Current Directory" 
sudo mv wordpress/* $current_directory

echo "Done Moving to: $current_directory"

echo "Enter the DB name you generated from Mysql.sh"
read dbname
echo "Databasename: ${dbname}"

echo "Enter the DB User you generated from Mysql.sh"
read dbuser
echo "Username: ${dbuser}"

echo "Enter the DB password you generated from Mysql.sh"
read dbpass
echo "Password: ${dbpass}"

echo "Default DB Host: localhost"
read dbhost
echo "Database Host: ${dbhost}"

echo "Default DB Prefix: wp_"
read dbprefix
echo "Database Prefix: ${dbprefix}"


wp config create --dbname=${dbname} --dbuser=${dbuser} --dbpass=${dbpass} --dbprefix=${dbpass} --dbhost=${dbhost}

echo "wp-config.php successfully created."

echo "Enter your domain URL"
read url

echo "Enter your Website Title"
read title

echo "Enter your Website admin User"
user=$(< /dev/urandom tr -dc _A-Z-a-z | head -c12)
echo "Enter generated Username: $user or Create your own."
read admin_user

echo "Enter your Website admin Password"
pass=$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c16)
echo "Enter generated Password: $pass or Create your own. "
read admin_password

echo "Enter your Website admin Email"
read admin_email

wp core install --url=${url} --title=biz --admin_user=${admin_user} --admin_password=${admin_password} --admin_email=${admin_emai}
echo "your wordpress is ready to rock goodluck."

echo "Removing: wp-installer"
sudo rm -rf wp-installer
echo "Removed: wp-installer"


echo "Removing: mysql.sh"
sudo rm -rf mysql.sh
echo "Remove: mysql.sh"

echo "Removing: wp-installer.sh"
sudo rm -rf wp-installer.sh
echo "Remove: wp-installer.sh"

