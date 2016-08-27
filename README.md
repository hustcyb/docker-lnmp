# docker-lnmp
This repository contains example Docker compose files for nginx, php, mysql.

1.  Preparation 
First, make sure you have installed docker compose. If you don't know how to install it, you can refer the docker compose docs:  
[Install Docker Compose](https://docs.docker.com/compose/install/)  
Attention, for windows users, your system need to be 64bit window 10 pro. if your system is windows 7, just like me, you have another choice, docker toolbox. And you can refer the docs through the following link:  
[https://docs.docker.com/engine/installation/windows/#/docker-toolbox](https://docs.docker.com/engine/installation/windows/#/docker-toolbox "Docker Toolbox")

2. Download repository files  
You can checkout the repository files using git tools.Rr you can download directly the zip file, and upzip it.

3. Running the docker compose file.  
Open a terminal window, if you are using docker toolbox, you have to run the "Docker Quickstart Terminal" to get the terminal window. 
Next, change path to repository root folder, using the cd command. Make sure the docker-compose.yml file is under the folder. And run run the following command:  
`docker-compose up -d`  
Now, open the web browser, and visit the following address:  
[http://localhost/info.php](http://localhost/info.php)  
The host may be different. For me, I'm using the docker toolbox, and my docker machine ip address is 192.168.99.100, so I have to visit the following address:  
[http://192.168.99.100/info.php](http://192.168.99.100/info.php)  
To test whether the mysql connection is ok, you can visit the test.php. If your docker machine ip address is 192.168.99.100, then the address is:  
[http://192.168.99.100/test.php](http://192.168.99.100/test.php)

4. Nginx  
Nginx configuration is under the nginx folder. And the hierarchy the same as the nginx container. A default site with php supported configured in the "etc/nginx/conf.d/default.conf". You can change the configuration for yourself.

5.  PHP  
The official php docker image doesn't install the mysql extension, but it provides docker-php-ext-install script to install extensions. So I write my dockerfile from offical php image, and install the pdo_mysql extention through the docker-php-ext-install script. If you have to install more extensions, you can refer the php official image docs:  
[https://hub.docker.com/_/php/](https://hub.docker.com/_/php/)

6. MySQL  
The official mysql image provides many environments to custom mysql. And docker compose file under the repository use these environment virables to define the mysql user, password and database. I put a testing sql script under mysql/docker-entrypoint-initdb.d folder: test.sql. It creates a student table in the test database. If you have more initialization sql scripts, you can put them under this folder. And I also add a volume to the mysql/var/lib/mysql folder, so that changes will persist after mysql contaier restarts. For more informat about the mysql official image, you can refer the following link:  
[https://hub.docker.com/_/mysql/](https://hub.docker.com/_/mysql/)
7. Site  
The html and php files for the default site are under the www/var/www/html folder, and there are only 3 files:  
*index.html* it just prints Hello World to the screen and is for testing whether the nginx container is runing.  
*info.php* it prints php informations using the phpinfo() function and is for testing whether the php container is running.  
*test.php* it connects the mysql container, gets and prints records from the student table. It is for testing whether the connection between php container and mysql is ok.  
You replace the folder content with your own site.