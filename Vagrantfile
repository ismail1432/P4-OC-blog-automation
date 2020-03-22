# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
     config.vm.define "gitlab-pipeline" do |gitlab|
     gitlab.vm.box = "debian/buster64"
     gitlab.vm.hostname = "gitlab-pipeline"
     gitlab.vm.box_url = "debian/buster64"
     gitlab.vm.network :private_network, ip: "192.168.5.10"
     gitlab.vm.provider :virtualbox do |v|
       v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
       v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
       v.customize ["modifyvm", :id, "--memory", 2048]
       v.customize ["modifyvm", :id, "--name", "gitlab-pipeline"]
       v.customize ["modifyvm", :id, "--cpus", "1"]
     end
     config.vm.provision "shell", inline: <<-SHELL
       sed -i 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g' /etc/ssh/sshd_config
       service ssh restart
     SHELL
    gitlab.vm.provision "shell", path: "install_gitlab.sh"
    gitlab.vm.provision "shell", path: "install_pelican.sh"
end
end
