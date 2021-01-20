# Installing and Configuring QEWD and QEWD-JSdb

These instructions describe the steps needed to install QEWD and the
associated QEWD-JSdb Explorer applications on an instance of the
IRIS Community Edition Docker Container.


# Pre-Requisites

You'll need Docker and *git* installed on the Linux machine on which you want
to run the IRIS Container.

## Make Sure Docker is Installed

In order to run the IRIS Docker Container, you must, of course,
have Docker installed.

Although you can run Docker Containers on Windows and OS/X, the mechanics are somewhat
clumsy and it's all a bit awkward to use.  Feel free to find out how to use Docker on
Windows or OS/X if you want to try it out.

Howver, Docker is a lot simpler and slicker to use on Linux machines and on the Raspberry Pi, and
the instructions that follow assume these are the systems you'll be using.

If you don't already have Docker installed, there are two main ways to install it.  
The easy way is to do this:

        sudo apt-get install docker.io

You may not get the most up to date version of Docker if you use this approach, but it's
usually perfectly adequate.

The alternative approach is to do the following:

      curl -sSL https://get.docker.com | sh


Whichever method you use to install Docker, by default, it 
will require *root* priveleges to use its commands, requiring the use of
the *sudo* prefix before the *docker* command.

To avoid this, you can do the following:

        sudo usermod -aG docker ${USER}
        su - ${USER}
        
  NB: You'll be asked to enter your user's password

Now you can simply use the *docker* command.


## Install *git*

You'll need to ensure that you can clone this Github Repository to your host machine, so make sure
you have installed *git*.  If not:

        sudo apt-get update
        sudo apt-get install -y git

(or the equivalent for your Linux distribution or operating system)


# Clone this Repository to your Host Machine

Decide on a parent directory into which you'll clone this Repository.  In these instructions
I'll assume you'll use your home directory, eg */home/ubuntu*.

Then clone this Repository:

        cd ~
        git clone https://github.com/robtweed/qewd-jsdb-kit-iris


On completion, you'll find that you have a directory named *~/qewd-jsdb-kit-iris*
containing a copy of this Repository.


# Start the IRIS Docker Container

You can now start the IRIS Docker Container, but you're going to map the
host directory you just created in the previous step so that it becomes available
within the running IRIS Container.

You'll also need to map a couple of TCP ports so they become available via the host machine:

- 52773: the port used by the IRIS System Management Portal
- 8080: the QEWD Web Server Listener port

For example:


        docker run --name my-iris -d --rm -p 9092:52773 -p 8080:8080 -v /home/ubuntu/qewd-jsdb-kit-iris:/home/irisowner/qewd store/intersystems/iris-community:2020.3.0.221.0

You can check that the IRIS container has started and is ready for use by tailing its
log file:

        docker logs -f my-iris


# Install the Core Dependencies needed by QEWD

Shell into the IRIS Container as the *root* user:

        docker exec --user="root" -it my-iris bash

You should see a prompt similar to this:

        root@0f42c3c5cdcb:/home/irisowner#

Then run the configuration script contained in the mapped copy of this Repository:

       source qewd/configure.sh

This will take a few minutes to complete.  On completion you can exit the Container's shell and
return to the host shell: simply type *exit*.


# Install Node.js, QEWD and the QEWD-JSDB Explorer repository

Once again, this is all automated for you.

Shell into the IRIS Container as the normal *irisowner* user:

        docker exec -it my-iris bash

You should see a prompt similar to this:

        irisowner@0f42c3c5cdcb:~$

Then run the installation script contained in the mapped copy of this Repository:

        source qewd/install_qewd.sh


This should just take a few seconds to run.


# Prepare the IRIS Container

You now need to start the IRIS System Management Portal and connect it to the IRIS Container: make
sure you do so via the mapped host port (eg 9092 in the example *docker run* command above).

You need to ensure two things are done:

- change the password for the IRIS *_SYSTEM* username to *secret*.  When you start the
System Management Portal you'll be forced to change the password.

- enable the Callin Service.  You do this by selecting from the System Management Portal menu:

  - System Admininstration
    - Security
      - Services

  Near the top of the list you'll find the service named *%Service Callin*.  Select this and check
the *Enable Service* checkbox.


# Start QEWD for the First Time

Make sure you have shelled into the IRIS Container as the normal *irisowner* user and type:

        cd ~/qewd-jsdb
        npm start

The first time you do this, QEWD will install and configure a number of further dependencies, after
which it will quit.


# Starting QEWD

Thereafter, you simply start QEWD by repeating the commands:

        cd ~/qewd-jsdb
        npm start

You are now ready to begin exploring QEWD-JSdb!


# Stopping QEWD

Simply type *CTRL&C* in the Container shell process: the QEWD Node.js process will shut down.


