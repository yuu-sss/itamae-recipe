# Setup CentOS6 Generic Cloud Image
%w{
  ntp
  wget
  bind-utils
  telnet
  sysstat
  screen
  lsof
  yum-utils
  epel-release
}.each do |p|
  package p do
    action :install
  end
end

service "ntpd" do
  action [:enable, :start]
end

service "sysstat" do
  action [:enable, :start]
end

service "iptables" do
  action [:disable, :stop]
end

service "ip6tables" do
  action [:disable, :stop]
end

execute 'disable SELinux' do
  user "root"
  command <<-EOS
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
setenforce 0
EOS
not_if "getenforce | grep disabled"
end

execute "update packages" do
  user "root"
  command "yum -y update"
end
