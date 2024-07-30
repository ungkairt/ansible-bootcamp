Vagrant.configure("2") do |config|
  config.vm.box = "generic/ubuntu2204"

  config.ssh.username = 'vagrant'
  config.ssh.password = 'vagrant'
  config.ssh.insert_key = 'true'

  config.vm.provider 'virtualbox' do |vb|
    #v.gui = true
    vb.memory = '2048'
    vb.cpus = 2
  end

  config.vm.provision "shell", inline: <<-SHELL
     apt-get update
     apt-get upgrade -y
     curl -o- https://raw.githubusercontent.com/ppp3ppj/ansible-bootcamp/main/resources/setup | sh -
   SHELL
  #config.vm.provision :shell, inline: "sudo apt upgrade -y"
end
