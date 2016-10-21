# Install PHP5.6 from REMI Repository
execute "remi-repository" do
  command "yum localinstall http://rpms.famillecollet.com/enterprise/remi-release-6.rpm -y"
  not_if "yum repolist all | grep remi"
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
    options "--enablerepo=remi,remi-php56"
  end
end
