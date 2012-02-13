template "/etc/apt/sources.list.d/percona.list" do
  source "percona.list.erb"
  owner "root"
  group "root"
  mode 0755
end

execute "apt update" do
  command "apt-get update"
end

  package "apache2" do
    action :install
  end

 package "php5-mysql" do
   action :install
   options "--force-yes"
 end

template "/etc/apache2/sites-enabled/check-site" do
  source "check-site.erb"
  owner "root"
  group "root"
  mode 0755
end

execute "a2dissite" do
  command "a2dissite 000-default"
end

service "apache2" do
  action :restart
end