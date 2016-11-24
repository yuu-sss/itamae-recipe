# Install PHP5.6 from REMI Repository
if "#{node['info']['os']}" == "centos" && "#{node['info']['release']}" == "7" then
  url = "http://rpms.famillecollet.com/enterprise/remi-release-7.rpm"
else
  url = "http://rpms.famillecollet.com/enterprise/remi-release-6.rpm"
end

execute "remi-repository" do
  command "yum localinstall #{url} -y"
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
  options "--enablerepo=remi,remi-php56"
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
    options "--enablerepo=remi,remi-php56"
  end
end
