# Install MySQL Community Server
remote_file "/etc/my.cnf" do
  action :nothing
  owner "root"
  group "root"
  mode "644"
  source "templates/etc/my.cnf.erb"
end

package "mysql-server" do
  action :install
  not_if "rpm -q mysql-server"
  notifies :create, 'remote_file[/etc/my.cnf]'
end

service "mysqld" do
  action [:enable, :start]
end
