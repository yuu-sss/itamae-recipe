# Install PHP7.0 from REMI Repository
execute "remi-repository" do
  command "yum localinstall http://rpms.famillecollet.com/enterprise/remi-release-6.rpm -y"
  not_if "yum repolist all | grep remi"
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
  options "--enablerepo=remi,remi-php70"
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
    options "--enablerepo=remi,remi-php70"
  end
end
