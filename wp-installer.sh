#!/bin/bash
# Author name: Ruel Nopal
# Company: RaketHost PH Inc.
# url: www.rakethost.ph


current_directory=$PWD
user=www-data

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

echo "Removing: wp-installer"
sudo rm -rf wp-installer
echo "Removed: wp-installer"

echo "Removing: wp-installer.sh"
sudo rm -rf wp-installer.sh
echo "Remove: wp-installer.sh"
