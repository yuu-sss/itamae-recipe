# localtime to JST

service "rsyslog" do
  action :nothing
end

remote_file "/etc/sysconfig/clock" do
  action :nothing
  owner "root"
  group "root"
  mode "644"
  source "templates/etc/sysconfig/clock.erb"
end

execute "localtime to JST" do
  not_if "grep 'Asia/Tokyo' /etc/sysconfig/clock"
  user "root"
  command "cp -p /usr/share/zoneinfo/Japan /etc/localtime"
  notifies :restart, "service[rsyslog]"
  notifies :create, resources( :remote_file => "/etc/sysconfig/clock" )
end
