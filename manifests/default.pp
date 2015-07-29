node default {
	class { 'mysql::server':
	package_name => 'mariadb-server',
}

class { 'mysql::client':
package_name => 'mariadb-client',
}

# pull values from Hiera

$user = hiera('database_user')
$password = hiera('database_password')
$host = hiera('database_host')
$grant = hiera('database_grant')

# configure a database with an user

mysql::db { 'database':
	user => $user,
	password => $password,
	host => $host,
	grant => [$grant],
}

# edit my.cnf to allow connections from any address

file_line { 'bind-address = ::':
	ensure => 'present',
	path => '/etc/mysql/my.cnf',
	line => 'bind-address = ::',
	match => '^bind-address = 127.0.0.1',
	notify => Service['mysql'],
}

# edit /etc/hosts to allow all connections to mysql

file_line { '/etc/hosts':
	ensure => 'present',
	path => '/etc/hosts',
	line => 'mysqld: ALL',
	notify => Service['mysql'],
}

}