Vagrant.configure("2") do |config|

	# configurazioni comuni
	# ubuntu trusty 64 VirtualBox
	config.vm.box = "ubuntu/trusty64"
	
	config.vm.define "db" do |db|
	
		db.vm.hostname = "db"
		db.vm.network "private_network", ip: "192.168.33.11"
		
		db.vm.network "forwarded_port", guest: 22, host: 2222, id: 'ssh', auto_correct: true
        db.ssh.forward_agent = true
	
		# provisioning con bash 
		db.vm.provision :shell, :inline => 'apt-get update'
		
		db.vm.provision :puppet do |puppet|
			puppet.module_path = "puppet/modules"
			puppet.manifests_path = "puppet/manifests"
			puppet.manifest_file  = "init.pp"
			puppet.options = "--verbose --debug"
		end
			
	end
	
	# configurazione server web
	config.vm.define "web" do |web|
	
		web.vm.hostname = "web"
		web.vm.network "private_network", ip: "192.168.33.10"
		
		web.vm.network "forwarded_port", guest: 22, host: 2223, id: 'ssh', auto_correct: true
        web.ssh.forward_agent = true
		
		# provisioning con bash 
		web.vm.provision :shell, :inline => 'apt-get update'
		
		web.vm.provision :puppet do |puppet|
			puppet.module_path = "puppet/modules"
			puppet.manifests_path = "puppet/manifests"
			puppet.manifest_file  = "init.pp"
			puppet.options = "--verbose --debug"
		end
		
	end
	
end