# change keymap to jp106

if "#{node['info']['os']}" == "centos" && "#{node['info']['release']}" == "6" then
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
end

if "#{node['info']['os']}" == "centos" && "#{node['info']['release']}" == "7" then
  execute "set-keymap" do
    not_if "grep 'KEYMAP=\"jp106\"' /etc/vconsole.conf"
    user "root"
    command "localectl set-keymap jp106"
  end
end
