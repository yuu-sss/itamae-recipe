# Install modules
%w{
  perl
  mkisofs
  cifs-utils
  mdadm
  lvm2
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
