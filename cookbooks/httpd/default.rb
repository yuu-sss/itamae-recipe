# Install Apache Web Server
package "httpd"
package "mod_ssl"

service "httpd" do
  action [:enable, :start]
end
