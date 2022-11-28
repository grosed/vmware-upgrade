
sudo cp /etc/fstab /etc/fstab.saf
sudo echo //luna.lancs.ac.uk/FST/MA/Stor-i/${USER} ${HOME}/luna cifs domain=LANCS,noauto,rw,users,sec=krb5,vers=3.1.1 0 0 >> /etc/fstab
mkdir ${HOME}/luna-new
