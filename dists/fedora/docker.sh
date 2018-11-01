sudo dnf install docker

# Allow nonsudo user use docker
sudo groupadd docker && sudo gpasswd -a ${USER} docker && sudo systemctl restart docker
newgrp docker

# Enable docker at startup
sudo systemctl enable docker

systemctl start docker
