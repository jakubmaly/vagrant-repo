# Basic Vagrant box (Ubuntu) with Puppet and MariaDB

####Table of Contents

1. [Description](#description)
2. [Overview](#overview)
3. [Requirements](#requirements)
4. [How to use](#how-to-use)
5. [Tips](#Tips)

##Description

This Vagrant "repository" creates a virtual machine with Ubuntu 14.04 (32bit). Additionally, Puppet is installed and used to provision the machine with MariaDB and configure a database and a user on it. The module to manage the database server is Puppet's officially supported puppetlabs-mysql module.

##Overview

1. Vagrantfile downloads official "boxed" version of Ubuntu 14.04 from Vagrant's catalog
2. Sets its hostname to "vagrant-ubuntu"
3. Forwards the default port on which MySQL server is running (3306) to port 3000 on the host machine
4. The shell script (../setup.sh) installs Puppet and Puppet's MySQL and stdlib modules
5. Puppet installs packages mariadb-server and mariadb-client
6. Puppet reads values stored in Hiera and uses them to set up a database and a user
7. Puppet uses the stdlib module's type file_line to edit my.cnf and /etc/hosts to allow connections to the MariaDB server from the host machine (anywhere)

##Requirements

In order to run this environment, the host machine has to have Vagrant installed (https://www.vagrantup.com/), as well as a virtualization provider, such as Virtualbox, VMware, Parallels,...
This Vagrant environment was tested with Virtualbox, but is expected to work with other providers, since it uses no provider-specific settings (however this is may not always be the case). Please note that by default, Virtualbox assigns Vagrant machines 512 MB of RAM. This can be changed, but is a provider specific setting. See the documentation: http://docs.vagrantup.com/v2/

##How to use

```bash

```