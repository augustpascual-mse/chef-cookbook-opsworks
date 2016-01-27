execute "sudo mkdir /var/www/html/domain.com"

execute "sudo ln -s /srv/www/staging/current/ /var/www/html/domain.com/"

template "/var/www/html/domain.com/current/public-web/index.php" do
	action :create
	mode '0644'
	owner 'deploy'
	group 'apache'
	source "index.php.erb"
end

template "/var/www/html/domain.com/current/public-web/app/etc/local.xml" do
	action :create
	mode '0655'
	owner 'deploy'
	group 'apache'
	source "local.xml.erb"
end

execute "sudo chmod -R 775 /var/www/html/domain.com/current/public-web/var/"
execute "sudo chown -R apache:apache /var/www/html/domain.com/current/public-web/media/"
execute "sudo chmod -R 766 /var/www/html/domain.com/current/public-web/media/"

execute "sudo service httpd start"
execute "sudo service php-fpm start"
