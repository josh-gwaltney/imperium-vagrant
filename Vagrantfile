# -*- mode: ruby -*-
# vi: set ft=ruby :

API_VERSION = '2'
UBUNTU = 'ubuntu/xenial64'

CONFIG = [
  { '--memory' => '1024' },
  { '--cpus' => '1' }
]

NETWORK = {
 :type => 'private_network',
 :bridge => 'VirtualBox Host-Only Ethernet Adapter'
}

PROVISION_SCRIPT = 'provision.sh'

MACHINES = [
  {
    :name => 'web',
    :ip => '192.168.59.140',
    :folders => [
      { 'web' => '/home/ubuntu/web' }
    ]
  },
  {
    :name => 'api',
    :ip => '192.168.59.141',
    :folders => [

    ]
  },
  {
    :name => 'mongodb',
    :ip => '192.168.59.142',
    :folders => [

    ]
  },
  {
    :name => 'ansible',
    :ip => '192.168.59.143',
    :folders => [
        { 'ansible' => '/home/ubuntu/ansible' }
    ]
  }
]

Vagrant.configure(API_VERSION) do |config|
  MACHINES.each do |opts|
    config.vm.define opts[:name] do |config|
      config.vm.box = UBUNTU
      config.vm.hostname = opts[:name]
      config.vm.network NETWORK[:type], bridge: NETWORK[:bridge], ip: opts[:ip]
      config.vm.provider 'virtualbox' do |vb|
        CONFIG.each do |hash|
          hash.each do |key, value|
            vb.customize ['modifyvm', :id, key, value]
          end
        end
      end
      config.vm.synced_folder ".", "/vagrant", disabled: true
      opts[:folders].each do |hash|
        hash.each do |folder1, folder2|
          config.vm.synced_folder folder1, folder2
        end
      end
      config.vm.provision :shell, path: PROVISION_SCRIPT
    end
  end
end