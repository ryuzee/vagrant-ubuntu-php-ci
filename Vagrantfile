# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # 1つめの仮想マシン
  config.vm.define :develop do |develop|
    develop.omnibus.chef_version = :latest
    develop.vm.hostname = "develop"
    develop.vm.box = "opscode-ubuntu-14.04"
    develop.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-14.04_chef-provisionerless.box"
    develop.vm.network :private_network, ip: "192.168.33.10"

    develop.vm.provision :chef_solo do |chef|
      chef.log_level = "debug"
      chef.cookbooks_path = "./cookbooks"
      chef.json = {
        nginx: {
          docroot: {
            owner: "vagrant", group: "vagrant"
          }
        }
      }
      chef.run_list = %w[
        recipe[base]
      ]
    end
  end

  # 2つめの仮想マシン
  config.vm.define :ci do |ci|
    ci.omnibus.chef_version = :latest
    ci.vm.hostname = "ci"
    ci.vm.box = "opscode-ubuntu-14.04"
    ci.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-14.04_chef-provisionerless.box"
    ci.vm.network :private_network, ip: "192.168.33.100"
  end

  # 3つめの仮想マシン
  config.vm.define :deploy do |deploy|
    deploy.omnibus.chef_version = :latest
    deploy.vm.hostname = "deploy"
    deploy.vm.box = "opscode-ubuntu-14.04"
    deploy.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-14.04_chef-provisionerless.box"
    deploy.vm.network :private_network, ip: "192.168.33.200"
  end
end
