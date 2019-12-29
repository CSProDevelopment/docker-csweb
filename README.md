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

# Setup - dev
