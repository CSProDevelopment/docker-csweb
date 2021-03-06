# docker-csweb
Docker &amp; docker compose files for [CSWeb](https://www.csprousers.org/help/CSWeb/)

[Docker](https://www.docker.com) is a tool for running applications in containers which simplifies testing and deployment. Docker containers can be run locally for testing and can also be easily deployed to the cloud.

This project contains files that can be used to run CSWeb in a docker container. There are two configurations depending on how you want to use CSWeb:

1) release - this setup automatically downloads the latest CSWeb and installs it in the container. If you just want to run CSWeb use this version.

2) dev - this setup is designed for CSWeb development. It lets you use your own version of CSWeb from a directory that you specify on your local computer. This way you can easily make changes to the CSWeb source code and the container will automatically use any changes you have made. It is up to you to specify the location of the CSWeb source code and place the source code in the directory that you specify.

# Requirements

* Docker - see [https://docs.docker.com/install/]. Choose a version that also installs [docker-compose](https://docs.docker.com/compose/)

* MySQL or MariaDB server - the docker images contain PHP and Apache properly configured for CSWeb however they do not contain a database. Per Docker best practice, the database should be run in a separate container which can be linked to the CSWeb container. The easiest way to do this is to use one of the docker-compose.yml files which create images for CSWeb, MySQL and PhpMyAdmin and run them all.

# Setup - release
* Edit the environment file release/.env to set your own passwords for the MySQL database (DB_ROOT_PASSWORD and DB_PASSWORD)
* In a shell/command prompt enter the docker-csweb/release directory and start docker compose:
```bash
cd release
docker-compose up
```
* In a web browser go to http://localhost/ui and login using the default username and password: _admin_ and _adminadmin_
* You may want to change the admin password from the default
* Note that there is no need to do run the the configuration step, the docker image comes already configured

# Setup - dev
* Edit the environment file dev/.env to set your own passwords for the MySQL database (DB_ROOT_PASSWORD and DB_PASSWORD)
* Also in dev/.env modify CSWWEB_ROOT to point to the directory containing the CSWeb source code on your computer
* In a shell/command prompt enter the docker-csweb/dev directory and start docker compose:
```bash
cd dev
docker-compose up
```
* In a web browser go to http://localhost/setup/configure.php
* Fill out the configuration form as follows:

	|                      |                                          |
	|----------------------|------------------------------------------|
	| Database name        | cspro                                    |
	| Hostname             | mysql                                    |
	| Database username    | cspro                                    |
    | Datapase password    | *use DB_PASSWORD from .env file*         |
    | CSWeb admin password | *choose a password for csweb admin user* |
	| Timezone             | *pick a timezone*                        |
	| Path to files        | /var/www/html/files                      |
	| CSWeb API URL	       | http://localhost/api                     |
