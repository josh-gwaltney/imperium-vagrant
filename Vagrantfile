# -*- mode: ruby -*-
# vi: set ft=ruby :

API_VERSION = '2'
UBUNTU = 'ubuntu/xenial64'

CONFIG = [
  { '--memory' => '1024' },
  { '--cpus' => '1' }
]

MACHINES = [
  {
    :name => 'web',
    :ip => '192.168.59.140'
  },
  {
    :name => 'api',
    :ip => '192.168.59.141'
  },
  {
    :name => 'mongo',
    :ip => '192.168.59.142'
  },
  {
    :name => 'ansible',
    :ip => '192.168.59.143'
  }
]

Vagrant.configure(API_VERSION) do |config|
  MACHINES.each do |opts|
    config.vm.define opts[:name] do |config|
      config.vm.box = UBUNTU
      config.vm.hostname = opts[:name]
      config.vm.network 'private_network', bridge: 'VirtualBox Host-Only Ethernet Adapter', ip: opts[:ip]
      config.vm.provider 'virtualbox' do |vb|
        CONFIG.each do |hash|
          hash.each do |key, value|
            vb.customize ['modifyvm', :id, key, value]
          end
        end
      end
      # opts[:synced_folders].each do |hash|
      #   hash.each do |folder1, folder2|
      #     config.vm.synced_folder folder1, folder2
      #   end
      # end
      # opts[:provision].each do |script|
      #   config.vm.provision :shell, path: script
      # end
    end
  end
end