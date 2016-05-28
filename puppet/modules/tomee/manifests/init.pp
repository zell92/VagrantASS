class tomee {

  file {"/opt/tomee-1.7.4":
    ensure => directory,
    recurse => true
 } ->
 
 exec { "download-tomee" :
	command => "/usr/bin/wget http://it.apache.contactlab.it/tomee/tomee-1.7.4/apache-tomee-1.7.4-jaxrs.tar.gz -O /tmp/apache-tomee-1.7.4-jaxrs.tar.gz",
	creates => "/tmp/tomee-1.7.4.tar.gz",
 } ->

 exec { "unpack-tomee" : 
	command => "/bin/tar -xzf /tmp/apache-tomee-1.7.4-jaxrs.tar.gz -C /opt/tomee-1.7.4 --strip-components=1",
	creates => "/opt/tomee-1.7.4/bin",
 } ->
 
    file { "/opt/tomee-1.7.4/conf/tomee.xml":
		require => Exec['unpack-tomee'],
        mode => "0644",
        owner => 'root',
        group => 'root',
        source => 'puppet:///modules/tomee/tomee.xml',
    } ->
	
	file { "/opt/tomee-1.7.4/conf/tomcat-users.xml":
		require => Exec['unpack-tomee'],
        mode => "0644",
        owner => 'root',
        group => 'root',
        source => 'puppet:///modules/tomee/tomcat-users.xml',
    } ->
	
	file { "/opt/tomee-1.7.4/lib/postgresql-jdbc4.jar":
		require => Exec['unpack-tomee'],
        mode => "0644",
        owner => 'root',
        group => 'root',
        source => 'puppet:///modules/tomee/postgresql-jdbc4.jar',
    } ->

	file { "/opt/tomee-1.7.4/lib/javax.ws.rs-api-2.0.1.jar":
		require => Exec['unpack-tomee'],
        mode => "0644",
        owner => 'root',
        group => 'root',
        source => 'puppet:///modules/tomee/javax.ws.rs-api-2.0.1.jar',
    } ->

 file { '/opt/tomee-1.7.4/webapps/Auto.war':
	require => Exec['unpack-tomee'],
	target => '/vagrant/webapps/Auto.war',
	ensure => link,
	force => true
	} ->
file { '/opt/tomee-1.7.4/webapps/AutoRest.war':
	require => Exec['unpack-tomee'],
	target => '/vagrant/webapps/AutoRest.war',
	ensure => link,
	force => true
	} ->

 
 exec { "startup" :
	command => "/bin/echo $'#!/bin/sh -e\n/opt/tomee-1.7.4/bin/startup.sh\nexit 0' > /etc/rc.local"
	} ->
	
 service { "tomee" :
    provider => "init",
    ensure => running,
    start => "/opt/tomee-1.7.4/bin/startup.sh",
    stop => "/opt/tomee-1.7.4/bin/shutdown.sh",
    status => "",
    restart => "",
    hasstatus => false,
    hasrestart => false,
    require => [ Exec["unpack-tomee"], Package["openjdk-7-jre"], Package["openjdk-7-jdk"] ]
  }
 
}
