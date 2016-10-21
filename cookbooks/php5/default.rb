# Install PHP5 from CentOS Repository + EPEL Repository
package "epel-release" do
  action :install
  not_if "rpm -q epel-release"
end

%w{
  php
  php-gd
  php-pear
  php-mbstring
  php-pdo
  php-mysql
  php-mcrypt
}.each do |p|
  package p do
    action :install
  end
end
