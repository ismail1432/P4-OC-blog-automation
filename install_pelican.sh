echo "**************************"
echo "*** Installing Pelican ***"
echo "**************************"

apt-get install -y python-pip
pip install -r /vagrant/pelican/requirements.txt
