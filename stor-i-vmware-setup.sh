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
sudo apt install -y firefox

# install additional development libraries
sudo apt install -y libsqlite3-dev
sudo apt install -y libssl-dev
sudo apt install -y libffi-dev
sudo apt install -y zlib1g-dev
sudo apt install -y libncurses5-dev libncursesw5-dev
sudo apt install -y libreadline6 libreadline6-dev
sudo apt install -y libreadline-dev
sudo apt install -y libbz2-dev
sudo apt install -y python-tk
sudo apt install -y python3-tk
sudo apt install -y tk-dev
sudo apt install -y lzma
sudo apt install -y liblzma-dev
sudo apt install -y libxml2-dev
sudo apt install -y libharfbuzz-dev
sudo apt install -y libfribidi-dev
sudo apt install -y libfreetype6-dev
sudo apt install -y libpng-dev
sudo apt install -y libtiff5-dev
sudo apt install -y libjpeg-dev
sudo apt install -y libclang-dev
sudo apt install -y libpq5
sudo apt install -y libcurl-dev

# install git
sudo apt install -y git

#install and configure pyenv
git clone https://github.com/pyenv/pyenv.git ./.pyenv
echo -e "export PATH=\"\$HOME/.pyenv/bin:\$PATH\"\neval \"\$(pyenv init --path)\"\n" > start-pyenv
chmod +x start-pyenv


#install gcc
sudo apt install -y build-essential

# start pyenv and install a version of python
source ./start-pyenv
pyenv install 3.9.10
pyenv global 3.9.10

# upgrade pip
python -m pip install --upgrade pip

#install R
sudo apt install -y r-base

# install curl
sudo apt install -y curl

# install R studio
wget https://rstudio.org/download/latest/stable/desktop/jammy/rstudio-latest-amd64.deb -O ${HOME}/Downloads/rstudio.deb
sudo dpkg -i ${HOME}/Downloads/rstudio.deb

#install bunzip
sudo apt install -y bzip2

# setup luna
# backup fstab
sudo cp /etc/fstab /etc/fstab.saf
# add luna to fstab
echo //luna.lancs.ac.uk/FST/MA/Stor-i/${USER} ${HOME}/luna cifs domain=LANCS,noauto,rw,users,sec=krb5,vers=3.1.1 0 0 | sudo tee -a /etc/fstab
# make the luna directory under the home directory
mkdir ${HOME}/luna
# start luna
mount.cifs //luna.lancs.ac.uk/FST/MA/Stor-i/${USER} ${HOME}/luna
