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
  # dummy box as the aws does not need to use Vagrant box file.
  config.vm.box = "dummy"
  ## configuration for user webserver
  config.vm.define "webserver-user" do |webserver_user|

    webserver_user.vm.provider :aws do |aws, override|
      # Set the name.
      aws.tags = { 'Name' => 'Production Web Server' }
      # The region for Amazon Educate.
      aws.region = "us-east-1"
      # To force synchronization of the files to the VM's
      override.nfs.functional = false
      override.vm.allowed_synced_folder_types = :rsync
      
      # Tells amazon which key to use.
      aws.keypair_name = "cosc349-labs"
      # File location path for the private key.
      override.ssh.private_key_path = "D:/uni/cosc/349/ssh_keys/cosc349-labs.pem"
      
      # Choose Amazon EC2 insatnce type.
      aws.instance_type = "t2.micro"
      
      # List of security groups VM is in.
      aws.security_groups = ["sg-0382f522d54553d2e"]
      
      # Needs to select a specific availibility zone.
      aws.availability_zone = "us-east-1a"
      # The subnet id.
      aws.subnet_id = "subnet-3372a96c"

      # Choose the hard disk image to use.
      aws.ami = "ami-0c43b23f011ba5061"
      
      # Only when using ubantu, so the vagrant connects using this name.
      override.ssh.username = "ubuntu"
      override.vm.provision :shell, :path => "vm_setup/apache_prod.sh"
    end
  end

   ## configuration for user webserver
  config.vm.define "webserver-admin" do |webserver_admin|
  
    webserver_admin.vm.provider :aws do |aws, override|
      # Set the name.
      aws.tags = { 'Name' => 'Developer Web Server' }
      # The region for amazon educate.
      aws.region = "us-east-1"
      #  To force synchronization of the files to the VM's
      override.nfs.functional = false
      override.vm.allowed_synced_folder_types = :rsync
      # Tells amazon which key to use.
      aws.keypair_name = "cosc349-labs"
      # File path location for the key.
      override.ssh.private_key_path = "D:/uni/cosc/349/ssh_keys/cosc349-labs.pem"
      
      # Choose the Amazon EC2 instance.
      aws.instance_type = "t2.micro"
      # Security group
      aws.security_groups = ["sg-0382f522d54553d2e"]

      aws.availability_zone = "us-east-1a"
      aws.subnet_id = "subnet-3372a96c"

      aws.ami = "ami-0c43b23f011ba5061"

      override.ssh.username = "ubuntu"
      override.vm.provision :shell, :path => "vm_setup/apache_dev.sh"
    end
  end

end
