# WP Installer

This bash is a wordpress and mysql database creator. This simple script comes in handy if you are using a non standard wordpress hosting like digitalocean or amazon aws where access to cpanel is not available.

**How to use**


Clone the code 
```
sudo git clone https://github.com/radon1284/wp-installer.git
```
**create database**

1. Move mysql.sh to current directory
```
sudo mv wp-installer/mysql.sh $PWD
```
2. Once move change the user permission to 775
```
sudo chmod +x mysql.sh
```
3. Run the command
```
./mysql.sh
```
4. Save the Database name, Username and password as you need it on wp-installer.sh

**Run The WP Installer Command**

1. Move wp-installer.sh to current directory 
```
sudo mv wp-installer/wp-installer.sh $PWD
```
2. Once move change the user permission to 775
```
sudo chmod +x wp-installer.sh
```
3. Run the command
```
./wp-installer.sh
```
