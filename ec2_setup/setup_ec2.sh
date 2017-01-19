#!/usr/bin/env bash
#Shell script to provision an Ubuntu EC2 instance with a Py-ART Jupyter notebook
#Environment. Instance must have 8888 and https open
#Code adapted from https://gist.github.com/yangj1e/3641843c758201ebbc6c (Modified to Python3.5)

echo '--------'
echo 'Apt Gets'
echo '--------'

sudo apt-get -y update
sudo apt-get -y install gcc gfortran

echo '--------------------'
echo 'Installing Miniconda'
echo '--------------------'

wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b

#For some reason updating path and sourcing bashrc does not work
#during the script so we use the FQ path


echo "APPENDING PATH"
echo 'PATH="$HOME/miniconda3/bin:$PATH"' >> ~/.bashrc
export PATH="$HOME/miniconda3/bin:$PATH"

conda update -y conda

echo '----------------------------------'
echo 'Provisioning the Conda environment'
echo '----------------------------------'

cd $HOME/AMS_radar_in_the_cloud/ec2_setup/

conda env create -f environment.yml
source activate ams-workshop

echo '-------------------------'
echo 'Pyart Install from source'
echo '-------------------------'

cd ~
wget https://github.com/ARM-DOE/pyart/archive/master.tar.gz
tar xf master.tar.gz
cd ~/pyart-master
python setup.py install

cd ~

echo '-----------------------'
echo 'Provisioning test file '
echo 'To order ARM data go to'
echo '     www.arm.gov       '
echo '-----------------------'

wget https://s3.amazonaws.com/amsworkshop/110635.mdv

#WARNING: Temporary ARM file. This will be changed at a later date 
#Do not use this file for anything but the course. 


echo '----------------------------'
echo 'Configuring Jupyter Notebook'
echo '----------------------------'


jupyter notebook --generate-config

echo "ENTER YOUR PASSWORD"

key=$(python -c "from notebook.auth import passwd; print(passwd())")

cd ~
mkdir certs
cd certs
certdir=$(pwd)

openssl req -new -newkey rsa:2048 -days 365 -nodes -x509 \
    -subj "/C=XX/ST=XX/L=XX/O=generated/CN=generated" \
    -keyout mycert.key -out mycert.pem

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
echo 'source activate ams-workshop'
echo 'jupyter notebook --certfile=~/certs/mycert.pem --keyfile ~/certs/mycert.key'
echo 'You can then point your browser at : https://ec2-A-B-C-D.compute-1.amazonaws.com:8888'
echo 'where  https://ec2-A-B-C-D.compute-1.amazonaws.com is the FQDN of the instance'
echo 'Note: You will need to add a certificate exception in your browser'

echo "Our GUESS (prone to breakage) is:"
echo $guess_at_aws_fqdn

