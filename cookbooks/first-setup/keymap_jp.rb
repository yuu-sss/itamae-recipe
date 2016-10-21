# change keymap to jp106
remote_file "/etc/sysconfig/keyboard" do
  action :nothing
  owner "root"
  group "root"
  mode "644"
  source "templates/etc/sysconfig/keyboard.erb"
end

execute "loadkeys" do
  only_if "grep 'KEYTABLE=\"us\"' /etc/sysconfig/keyboard"
  user "root"
  command "loadkeys jp106"
  notifies :create, 'remote_file[/etc/sysconfig/keyboard]'
end
