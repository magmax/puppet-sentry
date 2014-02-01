# -*- coding:utf-8; tab-width:4; mode:ruby -*-
# vi: set ft=ruby :


Vagrant::Config.run do |config|

  config.vm.define :sentry do |c|
    c.vm.box = 'wheeze64'
    c.vm.box_url =  'http://puppet-vagrant-boxes.puppetlabs.com/debian-70rc1-x64-vbox4210.box'
    c.vm.host_name = 'sentry-test'

    Vagrant.configure("2") do |config|
      config.vm.synced_folder ".", "/srv/puppet/modules/sentry"
    end

    c.vm.forward_port 80, 10080
    c.vm.provision :puppet do |puppet|
      puppet.manifests_path = 'vagrant'
      puppet.module_path = ['modules', '.']
      puppet.manifest_file = 'site.pp'

    end
  end

end

