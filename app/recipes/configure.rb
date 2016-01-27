directory "Create extra directory for vhosts" do
  group "root"
  mode "0775"
  owner "root"
  path "/etc/httpd/conf/extra"
end

# Create vhosts configuration file
template "/etc/httpd/conf/extra/httpd-vhosts.conf" do
	action :create
	mode '0644'
	owner 'root'
	group 'root'
	source "httpd-vhosts.conf.erb"
end

# Create ssl files #
directory "Create extra directory for vhosts" do
  group "root"
  mode "0775"
  owner "root"
  path "/etc/httpd/conf/ssl"
end

template "/etc/httpd/conf/ssl/ssl.crt" do
	action :create
	mode '0644'
	owner 'root'
	group 'root'
	source "ssl.crt.erb"
end

template "/etc/httpd/conf/ssl/ssl.key" do
	action :create
	mode '0644'
	owner 'root'
	group 'root'
	source "ssl.key.erb"
end

template "/etc/httpd/conf/extra/httpd-vhosts.conf" do
	action :create
	mode '0644'
	owner 'root'
	group 'root'
	source "httpd-vhosts.conf.erb"
end

# Create vhosts configuration file
template "/etc/php-fpm.d/www.conf" do
	action :create
	mode '0644'
	owner 'root'
	group 'root'
	source "www.conf.erb"
end

# Easiest way is just append supplemental configuration #
execute "echo 'MaxKeepAliveRequests 100' | sudo tee --append /etc/httpd/conf/httpd.conf"
execute "echo 'KeepAliveTimeout 330' | sudo tee --append /etc/httpd/conf/httpd.conf"
execute "echo 'Include conf/extra/httpd-vhosts.conf' | sudo tee --append /etc/httpd/conf/httpd.conf"

# Additional installation #
# Cloudflare #
execute "sudo yum -y install glibc.i686"
execute "sudo wget https://www.cloudflare.com/static/misc/mod_cloudflare/mod_cloudflare.c"
execute "sudo apxs -a -i -c mod_cloudflare.c"
