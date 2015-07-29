#!/usr/bin/env bash

echo "Setting up the virtual machine"
sudo apt-get autoclean && sudo apt-get update && sudo apt-get upgrade
echo "Installing Puppet"
sudo apt-get install puppet -y
echo "Installing Puppet's MySQL module"
sudo puppet module install puppetlabs-mysql
echo "Installing stdlib"
puppet module install --force puppetlabs-stdlib
echo "Done"