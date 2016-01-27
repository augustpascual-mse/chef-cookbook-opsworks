['php55',
'php55-mbstring',
'php55-mcrypt',
'php55-xmlrpc',
'php55-pdo',
'php55-mysqlnd',
'php55-soap',
'php55-gd',
'php55-fpm',
'php55-pecl-apc',
'php55-pecl-imagick',
'php55-pecl-memcached',
'php55-pecl-memcache',
'php55-pecl-redis',
'php55-gmp',
'libtool',
'httpd24-devel',
'mod24_ssl'].each do |pkg|
	package pkg do
		action :install
	end
end
