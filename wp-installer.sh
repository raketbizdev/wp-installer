#!/bin/bash
# Author name: Ruel Nopal
# Company: RaketHost PH Inc.
# url: www.rakethost.ph


current_directory=pwd
echo $current_directory
sudo wget https://wordpress.org/latest.tar.gz
sudo tar -xzvf latest.tar.gz
sudo chmod 755 -R wordpress
sudo shown www-data:www-data -R wordpress
sudo mv wordpress $current_directory

echo "Done installing WP to: $current_directory"
