  package "haproxy" do
    action :install
  end

directory "/etc/haproxy" do
  owner "root"
  group "root"
  mode "0755"
  action :create
  not_if { ::File.exists?("/etc/haproxy") }
end


template "/etc/haproxy/haproxy.cfg" do
  source "haproxy.conf.erb"
  owner "root"
  group "root"
  mode 0755
end

template "/etc/default/haproxy" do
  source "haproxy.erb"
  owner "root"
  group "root"
  mode 0755
end


service "haproxy" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end