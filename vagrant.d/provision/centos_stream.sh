#!/bin/bash

#######################################################################################
# The CentOS Linux 8 packages have been removed from the mirrors. 
# If you haven’t already, convert any CentOS Linux 8 installations to Stream 8
#######################################################################################
dnf -y --disablerepo '*' --enablerepo extras swap centos-linux-repos centos-stream-repos
dnf -y distro-sync

