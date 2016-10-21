# Install modules for Target Node
%w{
  perl
  nfs-utils
}.each do |p|
  package p do
    action :install
  end
end

service "rpcbind" do
  action [:enable, :start]
end

service "nfslock" do
  action [:enable, :start]
end
