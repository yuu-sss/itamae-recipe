# Install cloud-utils-growpart for CentOS6

execute 'extend-partition' do
  user "root"
  command "growpart /dev/vda 1"
  action :nothing
end

package "cloud-utils-growpart" do
  not_if 'rpm -q cloud-utils-growpart'
  action :install
  notifies :run, 'execute[extend-partition]', :immediately
end
