# sample-chef-cookbook
A sample cookbook with recipe for AWS OpsWorks 
to set up PHP application using Magento 

## Setup
setup.rb install php and modules used by production
see setup.rb in /app/recipes for details

## Configure
see configure.rb in /app/recipes
configure.rb will configure apache vhosts, php-fpm, cloudflare

## Deploy
deploy.rb will deploy the app in Apps in stack
see deploy.rb in /app/recipes for details
currently, there is Magento app which is configured with correct SSH key and gets the code from the repo 

## Magento
magento.rb will configure magento staging and adds local.xml and start apache and php-fpm
see magento.rb in /app/recipes for details
