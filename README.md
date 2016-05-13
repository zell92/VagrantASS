Vagrant Auto (Progetto Architetture Sistemi Software)
===========

Vagrant project with Tomee and PostgreSQL



HOW TO INSTALL
===========

1. Download and install Virtualbox https://www.virtualbox.org/wiki/Downloads
  * Vagrant is compatible with VirtualBox versions 4.0.x, 4.1.x, 4.2.x, and 4.3.x. Any other version is unsupported and the provider will display an error message.
* Download and install Vagrant http://www.vagrantup.com/downloads.html
  * You **must** download the latest version from site. Your vagrant version (`vagrant -v`) have to be >= 1.4
  * **Ubuntu users:** The package in *Ubuntu Software Center* or in *apt* is **OLD**. Download the new version from site.
* Download and unzip [this repository](https://github.com/Takeno/Vagrant4SIW/archive/master.zip). It contains all Vagrant configurations to build VM.
* Move with your command line to unzipped directory
* Run `vagrant up`
* Test your webserver [here](http://192.168.33.10:8080/Auto/faces/index.jsp)


APPLICATION AUTO
===========

You can find the application used in this project at this link:
[click here](https://github.com/zell92/Auto)
