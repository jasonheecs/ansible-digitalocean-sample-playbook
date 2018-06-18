# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "$HOME/.ssh/id_rsa.pub"
end