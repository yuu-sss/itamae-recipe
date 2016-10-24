# Install nginx
remote_file "/etc/yum.repos.d/nginx.repo" do
  action :create
  owner "root"
  group "root"
  mode "644"
  source "templates/etc/yum.repos.d/nginx.repo.erb"
  not_if "test -f /etc/yum.repos.d/nginx.repo"
end

package "nginx" do
  action :install
  not_if "rpm -q nginx"
end
