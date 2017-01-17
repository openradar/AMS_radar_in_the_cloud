#!/usr/bin/env bash
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

$conda_bin_path'conda' install -y basemap scipy boto netCDF4

git clone https://github.com/ARM-DOE/pyart

cd ~/pyart

$conda_bin_path'python' setup.py install

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
