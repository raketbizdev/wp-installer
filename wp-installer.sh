#!/bin/bash
# Author name: Ruel Nopal
# Company: RaketHost PH Inc.
# url: www.rakethost.ph


current_directory=$PWD
user=$(whoami)

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

echo "Enter your domain URL"
read url

echo "Enter your Website Title"
read title

echo "Enter your Website admin User"
user=$(< /dev/urandom tr -dc _A-Z-a-z | head -c12)
echo "Enter generated Username: $user or Create your own."
read admin_user

echo "Enter your Website admin Password"
pass=$(< /dev/urandom tr -dc _A-Z-a-z | head -c12)
echo "Enter generated Password: $pass or Create your own. "
read admin_password

echo "Enter your Website admin Email"
read admin_email



wp core install --url=${url} --title=biz --admin_user=${admin_user} --admin_password=${admin_password} --admin_email=${admin_emai}

echo "Removing: wp-installer"
sudo rm -rf wp-installer
echo "Removed: wp-installer"


echo "Removing: wp-installer.sh"
sudo rm -rf wp-installer.sh
echo "Remove: wp-installer.sh"

