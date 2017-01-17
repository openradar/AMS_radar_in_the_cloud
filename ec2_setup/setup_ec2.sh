#!/usr/bin/env bash
#Shell script to provision an Ubuntu EC2 instance with a Py-ART Jupyter notebook
#Environment. Instance must have 8888 and https open
#Code adapted from https://gist.github.com/yangj1e/3641843c758201ebbc6c (Modified to Python3.5)

echo '--------'
echo 'Apt Gets'
echo '--------'

sudo apt-get -y update
sudo apt-get -y install gcc gfortran

echo '-------------------'
echo 'Installing Anaconda'
echo '-------------------'

cd ~
wget https://repo.continuum.io/archive/Anaconda3-4.2.0-Linux-x86_64.sh
bash Anaconda3-4.2.0-Linux-x86_64.sh -b

#For some reason updating path and sourcing bashrc does not work
#during the script so we use the FQ path

conda_bin_path="/home/ubuntu/anaconda3/bin/" 

echo "APPENDING PATH"
cd ~
echo 'PATH="/home/ubuntu/anaconda3/bin:$PATH"' >> .bashrc

. .bashrc

#export VARNAME='PATH="/home/ubuntu/anaconda3/bin:$PATH"'

$conda_bin_path'conda' update -y conda

#provision

echo '----------------------'
echo 'Provisioning via Conda'
echo '----------------------'

$conda_bin_path'conda' install -y basemap scipy boto netCDF4

echo '----------------------------'
echo 'Provisioning via Conda Forge'
echo '----------------------------'

$conda_bin_path'conda' install -c scitools cartopy

echo '----------------------'
echo 'Provisioning via Pip'
echo '----------------------'

echo '-------------------------'
echo 'Pyart Install from source'
echo '-------------------------'

git clone https://github.com/ARM-DOE/pyart

cd ~/pyart

$conda_bin_path'python' setup.py install

echo '----------------------------'
echo 'Configuring Jupyter Notebook'
echo '----------------------------'

cd ~

$conda_bin_path'jupyter' notebook --generate-config

echo "ENTER YOUR PASSWORD"

key=$($conda_bin_path'python' -c "from notebook.auth import passwd; print(passwd())")

cd ~
mkdir certs
cd certs
certdir=$(pwd)

echo "IF YOU WANT, ENTER YOUR DETAILS OR JUST PRESS ENTER"

openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout mycert.key -out mycert.pem

cd ~
sed -i "1 a\
c = get_config()\\
c.NotebookApp.certfile = u'$certdir/mycert.pem'\\
c.NotebookApp.ip = '*'\\
c.NotebookApp.open_browser = False\\
c.NotebookApp.password = u'$key'\\
c.NotebookApp.port = 8888" .jupyter/jupyter_notebook_config.py

#AWS Magic
guess_at_aws_fqdn="https://"`curl -s http://169.254.169.254/latest/meta-data/public-hostname`":8888"

echo '---------------------'
echo 'Installation complete'
echo '---------------------'
echo ' '
echo 'To Run execute'
echo '. ~/.bashrc'
echo 'jupyter notebook --certfile=~/certs/mycert.pem --keyfile ~/certs/mycert.key'
echo 'You can then point your browser at : https://ec2-A-B-C-D.compute-1.amazonaws.com:8888'
echo 'where  https://ec2-A-B-C-D.compute-1.amazonaws.com is the FQDN of the instance'
echo 'Note: You will need to add a certificate exception in your browser'

echo "Our GUESS (prone to breakage) is:"
echo $guess_at_aws_fqdn

