Vagrant.configure("2") do |config|
  
config.vm.box = "ubuntu/trusty32"
config.vm.hostname = "vagrant-ubuntu"
config.vm.network "forwarded_port", guest: 3306, host: 3000

config.vm.provision :shell, path: "setup.sh" 

config.vm.provision "puppet" do |puppet|
  puppet.manifest_file = "default.pp"
  puppet.hiera_config_path = "hiera.yaml"
end

end