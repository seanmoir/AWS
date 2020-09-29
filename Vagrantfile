# -*- mode: ruby -*-
# vi: set ft=ruby :

# AWS connect fix
class Hash
  def slice(*keep_keys)
    h = {}
    keep_keys.each { |key| h[key] = fetch(key) if has_key?(key) }
    h
  end unless Hash.method_defined?(:slice)
  def except(*less_keys)
    slice(*keys - less_keys)
  end unless Hash.method_defined?(:except)
end

Vagrant.configure("2") do |config|

  config.vm.box = "dummy"

  config.vm.define "webserver-user" do |webserver_user|

    webserver_user.vm.provider :aws do |aws, override|

      aws.tags = { 'Name' => 'Production Web Server' }
      aws.region = "us-east-1"

      override.nfs.functional = false
      override.vm.allowed_synced_folder_types = :rsync

      aws.keypair_name = "cosc349-labs"
      override.ssh.private_key_path = "D:/uni/cosc/349/ssh_keys/cosc349-labs.pem"

      aws.instance_type = "t2.micro"

      aws.security_groups = ["sg-0382f522d54553d2e"]

      aws.availability_zone = "us-east-1a"
      aws.subnet_id = "subnet-3372a96c"

      aws.ami = "ami-013da1cc4ae87618c"

      override.ssh.username = "ubuntu"
    end
  end

  
  config.vm.define "webserver-admin" do |webserver_admin|

    webserver_admin.vm.provider :aws do |aws, override|

      aws.tags = { 'Name' => 'Developer Web Server' }
      aws.region = "us-east-1"

      override.nfs.functional = false
      override.vm.allowed_synced_folder_types = :rsync

      aws.keypair_name = "cosc349-labs"
      override.ssh.private_key_path = "D:/uni/cosc/349/ssh_keys/cosc349-labs.pem"

      aws.instance_type = "t2.micro"

      aws.security_groups = ["sg-0382f522d54553d2e"]

      aws.availability_zone = "us-east-1a"
      aws.subnet_id = "subnet-3372a96c"

      aws.ami = "ami-013da1cc4ae87618c"

      override.ssh.username = "ubuntu"
    end
  end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end
