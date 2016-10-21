# Install vsftpd
package "vsftpd"

# Config file

service "vsftpd" do
  action [:enable, :start]
end
