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
 
# fare il redirect della cartella vigrant/webapps con /opt/tomee-1.7.4/webapps (non mi ricordo come funziona per il contenuto e la struttura)
 
 file { '/opt/tomee-1.7.4/webapps/auto.war':
	require => Exec['unpack-tomee'],
	target => '/vagrant/webapps/auto.war',
	ensure => link,
	force => true
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
