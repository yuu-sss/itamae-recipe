# Install MySQL Community Server
package "mysql-server" do
  action :install
  not_if "rpm -q mysql-server"
end
