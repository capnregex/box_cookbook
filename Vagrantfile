# -*- mode: ruby -*-
# vi: set ft=ruby :

def require_plugin name
  unless Vagrant.has_plugin?(name)
    puts "installing plugin %{ name }"
    %x(vagrant plugin install %{ name })
    puts "Installed!"
    puts "retrying: vagrant #{ARGV}"
    exec 'vagrant', *ARGV
  end
end

require_plugin('vagrant-proxyconf')

# vagrant plugin install vagrant-proxyconf
# vagrant plugin install vagrant-vbguest
# vagrant plugin install vagrant-proxyconf

# binding.pry

Vagrant.configure("2") do |config|

  if Vagrant.has_plugin?("vagrant-proxyconf")
    # to install 
    # vagrant plugin install vagrant-proxyconf
    config.proxy.http     = ENV['http_proxy']
    config.proxy.https    = ENV['https_proxy']
    config.proxy.ftp      = ENV['ftp_proxy']
    config.proxy.no_proxy = ENV['no_proxy']
  end

  config.vm.box = "bento/ubuntu-16.04"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    # vb.name = "xenial"
    vb.memory = "2048"
    # vb.cpus = 2
    # v.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]

    # vb.gui = true
    # vb.memory = "4096"
    # vb.cpus = 2
    vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
    vb.customize ["modifyvm", :id, "--draganddrop", "bidirectional"]
    vb.customize ["modifyvm", :id, "--accelerate3d", "off"]
    vb.customize ["modifyvm", :id, "--vram", "128"]
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
    vb.customize ['modifyvm', :id, '--cableconnected1', 'on']

    # Add a virtual cd drive (for guest additions, etc)
    vb.customize ['storageattach', :id, 
      "--storagectl", "IDE Controller", 
      '--port', 1, 
      '--device', 0, 
      '--type', 'dvddrive',
      '--medium', 'emptydrive'] # 'additions' ?

  end
  
  %w(cookbooks data_bags nodes roles).each do |path|
    Pathname.new(path).mkpath
  end

  # , run: :always
  config.vm.provision "chef_zero" do |chef|
    chef.product = 'chefdk'

    # chef.log_level = 'debug'
    chef.cookbooks_path = "cookbooks"
    chef.data_bags_path = "data_bags"
    chef.nodes_path = "nodes"
    chef.roles_path = "roles"

    chef.http_proxy = ENV['http_proxy']
    chef.https_proxy = ENV['https_proxy']
    # chef.ftp_proxy = ENV['ftp_proxy']
    chef.no_proxy = ENV['no_proxy']
#    chef.json = { proxy: proxy.to_h }

    chef.add_recipe "box"
  end

  # VBoxManage controlvm <vm> pause
  # VBoxManage controlvm <vm> resume
end
