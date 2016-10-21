# Install MySQL5.6 Community-Serer, PHP 5.6
include_recipe "../../cookbooks/httpd/default.rb"
include_recipe "../../cookbooks/mysql56/default.rb"
include_recipe "../../cookbooks/php5-remi/default.rb"
