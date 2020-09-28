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
# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # Replave the box with dummy one, bcz AWS does not need a box.
  config.vm.box = "dummy"

  config.vm.provider :aws do |aws, override|
    # just in case if we have not given access to vagrant in our credentials
    # We can gather the data for these three aws configuration
    # parameters from environment variables (more secure than
    # committing security credentials to your Vagrantfile).
    #
    #aws.access_key_id = ""
    #aws.secret_access_key = ""
    #aws.session_token = ""

    # The region for Amazon Educate is fixed. You can see your AWS EC2 browser.
    aws.region = "us-east-1"

    # These options force synchronisation of files to the VM's
    # /vagrant directory using rsync, rather than using trying to use
    # SMB (which will not be available by default).
    override.nfs.functional = false
    override.vm.allowed_synced_folder_types = :rsync

    # The keypair_name parameter tells Amazon which public key to use.
    aws.keypair_name = "<INSERT KEY NAME HERE>"
    # The private_key_path is a file location in your macOS account
    # (e.g., ~/.ssh/something).
    override.ssh.private_key_path = "~/.ssh/<name of pem file>"

    # Here choose Amazon EC2 instance type (t2.micro is cheap).
    aws.instance_type = "t2.micro"

    # You need to indicate the list of security groups your VM should
    # be in. Each security group will be of the form "sg-...", and
    # they should be comma-separated (if you use more than one) within
    # square brackets.
    #
    aws.security_groups = ["<INSERT SECURITY GROUP ID HERE>"]

    # Vagrant requires the availibility zone and subnet ID.
    aws.availability_zone = "us-east-1a"
    aws.subnet_id = "subnet-95fa19d8"
    #aws.subnet_id = "subnet-3372a96c"
    #
    # Choose the AMI (i.e., hard disk image) to use.
    aws.ami = "ami-0f40c8f97004632f9"
    # Uncomment the line below only when using an ubuntu AMI.
    override.ssh.username = "ubuntu"
  end



  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end
