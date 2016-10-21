# Install MySQL 5.6 Community Server
execute "mysql-repository" do
  command "yum localinstall http://dev.mysql.com/get/mysql57-community-release-el6-7.noarch.rpm -y"
  not_if "yum repolist all | grep mysql"
end

execute "disable mysql57-community" do
  command <<-EOS
yum-config-manager --disable mysql57-community
yum-config-manager --enable mysql56-community
EOS
  only_if "yum repolist all | grep mysql"
end

package "mysql-community-server" do
  action :install
  not_if "rpm -q mysql-community-server"
end
