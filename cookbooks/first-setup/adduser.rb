# CentOS6 Generic Cloud Image add user
template "/etc/sudoers" do
  action :nothing
  owner "root"
  group "root"
  mode "440"
  source "templates/etc/sudoers.erb"
  variables(
    :username => "#{node['adduser']['username']}"
  )
end

user "create user" do
  action :create
  username "#{node['adduser']['username']}"
  home "/home/#{node['adduser']['username']}"
  password "#{node['adduser']['password']}"
  not_if "id #{node['adduser']['username']}" 
  notifies :create, 'template[/etc/sudoers]'
end

directory "/home/#{node['adduser']['username']}/.ssh" do
 owner "#{node['adduser']['username']}"
 group "#{node['adduser']['username']}"
 mode "700"
 not_if "test -d /home/#{node['adduser']['username']}/.ssh"
end

file "/home/#{node['adduser']['username']}/.ssh/authorized_keys" do
 content "#{node['adduser']['ssh_key']}"
 owner "#{node['adduser']['username']}"
 group "#{node['adduser']['username']}"
 mode "600"
 not_if "test -f /home/#{node['adduser']['username']}/.ssh/authorized_keys"
end
