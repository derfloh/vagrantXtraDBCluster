

base = 'http://www.percona.com/downloads/Percona-XtraDB-Cluster/5.5.17-alpha22.1/deb/squeeze/'

dlFiles = [
  "#{base}libmysqlclient18_5.5.17-22.1-3691.squeeze_amd64.deb",
  "#{base}libmysqlclient-dev_5.5.17-22.1-3691.squeeze_amd64.deb",
  "#{base}percona-xtradb-cluster-common-5.5_5.5.17-22.1-3691.squeeze_all.deb",
  "#{base}percona-xtradb-cluster-client-5.5_5.5.17-22.1-3691.squeeze_amd64.deb",
  "http://www.percona.com/downloads/XtraBackup/BETA/1.9.0/deb/squeeze/xtrabackup_1.9.0-385.squeeze_amd64.deb",
  "#{base}percona-xtradb-cluster-galera_0.1-1_amd64.deb",
  "#{base}percona-xtradb-cluster-server-5.5_5.5.17-22.1-3691.squeeze_amd64.deb",
  "#{base}percona-xtradb-cluster-test-5.5_5.5.17-22.1-3691.squeeze_all.deb",
]


dlFiles.each do |dlFile|
  dlLocalFile = File.basename(dlFile)
  remote_file "/vagrant/packages/#{dlLocalFile}" do
    source dlFile
    mode "0644"
    not_if {File.exists?("/vagrant/packages/#{dlLocalFile}")}
  end
end

# now install
dlFiles.each do |dlFile|
  dlLocalFile = File.basename(dlFile)
  log "Install #{dlLocalFile}"

  package dlLocalFile do
    action :install
    source "/vagrant/packages/#{dlLocalFile}"
    provider Chef::Provider::Package::Dpkg
  end

end

