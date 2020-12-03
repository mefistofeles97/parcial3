# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

config.vm.define :maquina2 do |maquina2|
maquina2.vm.box = "bento/centos-7.8"
maquina2.vm.network :private_network, ip: "192.168.50.70"
maquina2.vm.provision "shell", path: "streaming.sh"
maquina2.vm.hostname = "maquina2"
end

config.vm.define :firewall do |firewall|
firewall.vm.box = "bento/centos-7.8"
firewall.vm.network :public_network, ip: "192.168.1.101"
firewall.vm.network :private_network, ip: "192.168.50.71"
firewall.vm.provision "shell", path: "firewall.sh"
firewall.vm.hostname = "firewall"

end

end