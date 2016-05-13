class postgresql{ 

package { 'postgresql':
#	name => postgresql,
	ensure => installed
} ->

	file { "/etc/postgresql/9.3/main/postgresql.conf":
		force => true,
        mode => "0644",
        owner => 'postgres',
        group => 'postgres',
        source => 'puppet:///modules/postgresql/postgresql.conf',
		require => [Package["postgresql"]],
    } ->
	
 	file { "/etc/postgresql/9.3/main/pg_hba.conf":
		force => true,
        mode => "0644",
        owner => 'postgres',
        group => 'postgres',
        source => 'puppet:///modules/postgresql/pg_hba.conf',
		require => [Package["postgresql"]],
    } ->

	service { 'postgresql':
#		name => postgresql,
		ensure => running,
		enable => true,
#		hasstatus => true,
#		require => [Exec["listener"], Exec["connection"] ]
	} ->

 exec { "set_password" : 
	command => "/usr/bin/sudo -u postgres psql postgres -c \"ALTER USER postgres PASSWORD 'postgres';\" ",
	require => [Service["postgresql"]],
 } ->
 
 exec { "restart" : 
	command => "/usr/sbin/service postgresql restart",
	require => [Service["postgresql"],Exec["set_password"]],
 }
 
 

}