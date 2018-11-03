# Install
sudo dnf install vagrant
cd /etc/yum.repos.d/
sudo wget http://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo
sudo dnf install binutils gcc make patch libgomp glibc-headers glibc-devel kernel-headers kernel-devel dkms
sudo dnf install VirtualBox-5.2
sudo /usr/lib/virtualbox/vboxdrv.sh setup
sudo usermod -a -G vboxusers ${USER}

# Test
vagrant init centos/7
vagrant up --provider libvirt
