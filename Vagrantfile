# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "vm-fuseki" do |config|
    config.vm.box = "ubuntu/trusty64"
    config.vm.hostname = "vm-fuseki"
    config.ssh.forward_x11 = true

    # http://fgrehm.viewdocs.io/vagrant-cachier
    if Vagrant.has_plugin?("vagrant-cachier")
      config.cache.scope = :box
    end

    config.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", "2048"]
    end
  end
end
