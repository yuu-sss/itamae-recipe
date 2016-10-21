# Install PHP5 from CentOS Repository + EPEL Repository
package "epel-release" do
  action :install
  not_if "rpm -q epel-release"
end

remote_file "/etc/php.ini" do
  action :nothing
  owner "root"
  group "root"
  mode "644"
  source "templates/etc/php.ini.erb"
end

package "php" do
  action :install
  not_if "rpm -q php"
  notifies :create, 'remote_file[/etc/php.ini]'
end

%w{
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
