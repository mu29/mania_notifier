cd
mkdir python
cd python
mkdir src
cd src
wget http://www.python.org/ftp/python/2.7.6/Python-2.7.6.tgz
tar xvfz Python-2.7.6.tgz
cd Python-2.7.6
mkdir ~/python/python27
./configure -prefix=/home/mu29/python/python27
make
make install
cd
echo "export PATH=$HOME/python/python27/bin" >> .bashrc
source .bashrc

cd ~/python
wget http://pypi.python.org/packages/source/s/setuptools/setuptools-0.6c11.tar.gz --no-check-certificate
tar xvfz setuptools-0.6c11.tar.gz
cd setuptools-0.6c11
python setup.py install
cd ..
wget http://pypi.python.org/packages/source/p/pip/pip-1.1.tar.gz --no-check-certificate
tar xvfz pip-1.1.tar.gz
cd pip-1.1
python setup.py install
cd

