# Piwigo (Docker Compose) Development Environment
This project will create you an localhost environment for you to test & develop against for [Piwgio Image Gallery](https://piwigo.org/). It comes with a Maria Database, PhpMyAdmin and the webstack for Piwigo. Additionally, it fully initalizes the database and establishes connection to the database upon creation. The only thing it does not come loaded with are the pictures and albums which maybe a consideration in the future but for now sample albums are excluded.


## Dependancies:

This project depends on the Docker Engine please install prior to using following the [Docker Engine Instructions](https://docs.docker.com/engine/install/).


## Setup


#### .env
The MariaDB database username and password is set here. If the passwords are modified here, they must be updated in `data/piwigo-init/database.inc.php`. No modification is necessary to have this work out of the box.

## Accessing the environment

* Everything is bound to `localhost`. 
    * Browse to [http://localhost](http://localhost) for the Piwigo installation
        * The default login for Piwigo is `admin/admin`
    * Browse to [http://localhost:8800](http://localhost:8800) for PhpMyAdmin
        * The default database for PhpMyAdmin is `piwigo-dev-db` and default login for that database is: `piwigo-dev-db/piwigo-dev-db`
        
* The base of the webserver points to `data/piwigo/config/www` which you can simply navigate to.

***

This project is [GNU LGPLv3](LICENSE).

Piwigo is [GNU GPLv2](https://github.com/Piwigo/Piwigo/blob/master/LICENSE.txt).
