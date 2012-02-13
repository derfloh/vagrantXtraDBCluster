
template "/etc/apt/sources.list.d/percona.list" do
  source "percona.list.erb"
  owner "root"
  group "root"
  mode 0755
end

execute "apt update" do
  command "apt-get update"
end


%w{curl rsync libaio1 libnet-daemon-perl libplrpc-perl libdbi-perl}.each do |nPackage|
  package nPackage do
    action :install
  end
end


directory "/etc/mysql" do
  owner "root"
  group "root"
  mode "0755"
  action :create
  not_if { ::File.exists?("/etc/mysql") }
end

template "/etc/mysql/my.cnf" do
  source "my.cnf.erb"
  owner "root"
  group "root"
  mode 0755
end


require_recipe "xtradbcluster::fetchPackages"

