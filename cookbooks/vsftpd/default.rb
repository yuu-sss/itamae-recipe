# Install vsftpd

remote_file "/etc/vsftpd/vsftpd.conf" do
  action :nothing
  owner "root"
  group "root"
  mode "600"
  source "templates/etc/vsftpd/vsftpd.conf.erb"
end

remote_file "/etc/vsftpd/chroot_list" do
  action :nothing
  owner "root"
  group "root"
  mode "600"
  source "templates/etc/vsftpd/chroot_list.erb"
end

package "vsftpd" do
  action :install
  not_if "rpm -q vsftpd"
  notifies :create, 'remote_file[/etc/vsftpd/vsftpd.conf]'
  notifies :create, 'remote_file[/etc/vsftpd/chroot_list]'
end

service "vsftpd" do
  action [:enable, :start]
end
