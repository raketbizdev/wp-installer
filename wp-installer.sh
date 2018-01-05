#!/bin/bash
# Author name: Ruel Nopal
# Company: RaketHost PH Inc.
# url: www.rakethost.ph


current_directory=$PWD
user=www-data
echo $current_directory
sudo wget https://wordpress.org/latest.tar.gz
sudo tar -xzvf latest.tar.gz
sudo chmod 755 -R wordpress
echo "Change Permision " 
sudo rm -rf latest.tar.gz
echo "Remove latest.tar.gz"
sudo chown $user:$user -R wordpress
echo "Change User Data to: $user"
sudo mv wordpress $current_directory

echo "Done installing WP to: $current_directory"
sudo rm -rf wp-installer.sh
echo "wp-installer.sh"
