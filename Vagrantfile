# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.synced_folder ".", "/vagrant", type: "rsync", rsync__exclude: "Vagrantfile"
  config.vm.define "sdn" do |sdn|
    sdn.vm.box = "ubuntu/trusty64"
    sdn.vm.hostname = "sdn"
    sdn.vm.network "public_network", bridge: "enp2s0"
    sdn.vm.network "private_network", ip: "192.168.56.101"

    sdn.vm.provider "virtualbox" do |vb|
      vb.memory = 2048
      vb.cpus = 1
    end
  end
end
