# Java #

Manage the Java runtime for use with other application software.

Currently this simply deploys the package on Enterprise Linux based systems and Debian based systems.

Tested on:

 * Centos 5.6
 * Ubuntu 10.04 Lucid

# RedHat Support #

This fork of the module uses the openjdk versions of the jre and jdk. These
are available in the el5 base repository.

# Ubuntu Support #

## Lucid ##

You need to have the partner repository enabled in order to install the Sun JDK or JRE.

    aptitude install python-software-properties
    sudo add-apt-repository "deb http://archive.canonical.com/ lucid partner"
    aptitude update

