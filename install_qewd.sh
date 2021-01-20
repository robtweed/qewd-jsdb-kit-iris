#!/usr/bin/env bash

if [ -f "/usr/bin/node" ]; then

  echo "Node.js appears to have already been installed - aborting"

else

  VERSION=${1:-14}

  echo 'Installing Node.js'

  cd ~

  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

  nvm install $VERSION

  echo 'Node.js has been installed.  Check by typing: node -v'

fi

git clone https://github.com/robtweed/qewd-jsdb
cp ~/qewd/package.json ~/qewd-jsdb
cp ~/qewd/jsdb_shell.js ~/qewd-jsdb
cp ~/qewd/loadxml.js ~/qewd-jsdb
cp ~/qewd/loadtext.js ~/qewd-jsdb
cp ~/qewd/example.xml ~/qewd-jsdb
cp ~/qewd/config.json ~/qewd-jsdb/configuration
cd qewd-jsdb
npm install

iris session IRIS < ~/qewd/install_interface.txt

echo "Your IRIS Container is now ready for use with QEWD and QEWD-JSdb"
echo "First, you MUST make sure you connect to the IRIS Container from the"
echo "IRIS System Management Portal and do two things:"
echo " "
echo "- change the _SYSTEM user password to 'secret'"
echo "- Select System Administration/Security/Services and enable the service named %Service Callin"
echo " "
echo "Then, from the ~/qewd-jsdb directory, start QEWD by typing"
echo "   npm start"
echo " "



