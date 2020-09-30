echo "user web server has started"
apt-get update
    
apt-get install -y apache2 php libapache2-mod-php php-mysql mysql-client
# Change VM's webserver's configuration to use shared folder.
cp /vagrant/conf/admin.conf /etc/apache2/sites-available/
# activate website configuration
a2ensite admin
# disable the default website provided with Apache
a2dissite 000-default
# Reload the webserver configuration, to pick up our changes
systemctl reload apache2