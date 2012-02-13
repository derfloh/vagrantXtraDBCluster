Vagrant::Config.run do |config|

  config.vm.define :haproxy do |vm_config|
    vm_config.vm.box = "debian-squeeze-64-rvm"
    vm_config.vm.box_url = "https://s3-eu-west-1.amazonaws.com/rosstimson-vagrant-boxes/debian-squeeze-64-rvm.box"

    vm_config.vm.network :hostonly, "10.0.3.40"

    vm_config.vm.customize ["modifyvm", :id, "--memory", "256"]
    vm_config.vm.customize ["modifyvm", :id, "--name", "haproxy"]

    vm_config.vm.forward_port 22,   2208
    vm_config.vm.forward_port 80,   8080
    vm_config.vm.forward_port 3306, 3306

    vm_config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      chef.add_recipe("xtradbcluster::haproxy")
    end

  end


  config.vm.define :node1 do |vm_config|
    vm_config.vm.box = "debian-squeeze-64-rvm"
    vm_config.vm.box_url = "https://s3-eu-west-1.amazonaws.com/rosstimson-vagrant-boxes/debian-squeeze-64-rvm.box"

    vm_config.vm.network :hostonly, "10.0.3.10"

    vm_config.vm.customize ["modifyvm", :id, "--memory", "1024"]
    vm_config.vm.customize ["modifyvm", :id, "--name", "node1"]

    vm_config.vm.forward_port 22, 2205

    vm_config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      chef.add_recipe("xtradbcluster::checks")
      chef.add_recipe("xtradbcluster")

      chef.json.merge!( :xtradbcluster => { :cluster_ip => "", :name => "node1", :recv_ip => "10.0.3.10" })
    end


  end

  config.vm.define :node2 do |vm_config|
    vm_config.vm.box = "debian-squeeze-64-rvm"
    vm_config.vm.box_url = "https://s3-eu-west-1.amazonaws.com/rosstimson-vagrant-boxes/debian-squeeze-64-rvm.box"

  vm_config.vm.network :hostonly, "10.0.3.20"

    vm_config.vm.customize ["modifyvm", :id, "--memory", "1024"]
    vm_config.vm.customize ["modifyvm", :id, "--name", "node2"]

    vm_config.vm.forward_port 22, 2206

    vm_config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      chef.add_recipe("xtradbcluster::checks")
      chef.add_recipe("xtradbcluster")

      chef.json.merge!( :xtradbcluster => { :cluster_ip => "10.0.3.10", :name => "node2", :recv_ip => "10.0.3.20" })
    end

  end

  config.vm.define :node3 do |vm_config|
    vm_config.vm.box = "debian-squeeze-64-rvm"
    vm_config.vm.box_url = "https://s3-eu-west-1.amazonaws.com/rosstimson-vagrant-boxes/debian-squeeze-64-rvm.box"

  vm_config.vm.network :hostonly, "10.0.3.30"

    vm_config.vm.customize ["modifyvm", :id, "--memory", "1024"]
    vm_config.vm.customize ["modifyvm", :id, "--name", "node3"]

    vm_config.vm.forward_port 22, 2207

    vm_config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      chef.add_recipe("xtradbcluster::checks")
      chef.add_recipe("xtradbcluster")

      chef.json.merge!( :xtradbcluster => { :cluster_ip => "10.0.3.10", :name => "node3", :recv_ip => "10.0.3.30" })
    end

  end



end
