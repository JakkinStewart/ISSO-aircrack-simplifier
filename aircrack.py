#! /usr/bin/env python
# Written by Joshua Jordi

## For later on. OS detection
#import platform
#print(platform.system())

import os
#if os.geteuid() != 0:
#    exit("Run as root.")
    # Find way to make function to add sudo to command instead of running as root. Security issue.

#os.system("airmon-ng check kill")
#wireless = os.system("ip link show | grep w | gawk '{ print $2 }' | sed 's/:$//'")

#os.system("airmon-ng start " + str(wireless))
systemd = os.system("file /sbin/init | grep systemd > /dev/null")
if systemd != 0:
    exit("Not on systemd")
