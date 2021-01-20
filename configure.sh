#!/bin/bash

# Install QEWD and QEWD-JSdb Explorer on the IRIS Docker Container

apt-get update && apt-get -y upgrade
apt-get install -y curl build-essential python-minimal locate nano sudo git
updatedb

echo " "
echo "Your IRIS Container is ready for QEWD to be installed"
echo "Shell into the IRIS Container as the normal irisowner user:"
echo "     docker exec -it my-iris bash"
echo " "
echo "and then install QEWD by typing:"
echo "     source qewd/install_qewd.sh"
echo " "

