#!/bin/bash -e
# SPDX-License-Identifier: BSD-3-Clause
#
# kuiper2.0 - Embedded Linux for Analog Devices Products
#
# Copyright (c) 2025 Analog Devices, Inc.
# Author: Brent Kowal <brent.kowal@analog.com>

############## GUIDELINES ##############

# - This script is run inside 'chroot'. 
# 	* it works as if Kuiper is running on a system with a few limitations
# 	* check 'chroot' documentation for more informations
# - This script is run as root, there is no need to use 'sudo' command.
# - Current directory is '/' (root) of the Kuiper rootfs.
# - If a file needs to be copied, it should be placed inside 'adi-kuiper-gen'.
# - If a variable from the configuration file is needed, source the config file to access its value.
# - At this stage the Kuiper image is not yet partitioned. In order to modify what will be in the boot partition access /boot folder.
# - This script will not be in the resulted image. If this is necessary it should be copied manually.

apt-get install -y xrdp
apt-get install -y iperf iperf3

#Set the flag to avoid the wireshark confirmation screen
echo "wireshark-common wireshark-common/install-setuid boolean true" | debconf-set-selections
apt-get install -y wireshark

#Add the analog user to wireshark group
adduser analog wireshark

cd /usr/local/src

#VS Code instructions per microsoft
echo "code code/add-microsoft-repo boolean true" | debconf-set-selections
apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg
apt-get install apt-transport-https
apt-get update
apt-get install code # or code-insiders

