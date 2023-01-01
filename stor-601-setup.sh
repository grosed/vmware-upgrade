
# start pyenv
source ~/start-pyenv

# install curl development libraries
sudo apt install -y libcurl4-gnutls-dev
sudo apt install -y libcurl4-nss-dev
sudo apt install -y libcurl4-openssl-dev


# create STOR-601 python environment
cd ${HOME}
mkdir STOR-601-env
cd STOR-601-env
python -m venv env
source ./env/bin/activate
python -m pip install --upgrade pip
# add R package library and create activation script
mkdir R-packages
echo -e "export R_LIBS_SITE=\"\$HOME/STOR-601-env/R-packages\"\nexport R_LIBS_USER=\"\$HOME/STOR-601-env/R-packages\"\n" > start-r-env
chmod +x start-r-env

# install and run jupyter notebook
python -m pip install notebook

# install curl
sudo apt-get install curl

#install bunzip
sudo apt-get install bzip2

# install cling
curl https://root.cern/download/cling/cling_2020-11-05_ROOT-ubuntu2004.tar.bz2 --output cling_2020-11-05_ROOT-ubuntu2004.tar.bz2
tar -xf cling_2020-11-05_ROOT-ubuntu2004.tar.bz2
echo -e "export PATH=\${PATH}:\${HOME}/STOR-601-env/cling_2020-11-05_ROOT-ubuntu2004/bin" > start-cling
chmod +x start-cling

# install jupyter lab
python -m pip install jupyterlab

#install cling kernel
cd ~/STOR-601-env/cling_2020-11-05_ROOT-ubuntu2004/share/cling/Jupyter/kernel
python -m pip install e .
jupyter-kernelspec install --user cling-cpp17
cd ~/STOR-601-env

#install SOS
python -m pip install sos
python -m pip install sos-pbs
python -m pip install sos-notebook
python -m pip install jupyter_contrib_core
python -m sos_notebook.install
python -m pip install sos-xeus-cling
python -m pip install jupyterlab-sos

#install R kernel for jupyter
source start-r-env
echo -e 'install.packages("IRkernel")\nlibrary(IRkernel)\nIRkernel::installspec()\n' > install-r-jupyter-kernel.R
R --no-save < install-r-jupyter-kernel.R
rm install-r-jupyter-kernel.R

# create a start up script
echo -e '#!/bin/bash\nsource ~/start-pyenv\nsource ./env/bin/activate\nsource ./start-cling\nsource ./start-r-env\n' > start-environment
chmod +x start-environment
