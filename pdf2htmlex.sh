#!/bin/sh

###Install new pdf2htmlEX
echo -e "============= \n"
echo -e "Start install pdf2htmlex \n"
echo -e "============= \n"
apt-get update
apt-get upgrade
apt-get install gcc git python-pip python-dev build-essential software-properties-common python-software-properties sudo cmake xvfb nano curl -y
sudo apt-get install python-pip python-dev build-essential 
sudo pip install --upgrade pip 
sudo pip install --upgrade virtualenv
cd /tmp/
mkdir code
cd code/
git clone --depth=50 --branch=incoming git://github.com/coolwanglu/pdf2htmlEX.git 
cd pdf2htmlEX
export SAUCE_USERNAME=[secure]
export SAUCE_ACCESS_KEY=[secure]
export CXX=g++
export CC=gcc
gcc --version
sudo add-apt-repository ppa:fontforge/fontforge --yes
sudo add-apt-repository ppa:coolwanglu/pdf2htmlex --yes
sudo apt-get update
sudo apt-get install libpoppler-dev libpoppler-private-dev libspiro-dev libcairo-dev libfontforge-dev fontforge
sudo pip install selenium sauceclient
export DISPLAY=:99.0
test/start_xvfb.sh
pushd /
python -m SimpleHTTPServer 8000 >/dev/null 2>&1 &
popd
sleep 5
cmake -DENABLE_SVG=ON .
make
sudo make install
/usr/local/bin/pdf2htmlEX -v
echo -e "============= \n"
###install wkhtmltopdf
cd /tmp/
wget http://downloads.sourceforge.net/wkhtmltopdf/wkhtmltox-0.12.2.1_linux-precise-amd64.deb
apt-get autoremove
dpkg -i wkhtmltox-0.12.2.1_linux-precise-amd64.deb
echo -e "============= \n"
###install nodeJS
cd /tmp
curl -sL https://deb.nodesource.com/setup | sudo bash -
apt-get install nodejs -y
