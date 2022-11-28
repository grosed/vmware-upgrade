# check for updates
sudo apt-get update

# fix firefox
### remove snap firefox
sudo snap remove firefox
### add repo
sudo add-apt-repository ppa:mozillateam/ppa
### set repo pref for firefox
echo '
Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001
' | sudo tee /etc/apt/preferences.d/mozilla-firefox
### set unattended upgrades to non-snap
echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox
### install non-snap firefox
sudo apt install firefox

# install additional development libraries
sudo apt-get install libsqlite3-dev
sudo apt-get install libssl-dev
sudo apt-get install libffi-dev
sudo apt-get install zlib1g-dev
sudo apt-get install libncurses5-dev libncursesw5-dev
sudo apt-get install libreadline6 libreadline6-dev
sudo apt-get install libreadline-dev
sudo apt-get install  libbz2-dev
sudo apt-get install python-tk
sudo apt-get install python3-tk
sudo apt-get install tk-dev
sudo apt-get install lzma
sudo apt-get install liblzma-dev
sudo apt-get install libxml2-dev
sudo apt-get install libharfbuzz-dev
sudo apt-get install libfribidi-dev
sudo apt-get install libfreetype6-dev
sudo apt-get install libpng-dev
sudo apt-get install libtiff5-dev
sudo apt-get install libjpeg-dev


# install git
sudo apt-get install git

#install and configure pyenv
git clone https://github.com/pyenv/pyenv.git ./.pyenv
echo -e "export PATH=\"\$HOME/.pyenv/bin:\$PATH\"\neval \"\$(pyenv init --path)\"\n" > start-pyenv
chmod +x start-pyenv


#instal gcc
sudo apt install build-essential

# start pyenv and install a version of python
source ./start-pyenv
pyenv install 3.9.10
pyenv global 3.9.10

# upgrade pip
python -m pip install --upgrade pip

#install R
sudo apt-get install r-base

# install curl
sudo apt-get install curl

#install bunzip
sudo apt-get install bzip2

# setup luna
# backup fstab
sudo cp /etc/fstab /etc/fstab.saf
# add luna to fstab
echo //luna.lancs.ac.uk/FST/MA/Stor-i/${USER} ${HOME}/luna cifs domain=LANCS,noauto,rw,users,sec=krb5,vers=3.1.1 0 0 | sudo tee -a /etc/fstab
# make the luna directory under the home directory
mkdir ${HOME}/luna
# start luna
mount.cifs //luna.lancs.ac.uk/FST/MA/Stor-i/${USER} ${HOME}/luna


