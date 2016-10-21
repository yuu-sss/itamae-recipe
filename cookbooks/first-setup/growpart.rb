# Install cloud-utils-growpart for CentOS6
package "cloud-utils-growpart" do
  not_if 'rpm -q cloud-utils-growpart'
end

#execute 'Extend root partition' do
#  user "root"
#  command "growpart /dev/vda 1"
#end
