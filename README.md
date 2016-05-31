Vagrant Auto (Progetto Architetture Sistemi Software)
===========

Vagrant project with Tomee and PostgreSQL.
This is an application to manage a car shop. You can insert cars, and carmaker and analyze all your product.
We work with two virtual machines, one for web server and a second for database server.


HOW TO INSTALL
===========

1. Download and install Virtualbox https://www.virtualbox.org/wiki/Downloads
* Download and install Vagrant http://www.vagrantup.com/downloads.html
  * You **must** download the latest version from site. Your vagrant version (`vagrant -v`) have to be >= 1.4
  * **Ubuntu users:** The package in *Ubuntu Software Center* or in *apt* is **OLD**. Download the new version from site.
* Download and unzip [this repository](https://github.com/zell92/VagrantASS/archive/master.zip). It contains all Vagrant configurations to build VM.
* Move with your command line to unzipped directory
* Run `vagrant up` or launch `./startup.bat` to start up the two virtual machines
* Test our application [here](http://192.168.33.10:8080/auto/)
* At the end, run `vagrant halt` or launch `./shutdown.bat` to shutdown the two virtual machines


APPLICATION AUTO
===========

You can find the application used in this project at this link:
[click here](https://github.com/zell92/Auto)


APPLICATION AUTO-REST
===========
You can find the application used in this project (REST VERSION) at this link:
[click here](https://github.com/zell92/AutoRest)


HOW TO USE APPLICATION AUTO-REST
===========

* Run `vagrant up` or launch `./startup.bat` to start up the two virtual machines
* Launch `ClientREST.bat` to start up the two virtual machines
	* You **must** download and install cUrl on your windows machine. 
