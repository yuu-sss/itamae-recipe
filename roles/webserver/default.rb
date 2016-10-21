# Install LAMP from CentOS6 Repository
include_recipe "../../cookbooks/httpd/default.rb"
include_recipe "../../cookbooks/mysql/default.rb"
include_recipe "../../cookbooks/php5/default.rb"
